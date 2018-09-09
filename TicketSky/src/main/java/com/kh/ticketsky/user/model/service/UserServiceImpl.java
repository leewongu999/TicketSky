package com.kh.ticketsky.user.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ticketsky.user.model.dao.UserDao;
import com.kh.ticketsky.user.model.vo.Member;

@Service
public class UserServiceImpl implements UserService {


	@Override
	public int selectReserveListCount(Map<String, String> map) {
		return dao.selectReserveListCount(sqlSession,map);
	}

	@Override
	public int selectSellerPlayTotalCount(Map<String, String> map) {
		return dao.selectSellerPlayTotalCount(sqlSession,map);
	}

	@Override
	public List<Map<String, String>> selectReserveList(int cPage, int numPerPage, Map<String, String> map) {
		return dao.selectReserveList(sqlSession,cPage,numPerPage,map);
	}

	@Override
	public List<Map<String, String>> selectMyPlayList(int cPage, int numPerPage, Map<String, String> map) {
		return dao.selectMyPlayList(sqlSession,cPage,numPerPage,map);
	}

	@Override
	public int selectSellerTotalCount(Map<String, String> map) {
		return dao.selectSellerTotalCount(sqlSession,map);

	}

	@Override
	public int updateConsumerRating(Map<String, String> map) {
		return dao.updateConsumerRating(sqlSession,map);
	}

	@Override
	public List<Map<String, String>> selectConsumerRating() {
		return dao.selectConsumerRating(sqlSession);
	}

	@Override
	public List<Member> selectSellerList(int cPage, int numPerPage, Map<String, String> map) {
		return dao.selectSellerList(sqlSession,cPage,numPerPage,map);
	}

	@Override
	public List<Member> selectConsumerList(int cPage, int numPerPage, Map<String, String> map) {
		return dao.selectConsumerList(sqlSession,cPage,numPerPage,map);
	}

	@Override
	public int selectConsumerTotalCount( Map<String, String> map) {
		return dao.selectConsumerTotalCount(sqlSession,map);
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
