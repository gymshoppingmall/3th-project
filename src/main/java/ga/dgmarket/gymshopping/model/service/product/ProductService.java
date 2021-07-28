package ga.dgmarket.gymshopping.model.service.product;

import java.util.List;

import ga.dgmarket.gymshopping.domain.Product;

public interface ProductService {
	public List selectAll();
	public List selectNewItem(); 
	public Product select(int product_id);
	public void regist(Product product);
	public void update(Product product);
	public void delete(int product_id);
	/* 하루에 등록된 상품 수를 가져오기
	public void cntOneDay();
	*/
}
