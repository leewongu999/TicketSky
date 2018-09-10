package com.kh.ticketsky.performance.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ticketsky.performance.model.vo.Performance;

public interface PerformanceDao {

	List<Map<String, String>> categoryList(SqlSessionTemplate sqlSession, String category);
	
	List<Map<String, String>> performAllList(SqlSessionTemplate sqlSession, String category);

	List<Map<String, String>> performSelectList(SqlSessionTemplate sqlSession, Map<String, String> map);

	Map<String, Object> performSelectOne(SqlSessionTemplate sqlSession, int no);

	List<Map<String, Object>> performReview(SqlSessionTemplate sqlSession, int no);

	int performReviewInsert(SqlSessionTemplate sqlSession, Map<String, Object> map);

	int performReviewDelete(SqlSessionTemplate sqlSession, int reviewNo);

	Map<String, Object> performReviewOne(SqlSessionTemplate sqlSession, int reviewNo);

	int performReviewUpdateEnd(SqlSessionTemplate sqlSession, Map<String, Object> map);

	

	

	

	

	

}
