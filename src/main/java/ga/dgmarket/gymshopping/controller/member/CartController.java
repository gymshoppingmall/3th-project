package ga.dgmarket.gymshopping.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import ga.dgmarket.gymshopping.model.service.product.CartService;

public class CartController {
	
	@Autowired
	private CartService cartService;
	
	
	//장바구니 목록 가져오기 
	@GetMapping("/cart/list")  //  
	public String getList(HttpServletRequest request, Model model) {
		//방법) 매개변수 없이 client/cart/list aop  세션체크 후, 세션이 존재하면 proceed() 시켜 세션으로부터
		//회원정보를 프로그래밍 적으로 얻어와 매개변수에 대입
		//Member member=request.getSession().getAttribute("member");
		//3단계: 일 시키기
		List cartList=cartService.selectAllJoin(1);
		
		//4단계:저장
		model.addAttribute("cartList", cartList);  
		
		
		return "client/shop/cart";
	}
}
