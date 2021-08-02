package ga.dgmarket.gymshopping.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ga.dgmarket.gymshopping.domain.Product;
import ga.dgmarket.gymshopping.model.service.product.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	
	
	
	// 메인에서 상품클릭시 상세보기 요청처리 --도균--
		@GetMapping("/product/detail")
		public String detailform(int product_id, Model model, HttpServletRequest request) {
			// 3단계: 일 시키기
			Product product = new Product(); //empty VO
			product = productService.select(product_id);
			
			// 4단계: 저장
			model.addAttribute("product", product);

			return "member/shop/detail";
	}
}
