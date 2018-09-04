package com.kh.TicketSky.board.model.service;
import java.util.*;
import com.kh.TicketSky.board.model.vo.Board;

public interface BoardService {
	List<Board> selectList(int cPage, int numPerPage);
	int selectTotalContents();
	int insertBoard(Board b);
	int updateBoard(Board b);
	int deleteBoard(Board b);
	Board selectOne(int boardNo);
}
