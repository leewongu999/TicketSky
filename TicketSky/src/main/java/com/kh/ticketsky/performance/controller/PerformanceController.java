package com.kh.ticketsky.performance.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PerformanceController {

	private Logger logger = LoggerFactory.getLogger(PerformanceController.class);
	

	@RequestMapping("/performance/performanceList.do")
	public String performanceList(String category, Model model)
	{
		model.addAttribute("category", category);
		return "performance/performanceList";
	}
	@RequestMapping("/performance/performanceView.do")
	public ModelAndView performanceView(ModelAndView mv, int no)
	{
		mv.addObject("no", no);
		mv.setViewName("performance/performanceView");
		return mv;
	}
}
