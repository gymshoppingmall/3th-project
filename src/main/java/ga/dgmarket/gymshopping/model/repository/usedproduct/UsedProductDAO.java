package ga.dgmarket.gymshopping.model.repository.usedproduct;

import java.util.List;

import ga.dgmarket.gymshopping.domain.UsedFavorites;
import ga.dgmarket.gymshopping.domain.UsedProduct;
import ga.dgmarket.gymshopping.domain.UsedProductExtend;

public interface UsedProductDAO {
	public UsedProduct insert(UsedProduct usedProduct);
	public List selectAll(int member_id);
	public UsedProductExtend getDetail(UsedProductExtend usedProductExtend);
	public UsedFavorites getFavoritesCount(int used_product_id);
	public List getProductTag(int used_product_id);
	public void soldout(int used_product_id);
	public void deleteProduct(int used_product_id);
	public void deleteFavorites(int used_product_id);
}