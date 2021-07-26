package ga.dgmarket.gymshopping.model.repository.usedproduct;

import java.util.List;

import ga.dgmarket.gymshopping.domain.UsedProduct;

public interface UsedProductDAO {
	public UsedProduct insert(UsedProduct usedProduct);
	public List selectAll();
}