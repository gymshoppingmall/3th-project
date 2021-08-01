package ga.dgmarket.gymshopping.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {

	
	@GetMapping("/used/chat/list")
	public String chatList() {

		
		
		
		return "member/used/chat/chat";
	}
}
