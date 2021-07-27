package ga.dgmarket.gymshopping.model.service.usedStore;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ga.dgmarket.gymshopping.domain.UsedProductImg;
import ga.dgmarket.gymshopping.domain.UsedReview;
import ga.dgmarket.gymshopping.model.repository.usedproduct.UsedProductImgDAO;

@Service
public class UsedStoreServiceImpl implements UsedStoreService{

	@Autowired
	private UsedProductImgDAO usedProductImgDAO;
	
	public Map getStore(int member_id){
		Map map = new HashMap<String, Object>();
		
		//판매상품 이미지 가져오기
		List productList = usedProductImgDAO.productPre(member_id);
		List favoritesList = usedProductImgDAO.favoritesPre(member_id);
		
		
		
		
		return null;
	}
	
}
