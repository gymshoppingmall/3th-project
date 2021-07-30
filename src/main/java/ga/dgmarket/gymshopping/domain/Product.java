package ga.dgmarket.gymshopping.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Product {
	private int product_id;
	private int top_category_id;
	private String product_name;
	private String product_detail;
	private int price;
<<<<<<< HEAD
	private String product_img;
=======
	private int product_inven;
	private String brand;
	private String product_img;
	MultipartFile photo;

	private TopCategory topCategory;

>>>>>>> a50799923c565a59da0384da0e8e28839a806a53
}
