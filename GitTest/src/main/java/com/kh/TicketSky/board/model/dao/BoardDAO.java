package com.kh.TicketSky.board.model.dao;
import org.mybatis.spring.SqlSessionTemplate;
import com.kh.TicketSky.board.model.vo.Board;
import java.util.*;

public interface BoardDAO {
	List<Map<String,String>> selectList(SqlSessionTemplate sst);
	int selectTotalContents(SqlSessionTemplate sst);
	int insertBoard(SqlSessionTemplate sst, Board b);
	int updateBoard(SqlSessionTemplate sst, Board b);
	int deleteBoard(SqlSessionTemplate sst, Board b);
	Board selectBoard(SqlSessionTemplate sst, int boardNo);
}
