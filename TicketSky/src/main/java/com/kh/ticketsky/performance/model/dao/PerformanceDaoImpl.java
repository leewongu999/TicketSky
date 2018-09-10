package com.kh.ticketsky.performance.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ticketsky.performance.model.vo.Performance;

@Repository
public class PerformanceDaoImpl implements PerformanceDao {

	
	@Override
	public List<Map<String, String>> categoryList(SqlSessionTemplate sqlSession, String category) {

		return sqlSession.selectList("performance.categoryList",category);
	}
	
	@Override
	public List<Map<String, String>> performAllList(SqlSessionTemplate sqlSession, String category) {
	
		return sqlSession.selectList("performance.performAllList", category);
	}

	@Override
	public List<Map<String, String>> performSelectList(SqlSessionTemplate sqlSession, Map<String, String> map) {
		
		return sqlSession.selectList("performance.performSelectList",map);
	}

	@Override
	public Map<String, Object> performSelectOne(SqlSessionTemplate sqlSession, int no) {
		
		return sqlSession.selectOne("performance.performSelectOne",no);
		
	}

	@Override
	public List<Map<String, Object>> performReview(SqlSessionTemplate sqlSession, int no) {

		return sqlSession.selectList("performance.performReview", no);
	}

	@Override
	public int performReviewInsert(SqlSessionTemplate sqlSession, Map<String, Object> map) {
	
		return sqlSession.insert("performance.performReviewInsert", map);
	}

	@Override
	public int performReviewDelete(SqlSessionTemplate sqlSession, int reviewNo) {

		return sqlSession.delete("performance.performReviewDelete", reviewNo);
	}

	@Override
	public Map<String, Object> performReviewOne(SqlSessionTemplate sqlSession, int reviewNo) {

		return sqlSession.selectOne("performance.performReviewOne",reviewNo);
	}

	@Override
	public int performReviewUpdateEnd(SqlSessionTemplate sqlSession, Map<String, Object> map) {

		return sqlSession.update("performance.performReviewUpdateEnd", map);
	}

	
}
