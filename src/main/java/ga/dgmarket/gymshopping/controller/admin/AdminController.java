package ga.dgmarket.gymshopping.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import ga.dgmarket.gymshopping.domain.Admin;
import ga.dgmarket.gymshopping.domain.Member;
import ga.dgmarket.gymshopping.exception.MemberExistException;
import ga.dgmarket.gymshopping.model.service.admin.AdminService;
import ga.dgmarket.gymshopping.model.service.member.MemberService;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	@Autowired
	private AdminService adminService;
	@Autowired
	private MemberService memberService;
	@GetMapping("/loginform")
	public String loginForm() {
		return "admin/login/loginform";
	}
	//관리자 로그인
	@PostMapping("/login")
	public String login(Admin admin, HttpSession session, Model model) {
		logger.info("관리자id = {}",admin.getHost_id());
		Admin obj = adminService.login(admin);
		session.setAttribute("admin", obj);
		model.addAttribute("admin", obj);
		return "redirect:/admin/main/index";
	}
	
	@GetMapping("/main/index")
	public String adminMain() {
		return "admin/login/index";
	}
	//모든 회원 가져오기
	@GetMapping("/main/member")
	public String admin_member(Model model) {
		List memberList = memberService.selectAll();
		int cnt = memberService.countUser();
		model.addAttribute("memberList",memberList);
		model.addAttribute("cnt",cnt);
		return "admin/main/member";
	}
	//단일 회원 가져오기
	@GetMapping("/main/member/detail")
	public String getDetail(int member_id, Model model) {
		Member member = memberService.select(member_id);
		model.addAttribute("member",member);
		return "admin/main/member/detail";
	}
	@GetMapping("/main/product")
	public String admin_product() {
		return "admin/main/product";
	}
	@GetMapping("/main/qna")
	public String admin_qna() {
		return "admin/main/qna";
	}
	//위의 요청을 처리하는 메서드 중에서 어느것 하나라도 예외가 발생하면 아래의 메서드가 동작하게 됨
	@ExceptionHandler(MemberExistException.class)
	public String handleException(MemberExistException e, Model model) {
		model.addAttribute("정보가 올바르지 않습니다.",e);//에러객체 저장
		
		return "admin/login/loginform";
	}
}
