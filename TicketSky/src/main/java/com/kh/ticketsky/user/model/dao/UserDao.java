package com.kh.ticketsky.user.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ticketsky.user.model.vo.Member;

public interface UserDao {

	int insertConsumer(SqlSessionTemplate sqlSession, Member member);

	Member selectOne(SqlSessionTemplate sqlSession, String userId);

	int updateConsumer(SqlSessionTemplate sqlSession, Member m);

	int deleteConsumer(SqlSessionTemplate sqlSession, String userId);

	int insertSeller(SqlSessionTemplate sqlSession, Member member);

	List<Member> selectConsumerList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, Map<String, String> map);

	int selectConsumerTotalCount(SqlSessionTemplate sqlSession, Map<String, String> map);

	List<Map<String, String>> selectConsumerRating(SqlSessionTemplate sqlSession);

	int updateConsumerRating(SqlSessionTemplate sqlSession, Map<String, String> map);

	List<Member> selectSellerList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, Map<String, String> map);

	int selectSellerTotalCount(SqlSessionTemplate sqlSession, Map<String, String> map);

	List<Map<String, String>> selectMyPlayList(SqlSessionTemplate sqlSession, int cPage, int numPerPage,
			Map<String, String> map);

	int selectSellerPlayTotalCount(SqlSessionTemplate sqlSession, Map<String, String> map);

	List<Map<String, String>> selectReserveList(SqlSessionTemplate sqlSession, int cPage, int numPerPage,
			Map<String, String> map);

	int selectReserveListCount(SqlSessionTemplate sqlSession, Map<String, String> map);

	List<Map<String, String>> selectSellerStatusUserId(SqlSessionTemplate sqlSession, Map<String, String> map);

	List<Map<String, String>> selectSellerGenderStatus(SqlSessionTemplate sqlSession, Map<String, String> map);

	List<Map<String, String>> selectSellerAgeStatus(SqlSessionTemplate sqlSession, Map<String, String> map);

	List<Map<String, String>> selectSellerMonthStatus(SqlSessionTemplate sqlSession, Map<String, String> map);

	List<Map<String, String>> selectSellermonthAcount(SqlSessionTemplate sqlSession, Map<String, String> map);
	
	
	
	
	 int findPassword(SqlSessionTemplate sqlSession, Member m);

	   Member selectId(SqlSessionTemplate sqlSession, Map<String, String> map);

}
