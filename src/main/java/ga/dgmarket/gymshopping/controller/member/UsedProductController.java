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
	
	@GetMapping("/used/main")
	public String getMain() {		
		return "member/used/main";
	}
	
	@GetMapping("/used/product/registForm")
	public String registForm() {
		return  "member/used/product/registForm";
	}
	
	@PostMapping("/used/product/regist")
	public String regist(UsedProduct usedProduct, HttpServletRequest request) {
		
		usedProductService.regist(usedProduct, request.getServletContext());
		return "redirect:/member/used/main";
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