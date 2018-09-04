package com.kh.TicketSky.board.model.dao;
import org.mybatis.spring.SqlSessionTemplate;
import com.kh.TicketSky.board.model.vo.Board;
import java.util.*;

public interface BoardDAO {
	List<Board> selectList(SqlSessionTemplate sst);
	int selectTotalContents(SqlSessionTemplate sst);
	int insertBoard(SqlSessionTemplate sst, Board b);
	int updateBoard(SqlSessionTemplate sst, Board b);
	int deleteBoard(SqlSessionTemplate sst, Board b);
	Board selectOne(SqlSessionTemplate sst, int boardNo);
}
