package com.kh.ticketsky.user.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ticketsky.user.model.vo.Member;

@Repository
public class UserDaoImpl implements UserDao {

	@Override
	public int selectSellerPlayTotalCount(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectOne("seller.selectSellerPlayTotalCount",map);
	}

	@Override
	public List<Map<String, String>> selectMyPlayList(SqlSessionTemplate sqlSession, int cPage, int numPerPage,
			Map<String, String> map) {
		RowBounds row=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("seller.selectMyPlayList",map,row);
	}

	@Override
	public List<Map<String, String>> selectReserveList(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("consumer.selectReserveList",userId);
	}

	@Override
	public int selectSellerTotalCount(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectOne("member.selectSellerTotalCount",map);
	}

	@Override
	public List<Member> selectSellerList(SqlSessionTemplate sqlSession, int cPage, int numPerPage,Map<String, String> map) {
		RowBounds row=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("member.selectSellerList",map,row);
	}

	@Override
	public int updateConsumerRating(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.update("member.updateConsumerRating",map);
	}

	@Override
	public List<Map<String, String>> selectConsumerRating(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("member.selectConsumerRating");
	}

	@Override
	public List<Member> selectConsumerList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, Map<String, String> map) {
		RowBounds row=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("member.selectConsumerList",map,row);
	}

	@Override
	public int selectConsumerTotalCount(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectOne("member.selectConsumerTotalCount",map);
	}

	@Override
	public int insertSeller(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("member.insertSeller",member);

	}

	@Override
	public int deleteConsumer(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("member.deleteConsumer",userId);
	}

	@Override
	public int updateConsumer(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("member.updateConsumer",m);
	}

	@Override
	public int insertConsumer(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("member.insertConsumer",member);
	}

	@Override
	public Member selectOne(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("member.selectOne", userId);
	}

}
