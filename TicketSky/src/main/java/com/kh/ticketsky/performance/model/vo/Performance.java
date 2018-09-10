package com.kh.ticketsky.performance.model.vo;

import java.sql.Date;

public class Performance {

	private int performNo;
	private String performName;
	private String placeName;
	private String placeAddress;
	private Date ticketOpenDate;
	private Date startDate;
	private Date endDate;
	private int categoryNo;
	private Date regDate;
	private String userId;
	private String companyName;
	private String companyPhoneNum;
	private String performTime;
	private String performGrade;
	private String performConfirm;
	private String performContent;
	private String major;
	private String minor;
	
	public Performance(int performNo, String performName, String placeName, String placeAddress, Date ticketOpenDate,
			Date startDate, Date endDate, int categoryNo, Date regDate, String userId, String companyName,
			String companyPhoneNum, String performTime, String performGrade, String performConfirm,
			String performContent, String major, String minor) {
		super();
		this.performNo = performNo;
		this.performName = performName;
		this.placeName = placeName;
		this.placeAddress = placeAddress;
		this.ticketOpenDate = ticketOpenDate;
		this.startDate = startDate;
		this.endDate = endDate;
		this.categoryNo = categoryNo;
		this.regDate = regDate;
		this.userId = userId;
		this.companyName = companyName;
		this.companyPhoneNum = companyPhoneNum;
		this.performTime = performTime;
		this.performGrade = performGrade;
		this.performConfirm = performConfirm;
		this.performContent = performContent;
		this.major = major;
		this.minor = minor;
	}
	public int getPerformNo() {
		return performNo;
	}
	public void setPerformNo(int performNo) {
		this.performNo = performNo;
	}
	public String getPerformName() {
		return performName;
	}
	public void setPerformName(String performName) {
		this.performName = performName;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public String getPlaceAddress() {
		return placeAddress;
	}
	public void setPlaceAddress(String placeAddress) {
		this.placeAddress = placeAddress;
	}
	public Date getTicketOpenDate() {
		return ticketOpenDate;
	}
	public void setTicketOpenDate(Date ticketOpenDate) {
		this.ticketOpenDate = ticketOpenDate;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyPhoneNum() {
		return companyPhoneNum;
	}
	public void setCompanyPhoneNum(String companyPhoneNum) {
		this.companyPhoneNum = companyPhoneNum;
	}
	public String getPerformTime() {
		return performTime;
	}
	public void setPerformTime(String performTime) {
		this.performTime = performTime;
	}
	public String getPerformGrade() {
		return performGrade;
	}
	public void setPerformGrade(String performGrade) {
		this.performGrade = performGrade;
	}
	public String getPerformConfirm() {
		return performConfirm;
	}
	public void setPerformConfirm(String performConfirm) {
		this.performConfirm = performConfirm;
	}
	public String getPerformContent() {
		return performContent;
	}
	public void setPerformContent(String performContent) {
		this.performContent = performContent;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getMinor() {
		return minor;
	}
	public void setMinor(String minor) {
		this.minor = minor;
	}
	
}