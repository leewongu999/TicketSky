package com.kh.TicketSky.board.model.dao;
import org.mybatis.spring.SqlSessionTemplate;
import com.kh.TicketSky.board.model.vo.*;
import java.util.*;

public interface BoardDAO {
	// 1. 게시판 관련
	List<Board> selectList(SqlSessionTemplate sst, int cPage, int numPerPage);		// 전체 게시글 출력
	int selectTotalContents(SqlSessionTemplate sst);								// 전체 게시글의 수
	int insertBoard(SqlSessionTemplate sst, Board b);								// 새 게시글 등록
	int updateBoard(SqlSessionTemplate sst, Board b);								// 해당 게시글 내용 수정
	int deleteBoard(SqlSessionTemplate sst, Board b);								// 해당 게시글 삭제
	Board selectOne(SqlSessionTemplate sst, int boardNo);							// 해당 게시글 조회
	int addVisits(SqlSessionTemplate sst, Board b);									// 조회수 증가
	int maxBoardNo(SqlSessionTemplate sst);											// 최근 게시글 번호
	// 2. 검색 조건을 만족하는 게시글 관련
	List<Map<String,Object>> selectSearch(SqlSessionTemplate sst, Map<String,Object> map);	// 검색 조건을 만족하는 게시글만 출력
	int selectSearchTotalContents(SqlSessionTemplate sst, Map<String,Object> map);			// 검색 조건을 만족하는 게시글만의 수 출력
	// 3. 댓글 관련
	int addReply(SqlSessionTemplate sst, Reply re);									// 댓글 달기
	int replyPlus(SqlSessionTemplate sst, Reply re);								// 댓글 추가될 때마다 댓글 수 증가
	List<Reply> showReplies(SqlSessionTemplate sst, int boardNo);					// 해당 게시글에 달린 전체 댓글 보여주기
	int selectTotalReplies(SqlSessionTemplate sst, int boardNo);					// 해당 게시글에 달린 댓글의 수
	int deleteReply(SqlSessionTemplate sst, Reply re);								// 해당 게시글에 달린 댓글 삭제(댓글 고유 번호로 찾는다.)
	int replyMinus(SqlSessionTemplate sst, Reply re);								// 댓글 삭제될 때마다 댓글 수 감소
	int maxReplyNo(SqlSessionTemplate sst);											// 최근 댓글 번호
	// 4. 게시글 또는 댓글 신고 관련
	int reportBoard(SqlSessionTemplate sst, Report rpt);							// 게시글 신고
	int reportReply(SqlSessionTemplate sst, Report rpt);							// 댓글 신고
}
