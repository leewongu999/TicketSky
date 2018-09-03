package com.kh.TicketSky.board.controller;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.kh.TicketSky.board.model.service.BoardService;
import com.kh.TicketSky.common.Page;

@Controller
public class BoardController {
	private Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("/community/board.do")
	public String boardList(int cPage, HttpServletRequest request) {
		try {
			
		}
		catch(NumberFormatException e) {
			cPage = 1;
		}
		logger.debug("목록페이지(cPage) : "+cPage);
		final int numPerPage = 10;
		List<Map<String,String>> list = service.selectList();
		logger.debug("리스트 : "+list);
		int totalContents = service.selectTotalContents();	// 전체 게시글 수
		String pageBar = new Page()
				.getPage(cPage, numPerPage, totalContents,
						request.getRequestURI());
		
		request.setAttribute("list", list);
		request.setAttribute("totalContents", totalContents);
		request.setAttribute("pageBar", pageBar);
		
		return "community/board";
	}
	
	@RequestMapping("/community/comboardView.do")
	public String selectBoard(int boardNo, HttpServletRequest request) {
		request.setAttribute("board", service.selectBoard(boardNo));
		return "community/comboardView";
	}
}
