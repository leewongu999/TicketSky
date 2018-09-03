package com.kh.TicketSky.board.model.service;
import java.util.*;
import com.kh.TicketSky.board.model.vo.Board;

public interface BoardService {
	List<Map<String,String>> selectList();
	int selectTotalContents();
	int insertBoard(Board b);
	int updateBoard();
	int deleteBoard();
	Board selectBoard(int boardNo);
}
