package ga.dgmarket.gymshopping.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import ga.dgmarket.gymshopping.model.service.product.CartService;

@Controller
public class CartController {
	
	
	//장바구니 목록 가져오기 
	@GetMapping("/cart/list")  //  
	public String getList() {

		
		
		return "member/shop/cart";
	}
	//장바구니 목록 가져오기 
		@GetMapping("/cart/list2")  //  
		public String getList2() {

			
			
			return "member/shop/cart2";
		}
}
