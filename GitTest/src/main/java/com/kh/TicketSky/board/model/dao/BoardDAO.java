package com.kh.TicketSky.board.model.dao;
import org.mybatis.spring.SqlSessionTemplate;
import com.kh.TicketSky.board.model.vo.*;
import java.util.*;

public interface BoardDAO {
	List<Board> selectList(SqlSessionTemplate sst, int cPage, int numPerPage);
	int selectTotalContents(SqlSessionTemplate sst);
	int insertBoard(SqlSessionTemplate sst, Board b);
	int updateBoard(SqlSessionTemplate sst, Board b);
	int deleteBoard(SqlSessionTemplate sst, Board b);
	Board selectOne(SqlSessionTemplate sst, int boardNo);
	int addVisits(SqlSessionTemplate sst, Board b);
	List<Map<String,Object>> selectSearch(SqlSessionTemplate sst, Map<String,Object> map);
	int selectSearchTotalContents(SqlSessionTemplate sst, Map<String,Object> map);
	int addReply(SqlSessionTemplate sst, Reply re);
}
