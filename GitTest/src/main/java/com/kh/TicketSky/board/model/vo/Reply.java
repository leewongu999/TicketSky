package com.kh.TicketSky.board.model.vo;

import java.sql.Date;

public class Reply {
	private int replyNo;
	private String userId;
	private String comments;
	private Date writeDate;
	
	public Reply() {
		
	}

	public Reply(int replyNo, String userId, String comments, Date writeDate) {
		super();
		this.replyNo = replyNo;
		this.userId = userId;
		this.comments = comments;
		this.writeDate = writeDate;
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

	@Override
	public String toString() {
		return "댓글 번호 : " + replyNo + ", 댓글 작성자 ID : " + userId
			+ ", 댓글 내용 : " + comments + ", 댓글 단 날 : " + writeDate;
	}
}
