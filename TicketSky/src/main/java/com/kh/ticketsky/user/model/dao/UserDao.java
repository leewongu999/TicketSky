package com.kh.ticketsky.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ticketsky.user.model.vo.Member;

public interface UserDao {

	int insertConsumer(SqlSessionTemplate sqlSession, Member member);

	Member selectOne(SqlSessionTemplate sqlSession, String userId);

}
