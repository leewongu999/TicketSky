package com.kh.ticketsky.ranking;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RankingController 
{
	
	@RequestMapping("/ranking/ranking.do")
	public ModelAndView memoView(ModelAndView mv)
	{
		mv.setViewName("ranking/ranking");
		
		return mv;
	}

	
	
	
	
	
	
	
	
	
	
}
