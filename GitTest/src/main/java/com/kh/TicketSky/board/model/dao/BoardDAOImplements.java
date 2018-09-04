package com.kh.TicketSky.board.model.dao;
import java.util.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.TicketSky.board.model.vo.Board;

@Repository
public class BoardDAOImplements implements BoardDAO {
	@Override
	public List<Board> selectList(SqlSessionTemplate sst) {
		return sst.selectList("selectList");
	}
	@Override
	public int selectTotalContents(SqlSessionTemplate sst) {
		return sst.selectOne("selectOne");
	}
	@Override
	public int insertBoard(SqlSessionTemplate sst, Board b) {
		return sst.insert("insert", b);
	}
	@Override
	public int updateBoard(SqlSessionTemplate sst, Board b) {
		return sst.insert("update", b);
	}
	@Override
	public int deleteBoard(SqlSessionTemplate sst, Board b) {
		return sst.delete("delete", b);
	}
	@Override
	public Board selectOne(SqlSessionTemplate sst, int boardNo) {
		return sst.selectOne("selectBoard", boardNo);
	}
}
