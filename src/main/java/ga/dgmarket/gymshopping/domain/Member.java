package ga.dgmarket.gymshopping.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Member {
	private int member_id;
	private String user_id;
	private String password;
	private String name;
	private String storename;
	private String store_id;
	MultipartFile photo;
	private String profile_img;
	private String phone;
	private String addr;
	private String email;
	private String regdate;

}
