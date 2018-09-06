package com.kh.TicketSky.board.model.service;
import java.util.*;
import com.kh.TicketSky.board.model.vo.*;

public interface BoardService {
	List<Board> selectList(int cPage, int numPerPage);
	int selectTotalContents();
	int insertBoard(Board b);
	int updateBoard(Board b);
	int deleteBoard(Board b);
	Board selectOne(int boardNo);
	int addVisits(Board b);
	List<Map<String,Object>> selectSearch(Map<String,Object> map);
	int selectSearchTotalContents(Map<String,Object> map);
	int addReply(Reply re);
}
