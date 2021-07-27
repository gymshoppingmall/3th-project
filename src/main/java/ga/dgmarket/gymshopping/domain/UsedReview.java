package ga.dgmarket.gymshopping.domain;

import lombok.Data;

@Data
public class UsedReview {
	private int used_review_id;
	private int member_id;
	private int used_ord_id;
	private String used_review_title;
	private String used_review_writer;
	private String used_review_content;
	private int used_review_score;
	private String used_review_regdate;
}