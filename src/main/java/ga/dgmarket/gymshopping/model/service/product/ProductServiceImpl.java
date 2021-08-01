package ga.dgmarket.gymshopping.model.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ga.dgmarket.gymshopping.domain.Product;
import ga.dgmarket.gymshopping.model.repository.product.ProductDAO;
@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public List selectAll() {
		return productDAO.selectAll();
	}

	@Override
	public List selectNewItem() {

		return productDAO.selectNewItem();
	}
	@Override
	public Product select(int product_id) {
		return productDAO.select(product_id);
	}

	public void regist(Product product) {
		productDAO.regist(product);
	}

	@Override
	public void update(Product product) {
		productDAO.update(product);
	}

	@Override
	public void delete(int product_id) {
		productDAO.delete(product_id);
	}

	@Override
	public List selectForCategory() {
		return productDAO.selectForCategory();
	}

	@Override
	public List selectTodayRegisted() {
		return productDAO.selectTodayRegisted();
	}


}
