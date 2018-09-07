package com.kh.TicketSky.board.model.vo;

import java.sql.Date;

public class Reply {
	private int replyNo;
	private String userId;
	private String comments;
	private Date writeDate;
	private int boardNo;		// 댓글 달린 게시글의 번호를 알아야 한다.
	
	public Reply() {
		
	}

	public Reply(int replyNo, String userId, String comments,
			Date writeDate, int boardNo) {
		super();
		this.replyNo = replyNo;
		this.userId = userId;
		this.comments = comments;
		this.writeDate = writeDate;
		this.boardNo = boardNo;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
	
	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "댓글 번호 : " + replyNo + ", 댓글 작성자 ID : " + userId
			+ ", 댓글 내용 : " + comments + ", 댓글 단 날 : " + writeDate
			+ ", 게시글 번호 : " + boardNo;
	}
}
