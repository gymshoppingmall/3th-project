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
import ga.dgmarket.gymshopping.model.service.usedStore.UsedStoreService;
import ga.dgmarket.gymshopping.model.service.usedproduct.UsedProductService;

@Controller
public class UsedStoreController {

	@Autowired
	private UsedProductService usedProductService;
	@Autowired
	private UsedStoreService usedStoreService;
	
	
	@GetMapping("/used/store")
	public String getStore(int member_id, Model model) {
		Map storeMap = usedStoreService.getStore(member_id);
		
		model.addAttribute("storeMap", storeMap);
		return "member/used/store/store";
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