package com.kh.ticketsky.user.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ticketsky.user.model.vo.Member;

public interface UserDao {

	int insertConsumer(SqlSessionTemplate sqlSession, Member member);

	Member selectOne(SqlSessionTemplate sqlSession, String userId);

	int updateConsumer(SqlSessionTemplate sqlSession, Member m);

	int deleteConsumer(SqlSessionTemplate sqlSession, String userId);

	int insertSeller(SqlSessionTemplate sqlSession, Member member);

	List<Member> selectConsumerList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);

	int selectConsumerTotalCount(SqlSessionTemplate sqlSession);

}
