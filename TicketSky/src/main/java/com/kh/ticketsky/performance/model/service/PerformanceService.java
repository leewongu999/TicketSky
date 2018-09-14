package com.kh.ticketsky.performance.model.service;

import java.util.List;
import java.util.Map;

public interface PerformanceService {

	List<Map<String, String>> categoryList(String category);
	
	List<Map<String, String>> performAllList(String category);

	List<Map<String, String>> performSelectList(Map<String, String> map, int cPage, int numPerPage);

	Map<String, Object> performSelectOne(int no);

	List<Map<String, Object>> performReview(int no, int cPage, int numPerPage);

	int performReviewInsert(Map<String, Object> map);

	int performReviewDelete(int reviewNo);

	Map<String, Object> performReviewOne(int reviewNo);

	int performReviewUpdateEnd(Map<String, Object> map);

	int performSelectTotalCount(Map<String, String> map);

	int performReviewTotalCount(int no);

	

	

	

	

	

	

}
