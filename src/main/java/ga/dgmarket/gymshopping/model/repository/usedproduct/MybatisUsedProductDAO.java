package ga.dgmarket.gymshopping.model.repository.usedproduct;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ga.dgmarket.gymshopping.domain.UsedFavorites;
import ga.dgmarket.gymshopping.domain.UsedProduct;
import ga.dgmarket.gymshopping.domain.UsedProductExtend;
import ga.dgmarket.gymshopping.exception.DMLException;

@Repository
public class MybatisUsedProductDAO implements UsedProductDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//중고거래 상품을 등록하는 메서드. 이미지는 별도로 업로드 from.성일
	public UsedProduct insert(UsedProduct usedProduct) throws DMLException{
		int result = sqlSessionTemplate.insert("UsedProductExtend.insert", usedProduct);
		if(result == 0) {
			 throw new DMLException("상품 등록 실패");
		}else {			
			return usedProduct;
		}
	}

	//중고 상품 전체 조회
	public List selectAll(int member_id) {
		return sqlSessionTemplate.selectList("UsedProductExtend.selectAll", member_id);
	}
	
	//상품 상세 목록 가져오기
	public UsedProductExtend getDetail(UsedProductExtend usedProductExtend) {
		return sqlSessionTemplate.selectOne("UsedProductExtend.getDetail", usedProductExtend);
	}
	
	//상품에 대한 찜 갯수 count
	public UsedFavorites getFavoritesCount(int used_product_id) {
		return sqlSessionTemplate.selectOne("UsedFavorites.getFavoritesCount", used_product_id);
	}
	
	//상품에 대한 태그들 가져오기
	public List getProductTag(int used_product_id) {
		return sqlSessionTemplate.selectList("UsedTag.getProductTag", used_product_id);
	}

	//상품의 정보를 판매완료 처리하기
	public void soldout(int used_product_id) {
		sqlSessionTemplate.update("UsedProductExtend.soldout", used_product_id);
	}

	//상품 삭제하기
	public void deleteProduct(int used_product_id) {
		sqlSessionTemplate.delete("UsedProductExtend.delete", used_product_id);
	}
	
	//상품에 대한 찜 정보 전체 삭제
	public void deleteFavorites(int used_product_id) {
		sqlSessionTemplate.delete("UsedFavorites.delete", used_product_id);
	}

	//찜 정보 한건 삭제
	public void deleteFavoritesOne(int used_favorites_id) {
		sqlSessionTemplate.delete("UsedFavorites.deleteOne", used_favorites_id);
	}
	
	//상품에 대한 찜 등록
	public int insertFavorites(UsedFavorites usedFavorites) throws DMLException{
		int result = sqlSessionTemplate.insert("UsedFavorites.insert", usedFavorites);
		if(result == 0) {
			throw new DMLException("찜 등록에 실패했습니다.");
		}
		return usedFavorites.getUsed_favorites_id();
	}
}