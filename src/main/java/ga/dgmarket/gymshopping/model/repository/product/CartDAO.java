package ga.dgmarket.gymshopping.model.repository.product;

import java.util.List;

import ga.dgmarket.gymshopping.domain.Cart;

public interface CartDAO {
	public void insert(Cart cart);
	public List selectAll();
	public List selectAllJoin(int member_id); //Product와 조인하여 가져오기 
	public void update(Cart cart);
	public void delete(int cart_id);
	public void deleteAll(int member_id);
}
