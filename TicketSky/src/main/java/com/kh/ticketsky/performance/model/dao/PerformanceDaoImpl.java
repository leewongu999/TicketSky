package com.kh.ticketsky.performance.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	public List<Map<String, String>> performSelectList(SqlSessionTemplate sqlSession, Map<String, String> map,int cPage, int numPerPage) {
		
		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("performance.performSelectList",map,row);
	}

	@Override
	public Map<String, Object> performSelectOne(SqlSessionTemplate sqlSession, int no) {
		
		return sqlSession.selectOne("performance.performSelectOne",no);
		
	}

	@Override
	public List<Map<String, Object>> performReview(SqlSessionTemplate sqlSession, int no, int cPage, int numPerPage) {

		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("performance.performReview", no, row);
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

	@Override
	public int performSelectTotalCount(SqlSessionTemplate sqlSession, Map<String, String> map) {

		return sqlSession.selectOne("performance.performSelectTotalCount",map);
	}

	@Override
	public int performReviewTotalCount(SqlSessionTemplate sqlSession, int no) {

		return sqlSession.selectOne("performance.performReviewTotalCount", no);
	}
	
	
}
