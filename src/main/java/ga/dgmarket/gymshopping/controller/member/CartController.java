package ga.dgmarket.gymshopping.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ga.dgmarket.gymshopping.domain.Cart;
import ga.dgmarket.gymshopping.model.service.product.CartService;

@Controller
public class CartController {
	
	
	//장바구니 목록 가져오기 
	@RequestMapping(value="/cart", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public String getList(@RequestBody Cart cart, HttpServletRequest request) {
		System.out.print(cart);
		
		/*
		 * System.out.print("컨트롤러에 온 리퀘스트는"+request); Cart cart=new Cart(); int
		 * ea=(int)request.getAttribute("ea"); System.out.print("컨트롤러에 온 갯수는"+ea); int
		 * member_id=(int)request.getAttribute("member_id"); int
		 * product_id=(int)request.getAttribute("product_id"); cart.setEa(ea);
		 * cart.setMember_id(member_id); cart.setProduct_id(product_id);
		 * System.out.print("컨트롤러에 온 정보는"+cart);
		 */
		
		
		return "member/shop/cart";
	}
	

}
