package ga.dgmarket.gymshopping.controller.member;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import ga.dgmarket.gymshopping.domain.Member;
import ga.dgmarket.gymshopping.exception.FileHandleException;
import ga.dgmarket.gymshopping.exception.MemberExistException;
import ga.dgmarket.gymshopping.exception.UploadException;
import ga.dgmarket.gymshopping.model.common.file.FileManager;
import ga.dgmarket.gymshopping.model.service.member.MemberService;



/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private FileManager fileManager;
	
	//로그인 폼 요청 처리
		@RequestMapping(value="/loginform",  method=RequestMethod.GET)
		public String loginForm() {
			
			return "member/login/loginform";
		}
		
		//로그인 요청 처리
		@RequestMapping(value="/login", method=RequestMethod.POST)
		public String login(Member member, HttpSession session, Model model) {
			logger.info("아이디는 {}",member.getUser_id());
			
			//3단계: 일 시키기
			Member obj=memberService.login(member);
			
			//4단계: 저장
			session.setAttribute("member",obj);
			model.addAttribute("member",obj);
			
			return "member/main/index";
		}
		
		//회원가입 폼 요청
		@GetMapping("/registform")
		public String joinForm(Model model) {
			return "member/join/regist";
		}
		
		//회원가입 요청
		@PostMapping("/main/regist")
		public String join(Member member, HttpServletRequest request) {
			
			//VO에 등록한 MultipartFile 객체에 업로드된 파일이 이미 들어있으므로 개발자는 이 객체를 이용하여 업로드된 파일을 원하는대로 제어하면 된다
			MultipartFile photo=member.getPhoto();
			ServletContext context=request.getServletContext();
			long time=System.currentTimeMillis();//현재 날짜 구하기
			
			//원하는 위치에 파일 저장하기
			String filename=time+"."+fileManager.getExt(photo.getOriginalFilename());
			fileManager.saveFile(context, filename, photo);
			member.setProfile_img(filename);
			memberService.regist(member);
			
			return "member/main/index";
			
		}
		
		//회원정보상세 요청
		@GetMapping("/join/detail")
		public String getDetail(int member_id, Model model) {
			Member member=memberService.select(member_id);
			List memberList=memberService.selectAll();
			
			model.addAttribute("member",member);
			model.addAttribute("memberList",memberList);
			
			return "member/join/content";
		}
		
		//회원탈퇴요청처리
		@PostMapping("/join/del")
		public String delete(Member member, HttpServletRequest request) {
			memberService.delete(member);
			fileManager.deleteFile(request.getServletContext(), member.getProfile_img());
			
			return "member/main/index";
		}
		
		
		//위의 요청을 처리하는 메서드 중에서 어느것 하나라도 예외가 발생하면 아래의 메서드가 동작하게 됨
		@ExceptionHandler(MemberExistException.class)
		public String handleException(MemberExistException e, Model model) {
			model.addAttribute("정보가 올바르지 않습니다.",e);//에러객체 저장
			
			return "member/login/loginform";
		}
		
		@ExceptionHandler(UploadException.class)
		public String handleException(UploadException e, Model model) {
			model.addAttribute("e",e); //에러객체 담기
			
			return "error/result";
		}
		
		@ExceptionHandler(FileHandleException.class)
		public String handleException(FileHandleException e, Model model) {
			model.addAttribute("e",e); //에러객체 담기
			return "error/result";
		}
	
}