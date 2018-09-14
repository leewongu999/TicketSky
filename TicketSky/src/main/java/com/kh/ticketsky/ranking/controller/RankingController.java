package com.kh.ticketsky.ranking.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ticketsky.common.Page;
import com.kh.ticketsky.ranking.model.service.RankingService;

@Controller
public class RankingController 
{
	
	
	private Logger logger=LoggerFactory.getLogger(RankingController.class);
	
	@Autowired
	private RankingService service1;
	
	@RequestMapping("/ranking/ranking.do")
	public ModelAndView Ranking(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,ModelAndView mv)
	{
		logger.debug("목록페이지(cPage) : "+cPage);

		int numPerPage=10;
		
		List<Map<String,String>> list = service1.selectRankingList(cPage,numPerPage);

		logger.debug("리스트 : "+list);
		
		int totalCount=service1.selectTotalCount();

		logger.debug("리스트 : "+totalCount);
		
		mv.addObject("list",list);
		mv.addObject("totalCount",totalCount);
		mv.addObject("pageBar",Page.getPage(cPage, numPerPage, totalCount, "ranking.do"));

		mv.setViewName("ranking/ranking");
		
		return mv; 
	}
//
//	
//	@RequestMapping("/ranking/rankingList.do")
//	public ModelAndView rankingList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage)
//	{
//		    
//	}
	
	
	
	
	
	
	
}


