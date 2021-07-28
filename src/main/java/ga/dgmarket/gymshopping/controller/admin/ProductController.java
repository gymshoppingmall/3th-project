package ga.dgmarket.gymshopping.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import ga.dgmarket.gymshopping.model.service.product.ProductService;

@Controller
public class ProductController {
	//모든 상품 가져오기
	@Autowired
	private ProductService productService;
	@GetMapping("/main/productlist")
	public String memberList(Model model, HttpServletRequest request) {
		List productList = productService.selectAll();
		model.addAttribute("productList",productList);
		return "admin/main/productlist";
	}
}
