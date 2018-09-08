package com.kh.ticketsky.performance.model.service;

import java.util.List;
import java.util.Map;

import com.kh.ticketsky.performance.model.vo.Performance;

public interface PerformanceService {

	List<Map<String, String>> categoryList(String category);
	
	List<Map<String, String>> performAllList(String category);

	List<Map<String, String>> performSelectList(Map<String, String> map);

	Performance performSelectOne(int no);

	

	

	

}
