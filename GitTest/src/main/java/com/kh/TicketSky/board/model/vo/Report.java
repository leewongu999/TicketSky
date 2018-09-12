package com.kh.TicketSky.board.model.vo;
import java.sql.Date;

public class Report {
	private int reportNo;
	private String reportReason;
	private String userId;
	private int reviewNo;
	private String reportConfirm;
	private Date reportDate;
	
	public Report() {
		
	}

	public Report(int reportNo, String reportReason, String userId, int reviewNo, String reportConfirm,
			Date reportDate) {
		super();
		this.reportNo = reportNo;
		this.reportReason = reportReason;
		this.userId = userId;
		this.reviewNo = reviewNo;
		this.reportConfirm = reportConfirm;
		this.reportDate = reportDate;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getReportReason() {
		return reportReason;
	}

	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReportConfirm() {
		return reportConfirm;
	}

	public void setReportConfirm(String reportConfirm) {
		this.reportConfirm = reportConfirm;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportReason=" + reportReason + ", userId=" + userId + ", reviewNo="
				+ reviewNo + ", reportConfirm=" + reportConfirm + ", reportDate=" + reportDate + "]";
	}
}
