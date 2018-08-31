package com.kh.TicketSky.board.model.dao;
import java.util.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.TicketSky.board.model.vo.Board;

@Repository
public class BoardDAOImplements implements BoardDAO {
	@Override
	public List<Map<String, String>> selectList(SqlSessionTemplate sst) {
		return sst.selectList("selectList");
	}
	@Override
	public int selectTotalContents(SqlSessionTemplate sst) {
		return sst.selectOne("selectOne");
	}
	@Override
	public int insertBoard(SqlSessionTemplate sst) {
		return sst.insert("insert");
	}
	@Override
	public int updateBoard(SqlSessionTemplate sst) {
		return sst.insert("update");
	}
	@Override
	public int deleteBoard(SqlSessionTemplate sst) {
		return sst.delete("delete");
	}
	@Override
	public Board selectBoard(SqlSessionTemplate sst, int boardNo) {
		return sst.selectOne("selectBoard", boardNo);
	}
}
