package ga.dgmarket.gymshopping.domain;

import lombok.Data;

@Data
public class MemberQnAReply {
	private int qna_reply_id;
	private int qna_id;
	private String qna_reply_msg;
	private String qna_reply_regdate;
	
	//조인을 염두해 둔 부모의 VO 보유
	private MemberQnA memberQnA;
}
