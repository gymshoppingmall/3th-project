package ga.dgmarket.gymshopping.model.repository.usedproduct;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ga.dgmarket.gymshopping.domain.UsedProduct;
import ga.dgmarket.gymshopping.exception.DMLException;

@Repository
public class MybatisUsedProductDAO implements UsedProductDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//중고거래 상품을 등록하는 메서드. 이미지는 별도로 업로드 from.성일
	public UsedProduct insert(UsedProduct usedProduct) throws DMLException{
		int result = sqlSessionTemplate.insert("UsedProduct.insert", usedProduct);
		if(result == 0) {
			 throw new DMLException("상품 등록 실패");
		}else {			
			return usedProduct;
		}
	}
}