package ga.dgmarket.gymshopping.model.repository.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ga.dgmarket.gymshopping.domain.Cart;
import ga.dgmarket.gymshopping.exception.DMLException;

@Repository
public class MybatisCartDAO implements CartDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	//카드 1건담기
	public void insert(Cart cart) {
		int result= sqlSessionTemplate.insert("Cart.insert", cart);
		if(result==0) {
			throw new DMLException("장바구니 담기에 실패하였습니다");
		}
	}

	@Override
	public List selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List selectAllJoin(int member_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Cart cart) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int cart_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAll(int member_id) {
		// TODO Auto-generated method stub
		
	}

}
