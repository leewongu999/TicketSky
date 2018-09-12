package com.kh.TicketSky.board.model.service;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.TicketSky.board.model.dao.BoardDAO;
import com.kh.TicketSky.board.model.vo.*;

import java.util.*;

@Service
public class BoardServiceImplements implements BoardService {
	@Autowired
	private BoardDAO dao;
	@Autowired
	private SqlSessionTemplate sst;
	
	// 1. 게시판 관련
	// 전체 게시글 출력
	@Override
	public List<Board> selectList(int cPage, int numPerPage) {
		return dao.selectList(sst, cPage, numPerPage);
	}
	// 전체 게시글의 수
	@Override
	public int selectTotalContents() {
		return dao.selectTotalContents(sst);
	}
	// 새 게시글 등록
	@Override
	public int insertBoard(Board b) {
		return dao.insertBoard(sst, b);
	}
	// 해당 게시글 내용 수정
	@Override
	public int updateBoard(Board b) {
		return dao.updateBoard(sst, b);
	}
	// 해당 게시글 삭제
	@Override
	public int deleteBoard(Board b) {
		return dao.deleteBoard(sst, b);
	}
	// 해당 게시글 조회
	@Override
	public Board selectOne(int boardNo) {
		return dao.selectOne(sst, boardNo);
	}
	// 해당 게시글 조회수
	@Override
	public int addVisits(Board b) {
		return dao.addVisits(sst, b);
	}
	// 최근 게시글 번호
	@Override
	public int maxBoardNo() {
		return dao.maxBoardNo(sst);
	}
	
	// 2. 검색 조건을 만족하는 게시글 관련
	// 검색 조건을 만족하는 게시글만 출력
	@Override
	public List<Map<String,Object>> selectSearch(Map<String,Object> map){
		return dao.selectSearch(sst, map);
	}
	// 검색 조건을 만족하는 게시글만의 수
	@Override
	public int selectSearchTotalContents(Map<String,Object> map) {
		return dao.selectSearchTotalContents(sst, map);
	}
	
	// 3. 댓글 관련
	// 댓글 달기
	@Override
	public int addReply(Reply re) {
		return dao.addReply(sst, re);
	}
	// 댓글 추가될 때마다 댓글 수 증가
	@Override
	public int replyPlus(Reply re) {
		return dao.replyPlus(sst, re);
	}
	// 해당 게시글에 달린 전체 댓글 보여주기
	@Override
	public List<Reply> showReplies(int boardNo) {
		return dao.showReplies(sst, boardNo);
	}
	// 해당 게시글에 달린 전체 댓글의 수
	@Override
	public int selectTotalReplies(int boardNo) {
		return dao.selectTotalReplies(sst, boardNo);
	}
	// 댓글 삭제(댓글 고유 번호로 식별할 수 있기 때문에 게시글 번호가 필요없다.)
	@Override
	public int deleteReply(Reply re) {
		return dao.deleteReply(sst, re);
	}
	// 댓글 삭제될 때마다 댓글 수 감소
	@Override
	public int replyMinus(Reply re) {
		return dao.replyMinus(sst, re);
	}
	// 최근 댓글 번호
	@Override
	public int maxReplyNo() {
		return dao.maxReplyNo(sst);
	}
	
	// 4. 게시글 또는 댓글 신고 관련
	// 게시글 신고
	@Override
	public int reportBoard(Report rpt) {
		return dao.reportBoard(sst, rpt);
	}
	// 댓글 신고
	@Override
	public int reportReply(Report rpt) {
		return dao.reportReply(sst, rpt);
	}
}
