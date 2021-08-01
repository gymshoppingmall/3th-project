package ga.dgmarket.gymshopping.controller.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Decoder;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ga.dgmarket.gymshopping.chat.ServletAwareConfig;
import ga.dgmarket.gymshopping.domain.Member;


@Controller
@ServerEndpoint(value = "/used/chat") //인코딩 디코더 처리??
public class WebSocketController {
    
    private static final List<Session> sessionList=new ArrayList<Session>();;
    private static final Logger logger = LoggerFactory.getLogger(WebSocketController.class);
    public WebSocketController() {
        // TODO Auto-generated constructor stub
        System.out.println("웹소켓(서버) 객체생성");
    }
    
    //웹소켓 열기
    @OnOpen
    public void onOpen(Session session) {
    	System.out.println("실행 순서 0");
        logger.info("Open session id:"+session.getId());
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("채팅방과 연결 됐습니다.");
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        sessionList.add(session);
    }
    
    /*
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param sender
     * @param message
     */ //메시지를 전송할 때 디비에 넣야할 것 같음 //얘는 send 역할
    private void sendAllSessionToMessage(Session self, String sender, String message) {
    	//HttpSession memberSession = (HttpSession) request.getHttpSession();
    	//Member member = (Member)memberSession.getAttribute("member");
    	//int member_id = member.getMember_id();
        try {
            for(Session session : WebSocketController.sessionList) { //모든 사용자에게 전송하기
                if(!self.getId().equals(session.getId())) { //세션에 들어있는 사용자id와 수신자의id가 일치하다면 메세지 출력
                	//if(member_id == receiver_id) {
                		session.getBasicRemote().sendText(sender+" : "+message);
                	//}
                }
            }
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    /*
     * 메세지를 받는 곳 즉, listener 역할을 함
     * @param message
     * @param session
     */ //메시지를 전송할 때 message에 담기는 값은 "메시지,보내는사람이름, 받는사람_id" 순으로 담긴다.
    //http 세션을 구해와야함
    @OnMessage
    public void onMessage(String message, Session session) {
    	
    	System.out.println("실행 순서 1"); //얘가 가장 먼저임
    	message = message.split(",")[0];
    	String sender = message.split(",")[1];
    	
		try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("<나> : "+message);
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
    	sendAllSessionToMessage(session, sender, message); 
    }
    
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    
    //페이지 닫을 시 세션 삭제
    @OnClose
    public void onClose(Session session) {
    	System.out.println("실행 순서 3");
        logger.info("Session "+session.getId()+" has ended");
        sessionList.remove(session);
    }
}