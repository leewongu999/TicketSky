package com.kh.TicketSky.board.model.vo;

import java.sql.Date;

public class ReportReply extends Report{
	private int replyNo;
	
	public ReportReply() {
		
	}

	public ReportReply(int reportNo, String reportReason, String userId, int reviewNo, String reportConfirm,
			Date reportDate, int replyNo) {
		super();
		this.replyNo = replyNo;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	@Override
	public String toString() {
		return "ReportReply [replyNo=" + replyNo + "]";
	}
	
}
