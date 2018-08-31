package com.kh.ticketsky.user.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ticketsky.user.model.dao.UserDao;
import com.kh.ticketsky.user.model.vo.Member;

@Service
public class UserServiceImpl implements UserService {

	
	@Autowired
	UserDao dao;
	@Autowired
	SqlSessionTemplate sqlSession;
	@Override
	public int insertConsumer(Member member) {
		return dao.insertConsumer(sqlSession,member);
	}

	@Override
	public Member selectOne(String userId) {
		return dao.selectOne(sqlSession, userId);
	}
}
