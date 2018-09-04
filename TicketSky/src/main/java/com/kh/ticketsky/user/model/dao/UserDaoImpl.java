package com.kh.ticketsky.user.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ticketsky.user.model.vo.Member;

@Repository
public class UserDaoImpl implements UserDao {

	@Override
	public List<Member> selectConsumerList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		RowBounds row=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("member.selectConsumerList",null,row);
	}

	@Override
	public int selectConsumerTotalCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("member.selectConsumerTotalCount");
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
