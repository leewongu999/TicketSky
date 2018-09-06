package com.kh.TicketSky.board.model.dao;
import java.util.*;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.TicketSky.board.model.vo.Board;

@Repository
public class BoardDAOImplements implements BoardDAO {
	@Override
	public List<Board> selectList(SqlSessionTemplate sst, int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sst.selectList("board.selectList", null, rows);
	}
	@Override
	public int selectTotalContents(SqlSessionTemplate sst) {
		return sst.selectOne("board.selectOne");
	}
	@Override
	public int insertBoard(SqlSessionTemplate sst, Board b) {
		return sst.insert("board.insert", b);
	}
	@Override
	public int updateBoard(SqlSessionTemplate sst, Board b) {
		return sst.insert("board.update", b);
	}
	@Override
	public int deleteBoard(SqlSessionTemplate sst, Board b) {
		return sst.delete("board.delete", b);
	}
	@Override
	public Board selectOne(SqlSessionTemplate sst, int boardNo) {
		return sst.selectOne("board.selectBoard", boardNo);
	}
	@Override
	public int addVisits(SqlSessionTemplate sst, Board b) {
		return sst.update("board.addVisit", b);
	}
	@Override
	public List<Map<String,Object>> selectSearch(SqlSessionTemplate sst, Map<String,Object> map){
		return sst.selectList("board.selectSearch", map);
	}
}
