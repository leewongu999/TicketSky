package com.kh.ticketsky.performance.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ticketsky.performance.model.service.PerformanceService;
import com.kh.ticketsky.performance.model.vo.Performance;



@Controller
public class PerformanceController {

	private Logger logger = LoggerFactory.getLogger(PerformanceController.class);
	
	@Autowired
	private PerformanceService service;
	
	
	@RequestMapping("/performance/performanceAllList.do")
	public String performanceAllList(String category, Model model)	{
		
		
		List<Map<String,String>> allList = service.performAllList(category);
		List<Map<String,String>> categoryList = service.categoryList(category);
		model.addAttribute("category", category);
		model.addAttribute("allList", allList);
		model.addAttribute("categoryList", categoryList);
		return "performance/performanceAllList";
		
		
			
		
	}
	@RequestMapping("/performance/performanceSelectList.do")
	public String performanceSelectList(String category, String subCategory, Model model)
	{
		Map<String,String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("subCategory", subCategory);
		List<Map<String,String>> list = service.performSelectList(map);
		List<Map<String,String>> categoryList = service.categoryList(category);
		model.addAttribute("category", category);
		model.addAttribute("selectList", list);		
		model.addAttribute("categoryList",categoryList);
		model.addAttribute("subCategory",subCategory);
		return "performance/performanceSelectList";
	}
	
	@RequestMapping("/performance/performanceView.do")
	public ModelAndView performanceView(ModelAndView mv, int no) {
		
		System.out.println("여긴나오냐??");
		Performance p = service.performSelectOne(no);
		System.out.println(p);
		mv.addObject("p", p);
		mv.addObject("no", no);
		mv.setViewName("performance/performanceView");
		return mv;
	}
	
}
