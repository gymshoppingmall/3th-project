package ga.dgmarket.gymshopping.controller.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ga.dgmarket.gymshopping.domain.UsedProduct;
import ga.dgmarket.gymshopping.exception.DMLException;
import ga.dgmarket.gymshopping.exception.UploadException;
import ga.dgmarket.gymshopping.model.service.usedproduct.UsedProductService;

@Controller
public class UsedProductController {

	@Autowired
	private UsedProductService usedProductService;
	
	//중고상점의 메인페이지요청을 처리하는 메서드
	//메인 페이지로 이동하며 상품 정보가 담긴 List를 전송한다.
	@GetMapping("/used/main")
	public String getMain(Model model, HttpServletRequest request) {
		List usedProductList = usedProductService.selectAll(request);
		System.out.println("멤버가 반환됨"+usedProductList);
		model.addAttribute("usedProductList", usedProductList);
		
		return "member/used/main";
	}
	
	//중고상품 등록 폼 요청을 처리하는 메서드
	@GetMapping("/used/product/registForm")
	public String registForm(HttpServletRequest request) {
		return  "member/used/product/registForm";
	}
	
	
	//글등록 요청을 처리하는 메서드
	//등록을 마치면 바로 메인페이지로 이동함
	@PostMapping("/used/product/regist")
	public String regist(UsedProduct usedProduct, HttpServletRequest request) {
		
		usedProductService.regist(usedProduct, request.getServletContext());
		return "redirect:/member/used/main";
	}
	
	//상품의 상세페이지 요청을 처리하는 메서드
	@GetMapping("/used/product/detail")
	public String getDetail() {
		
		return "member/used/product/detail";
	}
	
	
	//DML 실패 시 만나게 되는 에러 전용 핸들러
	@ExceptionHandler(DMLException.class)
	public String handleException(DMLException e, Model model) {
		model.addAttribute("e", e);
		return "error/result";
	}
	
	//파일 업로드 실패 시 만나게 되는 에러 전용 핸들러
	@ExceptionHandler(UploadException.class)
	public String hadleException(UploadException e, Model model) {
		model.addAttribute("e", e);
		return "error/result";
	}
}