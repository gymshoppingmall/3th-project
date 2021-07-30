package ga.dgmarket.gymshopping.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {
	
	// 물품 상세보기 요청처리 --도균--
		@RequestMapping(value = "/detailform", method = RequestMethod.GET)
		public String detailform() {
			
			return "member/shop/detail";
		}
	
	
}
