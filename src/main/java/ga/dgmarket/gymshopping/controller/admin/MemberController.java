package ga.dgmarket.gymshopping.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import ga.dgmarket.gymshopping.model.service.admin.AdminService;
import ga.dgmarket.gymshopping.model.service.member.MemberService;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private MemberService memberService;
	//모든 회원 가져오기
	@GetMapping("/main/member")
	public String admin_member(Model model, HttpServletRequest request) {
		List memberList = memberService.selectAll();
		int cnt = memberService.countUser();
		model.addAttribute("memberList",memberList);
		model.addAttribute("cnt",cnt);
		return "admin/main/member";
	}
	//단일 회원 가져오기
	@GetMapping("/main/member/detail")
	public String getDetail(int member_id, Model model, HttpServletRequest request) {
		Member member = memberService.select(member_id);
		model.addAttribute("member",member);
		return "admin/main/member/detail";
	}
}
