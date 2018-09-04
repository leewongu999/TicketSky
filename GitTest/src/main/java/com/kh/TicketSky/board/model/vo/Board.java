package com.kh.TicketSky.board.model.vo;
import java.sql.Date;

public class Board {
	private int boardNo;				// 게시글 번호
	private String boardTitle;			// 게시글 제목
	private String content;				// 게시글 내용
	private String userId;				// 작성자
	private int visits;					// 조회 수
	private int attachmentNo;			// 첨부파일번호
	private String originalFileName;	// 업로드 첨부파일명
	private Date writeDate;				// 작성일
	
	public Board() {
		
	}

	public Board(int boardNo, String boardTitle, String content, String userId, int visits,
			int attachmentNo, String originalFileName, Date writeDate) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.content = content;
		this.userId = userId;
		this.visits = visits;
		this.attachmentNo = attachmentNo;
		this.originalFileName = originalFileName;
		this.writeDate = writeDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getVisits() {
		return visits;
	}

	public void setVisits(int visits) {
		this.visits = visits;
	}
	
	public int getAttachmentNo() {
		return attachmentNo;
	}

	public void setAttachmentNo(int attachmentNo) {
		this.attachmentNo = attachmentNo;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "글 번호 : " + boardNo + ", 제목 : " + boardTitle
				+ ", 내용 : " + content + ", 작성자 아이디 : " + userId
				+ ", 조회수 : " + visits + ", 첨부파일 번호 : " + attachmentNo
				+ ", 업로드한 첨부파일명 : " + originalFileName + ", 작성일 : " + writeDate;
	}
}
