package ga.dgmarket.gymshopping.model.repository.usedreview;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MybatisUsedReviewDAO implements UsedReviewDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List selectAll(int member_id) {
		return sqlSessionTemplate.selectList("UsedReview.selectAll", member_id);
	}

}