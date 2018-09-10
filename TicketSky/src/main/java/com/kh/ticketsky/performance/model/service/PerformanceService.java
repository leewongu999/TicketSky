package com.kh.ticketsky.performance.model.service;

import java.util.List;
import java.util.Map;

import com.kh.ticketsky.performance.model.vo.Performance;

public interface PerformanceService {

	List<Map<String, String>> categoryList(String category);
	
	List<Map<String, String>> performAllList(String category);

	List<Map<String, String>> performSelectList(Map<String, String> map);

	Map<String, Object> performSelectOne(int no);

	List<Map<String, Object>> performReview(int no);

	int performReviewInsert(Map<String, Object> map);

	int performReviewDelete(int reviewNo);

	Map<String, Object> performReviewOne(int reviewNo);

	int performReviewUpdateEnd(Map<String, Object> map);

	

	

	

	

	

}
