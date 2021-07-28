package ga.dgmarket.gymshopping.model.service.usedproduct;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import ga.dgmarket.gymshopping.domain.UsedProduct;
import ga.dgmarket.gymshopping.domain.UsedProductExtend;

public interface UsedProductService {

	public void regist(HttpServletRequest request, UsedProduct usedProduct);
	public List selectAll(HttpServletRequest request);
	public Map getDetail(HttpServletRequest request, int used_product_id);
	public void delete(HttpServletRequest request, int used_product_id);
	public void soldout(HttpServletRequest request, int used_product_id);
}