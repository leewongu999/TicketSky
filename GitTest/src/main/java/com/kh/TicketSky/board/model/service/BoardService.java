package com.kh.TicketSky.board.model.service;
import java.util.*;
import com.kh.TicketSky.board.model.vo.*;

public interface BoardService {
	// 1. 게시판 관련
	List<Board> selectList(int cPage, int numPerPage);				// 전체 게시글 출력
	int selectTotalContents();										// 전체 게시글의 수
	int insertBoard(Board b);										// 새 게시글 등록
	int updateBoard(Board b);										// 해당 게시글 내용 수정
	int deleteBoard(Board b);										// 해당 게시글 삭제
	Board selectOne(int boardNo);									// 해당 게시글 조회
	int addVisits(Board b);											// 해당 게시글 조회수
	
	// 2. 검색 조건을 만족하는 게시글 관련
	List<Map<String,Object>> selectSearch(Map<String,Object> map);	// 검색 조건을 만족하는 게시글만 출력
	int selectSearchTotalContents(Map<String,Object> map);			// 검색 조건을 만족하는 게시글만의 수
	
	// 3. 댓글 관련
	int addReply(Reply re);											// 댓글 달기
	int replyPlus(Reply re);											// 댓글 추가에 따른 댓글 수 증가
	List<Reply> showReplies(int boardNo);							// 해당 게시글에 달린 전체 댓글
	int selectTotalReplies(int boardNo);							// 해당 게시글에 달린 전체 댓글의 수
	int deleteReply(Reply re);										// 댓글 삭제
	int replyMinus(Reply re);										// 댓글 삭제에 따른 댓글 수 감소
}
