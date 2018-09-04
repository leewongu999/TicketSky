package com.kh.ticketsky.user.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ticketsky.user.model.dao.UserDao;
import com.kh.ticketsky.user.model.vo.Member;

@Service
public class UserServiceImpl implements UserService {

	

	@Override
	public List<Member> selectConsumerList(int cPage, int numPerPage) {
		return dao.selectConsumerList(sqlSession,cPage,numPerPage);
	}

	@Override
	public int selectConsumerTotalCount() {
		return dao.selectConsumerTotalCount(sqlSession);
	}

	@Override
	public int insertSeller(Member member) {
		return dao.insertSeller(sqlSession,member);
	}


	@Override
	public int deleteConsumer(String userId) {
		return dao.deleteConsumer(sqlSession,userId);
	}

	@Override
	public int updateConsumer(Member m) {
		return dao.updateConsumer(sqlSession,m);
	}

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
