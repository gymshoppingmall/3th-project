package ga.dgmarket.gymshopping.domain;

import lombok.Data;

@Data
public class Product {
	private int product_id;
	private int sub_category_id;
	private String product_name;
	private String product_detail;
	private int price;
	private String product_img;
}
