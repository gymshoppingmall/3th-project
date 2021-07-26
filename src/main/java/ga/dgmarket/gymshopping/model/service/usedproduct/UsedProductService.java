package ga.dgmarket.gymshopping.model.service.usedproduct;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import ga.dgmarket.gymshopping.domain.UsedProduct;

public interface UsedProductService {

	public void regist(UsedProduct usedProduct, ServletContext context);
}