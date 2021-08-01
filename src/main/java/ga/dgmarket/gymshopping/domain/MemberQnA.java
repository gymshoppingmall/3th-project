package ga.dgmarket.gymshopping.domain;

import lombok.Data;

@Data
public class MemberQnA {
	private int qna_id;
	private int member_id;
	private String qna_title;
	private String qna_content;
	private String secret_check;
	private String reply_check;
	private String regdate;
	
	//조인을 염두해 둔 부모의 VO 보유
	private Member member;
}
