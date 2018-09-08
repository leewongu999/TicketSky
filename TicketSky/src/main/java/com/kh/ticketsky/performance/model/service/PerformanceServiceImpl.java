package com.kh.ticketsky.performance.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ticketsky.performance.model.dao.PerformanceDao;
import com.kh.ticketsky.performance.model.vo.Performance;

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
	public List<Map<String, String>> performSelectList(Map<String, String> map) {
		
		List<Map<String,String>> list = dao.performSelectList(sqlSession,map);
		
		return list;
	}

	@Override
	public Performance performSelectOne(int no) {
		Performance p = dao.performSelectOne(sqlSession, no);
		return p;
	}

	

	


	

}
