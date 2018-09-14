package com.kh.ticketsky;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ticketsky.common.Page;
import com.kh.ticketsky.ranking.model.service.RankingService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController 
{
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private RankingService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,ModelAndView mv) 
	{
		logger.debug("목록페이지(cPage) : "+cPage);

		//페이지 당 자료수 
		int numPerPage=4;
		
		
		List<Map<String,String>> list = service.selectRankingList(cPage,numPerPage);

		logger.debug("리스트 : "+list);
		
		int totalCount=service.selectTotalCount();

		logger.debug("리스트 : "+totalCount);
		
		mv.addObject("list",list);
		mv.addObject("totalCount",totalCount);

		mv.setViewName("home");
		return mv;

	}
}
