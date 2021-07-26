package ga.dgmarket.gymshopping.domain;

import lombok.Data;

@Data
public class UsedOrd {
	private int used_ord_id;
	private int member_id;
	private int used_product_id;
	private String used_ord_regdate;
}