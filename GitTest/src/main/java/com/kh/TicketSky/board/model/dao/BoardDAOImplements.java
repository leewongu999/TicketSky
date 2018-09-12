package com.kh.TicketSky.board.model.dao;
import java.util.*;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.TicketSky.board.model.vo.*;

@Repository
public class BoardDAOImplements implements BoardDAO {
	// 1. 게시판 관련
	// 페이징 처리에 의해 게시글을 최근에 올린 순서대로 나열한다.
	@Override
	public List<Board> selectList(SqlSessionTemplate sst, int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sst.selectList("board.selectList", null, rows);
	}
	// 전체 게시글의 수를 출력한다.
	@Override
	public int selectTotalContents(SqlSessionTemplate sst) {
		return sst.selectOne("board.selectOne");
	}
	// 새 게시글 등록
	@Override
	public int insertBoard(SqlSessionTemplate sst, Board b) {
		return sst.insert("board.insert", b);
	}
	// 해당 게시글 내용 수정
	@Override
	public int updateBoard(SqlSessionTemplate sst, Board b) {
		return sst.insert("board.update", b);
	}
	// 해당 게시글 삭제
	@Override
	public int deleteBoard(SqlSessionTemplate sst, Board b) {
		return sst.delete("board.delete", b);
	}
	// 해당 게시글 조회
	@Override
	public Board selectOne(SqlSessionTemplate sst, int boardNo) {
		return sst.selectOne("board.selectBoard", boardNo);
	}
	// 해당 게시글 조회수
	@Override
	public int addVisits(SqlSessionTemplate sst, Board b) {
		return sst.update("board.addVisit", b);
	}
	// 마지막 게시글 번호
	@Override
	public int maxBoardNo(SqlSessionTemplate sst) {
		return sst.selectOne("board.maxBoardNo");
	}
	
	// 2. 검색 조건을 만족하는 게시글 관련
	// 검색 조건을 만족하는 게시글만 출력
	@Override
	public List<Map<String,Object>> selectSearch(SqlSessionTemplate sst, Map<String,Object> map){
		return sst.selectList("board.selectSearch", map);
	}
	// 검색 조건을 만족하는 게시글의 수를 출력
	@Override
	public int selectSearchTotalContents(SqlSessionTemplate sst, Map<String,Object> map){
		return sst.selectOne("board.selectSearchOne", map);
	}
	
	// 3. 댓글 관련
	// 댓글 달기
	@Override
	public int addReply(SqlSessionTemplate sst, Reply re) {
		return sst.insert("board.addReply", re);
	}
	// 댓글이 하나 달릴 때마다 댓글의 수를 1 증가
	@Override
	public int replyPlus(SqlSessionTemplate sst, Reply re) {
		return sst.update("board.replyPlus", re);
	}
	// 해당 게시글에 달린 전체 댓글 출력
	@Override
	public List<Reply> showReplies(SqlSessionTemplate sst, int boardNo) {
		return sst.selectList("board.showReplies", boardNo);
	}
	// 해당 게시글에 달린 전체 댓글의 수
	@Override
	public int selectTotalReplies(SqlSessionTemplate sst, int boardNo) {
		return sst.selectOne("board.countReplies", boardNo);
	}
	// 해당 게시글에 달린 댓글 삭제(여기서는 댓글 고유 번호로 따진다.)
	@Override
	public int deleteReply(SqlSessionTemplate sst, Reply re) {
		return sst.delete("board.deleteReply", re);
	}
	// 댓글이 하나 삭제될 때마다 댓글의 수를 1 감소
	@Override
	public int replyMinus(SqlSessionTemplate sst, Reply re) {
		return sst.update("board.replyMinus", re);
	}
	// 마지막 댓글 번호
	@Override
	public int maxReplyNo(SqlSessionTemplate sst) {
		return sst.selectOne("board.maxReplyNo");
	}
	
	// 4. 게시글 또는 댓글 신고
	// 게시글 신고
	@Override
	public int reportBoard(SqlSessionTemplate sst, ReportBoard rBoard) {
		return sst.insert("board.reportBoard", rBoard);
	}
	// 댓글 신고
	@Override
	public int reportReply(SqlSessionTemplate sst, ReportReply rReply) {
		return sst.insert("board.reportReply", rReply);
	}
}
