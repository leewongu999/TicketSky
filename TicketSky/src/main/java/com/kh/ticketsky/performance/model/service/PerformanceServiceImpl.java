package com.kh.ticketsky.performance.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ticketsky.performance.model.dao.PerformanceDao;

@Service
public class PerformanceServiceImpl implements PerformanceService {

	@Autowired
	private PerformanceDao dao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> categoryList(String category) {
		
		List<Map<String,String>> list = dao.categoryList(sqlSession,category);
		return list;
	}
	
	@Override
	public List<Map<String, String>> performAllList(String category) {
		
		List<Map<String,String>> list= dao.performAllList(sqlSession, category);
		return list;
	}
	
	@Override
	public List<Map<String, String>> performSelectList(Map<String, String> map,int cPage, int numPerPage) {
		
		List<Map<String,String>> list = dao.performSelectList(sqlSession,map,cPage,numPerPage);
		
		return list;
	}

	@Override
	public Map<String, Object> performSelectOne(int no) {
		Map<String, Object> map = dao.performSelectOne(sqlSession, no);
		return map;
	}

	@Override
	public List<Map<String, Object>> performReview(int no, int cPage, int numPerPage) {
		List<Map<String,Object>> list = dao.performReview(sqlSession, no, cPage, numPerPage);
		return list;
	}

	@Override
	public int performReviewInsert(Map<String, Object> map) {
		int result = dao.performReviewInsert(sqlSession, map);
		return result;
	}

	@Override
	public int performReviewDelete(int reviewNo) {

		int result = dao.performReviewDelete(sqlSession, reviewNo);
		return result;
	}

	@Override
	public Map<String, Object> performReviewOne(int reviewNo) {
		Map<String, Object> map = dao.performReviewOne(sqlSession, reviewNo);
		return map;
	}

	@Override
	public int performReviewUpdateEnd(Map<String, Object> map) {

		int result = dao.performReviewUpdateEnd(sqlSession, map);
		return result;
	}

	@Override
	public int performSelectTotalCount(Map<String, String> map) {

		return dao.performSelectTotalCount(sqlSession,map);
	}

	@Override
	public int performReviewTotalCount(int no) {

		return dao.performReviewTotalCount(sqlSession,no);
	}

	

	

	

	

	


	

}
