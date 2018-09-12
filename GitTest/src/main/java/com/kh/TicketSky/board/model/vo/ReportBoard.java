package com.kh.TicketSky.board.model.vo;

import java.sql.Date;

public class ReportBoard extends Report{
	private int boardNo;
	
	public ReportBoard() {
		
	}

	public ReportBoard(int reportNo, String reportReason, String userId, int reviewNo, String reportConfirm,
			Date reportDate, int boardNo) {
		super();
		this.boardNo = boardNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "ReportBoard [boardNo=" + boardNo + "]";
	}
}
