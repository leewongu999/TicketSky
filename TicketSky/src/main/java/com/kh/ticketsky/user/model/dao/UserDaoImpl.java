package com.kh.ticketsky.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ticketsky.user.model.vo.Member;

@Repository
public class UserDaoImpl implements UserDao {

	@Override
	public int insertConsumer(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("member.insertConsumer",member);
	}

	@Override
	public Member selectOne(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("member.selectOne", userId);
	}

}
