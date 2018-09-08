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
	public Performance performSelectOne(SqlSessionTemplate sqlSession, int no) {

		return sqlSession.selectOne("performance.performSelectOne", no);
	}



	
	
	
	

	
	
}
