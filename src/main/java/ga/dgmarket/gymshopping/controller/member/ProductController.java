package ga.dgmarket.gymshopping.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {
	
	// 물품 상세보기 요청처리 --도균--
		@GetMapping("/product/detail")
		public String detailform(int product_id) {
			System.out.println("컨트롤러에서 받은 아이디는 ="+product_id);
			return "member/shop/detail";
		}
	
	
}
