package ga.dgmarket.gymshopping.model.repository.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ga.dgmarket.gymshopping.domain.Product;

@Repository
public class MybatisProductDAO implements ProductDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Product.selectAll");
	}
	
	public List selectNewItem() {
		return sqlSessionTemplate.selectList("Product.selectNewItem");
	}

	@Override
	public Product select(int product_id) {
		return sqlSessionTemplate.selectOne("Product.select",product_id);
	}

	public void regist(Product product) {
		sqlSessionTemplate.insert("Product.insert",product);
	}

	@Override
	public void update(Product product) {
		sqlSessionTemplate.update("Product.update",product);
	}

	@Override
	public void delete(int product_id) {
		sqlSessionTemplate.delete("Product.delete", product_id);
	}

	@Override
	public List selectForCategory() {
		return sqlSessionTemplate.selectList("Product.selectForCategory");
	}

	@Override
	public List selectTodayRegisted() {
		return sqlSessionTemplate.selectList("Product.selectTodayRegisted");
	}

	@Override
	public Product selectForDays(int days) {
		return sqlSessionTemplate.selectOne("Product.selectForDays",days);
	}
	@Override
	public Product selectForDaysCount(int days) {
		return sqlSessionTemplate.selectOne("Product.selectForDaysCount",days);
	}

}
