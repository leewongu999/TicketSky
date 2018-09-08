package com.kh.ticketsky.performance.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ticketsky.performance.model.vo.Performance;

public interface PerformanceDao {

	List<Map<String, String>> categoryList(SqlSessionTemplate sqlSession, String category);
	
	List<Map<String, String>> performAllList(SqlSessionTemplate sqlSession, String category);

	List<Map<String, String>> performSelectList(SqlSessionTemplate sqlSession, Map<String, String> map);

	Performance performSelectOne(SqlSessionTemplate sqlSession, int no);

	

	

	

}
