package com.kh.ticketsky.performance.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ticketsky.performance.model.service.PerformanceService;



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
		model.addAttribute("subCategory",subCategory);
		model.addAttribute("selectList", list);		
		model.addAttribute("categoryList",categoryList);
		
		
		return "performance/performanceSelectList";
		
	}
	
	@RequestMapping("/performance/performanceView.do")
	public ModelAndView performanceView(ModelAndView mv, int no) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		List<Map<String,Object>> reviewList = service.performReview(no);
		
		map= service.performSelectOne(no);
		
		mv.addObject("reviewList", reviewList);
		mv.addAllObjects(map);
		mv.addObject("no", no);
		mv.setViewName("performance/performanceView");
		
		return mv;
	}
	
	@RequestMapping("/performance/performReviewInsert.do")
	public String performReviewInsert(Model model, String review, int no, int starScore) {

		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("review", review);
		map.put("no", no);
		map.put("score",starScore);
		
		int result = service.performReviewInsert(map);
		
		return "redirect:/performance/performanceView.do?no="+no;
	}
	
	@RequestMapping("/performance/performReviewDelete.do")
	public String performReviewDelete(Model model, int reviewNo, int no)
	{
		
		int result = service.performReviewDelete(reviewNo);
		System.out.println("공연번호 : "+no+", 댓글번호 : "+reviewNo);
		return "redirect:/performance/performanceView.do?no="+no;
	}
	
	@RequestMapping("/performance/performReviewUpdate.do")
	public String performReviewUpdate(int reviewNo, Model model) 
	{
		/*String html="<p>what???????</p>";
		res.getWriter().print(html);*/
		Map<String,Object> map = service.performReviewOne(reviewNo);
		model.addAllAttributes(map);
		
		return "/performance/reviewUpdateForm";
	}
	
	@RequestMapping("/performance/performReviewUpdateCancel.do")
	public String performReviewUpdateCancel(int reviewNo, Model model)
	{
		/*res.setContentType("text/html; charset=UTF-8");
		Map<String,Object> map = service.performReviewOne(reviewNo);
		String html="<p>"+map.get("REVIEWCONTENT")+"</p>";
		res.getWriter().print(html);*/
		Map<String,Object> map = service.performReviewOne(reviewNo);
		model.addAllAttributes(map);
		
		return "/performance/reviewForm";
	}
	
	@RequestMapping("/performance/performReviewUpdateEnd.do")
	public String performReviewUpdateEnd(Model model, int reviewNo, int starUpdateScore, String reviewUp_message)
	{
		System.out.println(reviewNo+ starUpdateScore +reviewUp_message);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("reviewNo", reviewNo);
		map.put("reviewUp_message", reviewUp_message);
		map.put("starUpdateScore", starUpdateScore);
		int result = service.performReviewUpdateEnd(map);
		
		Map<String,Object> upMap = service.performReviewOne(reviewNo);
		model.addAllAttributes(upMap);
		
		
		return "/performance/reviewForm";
		
	}
	
	
}
