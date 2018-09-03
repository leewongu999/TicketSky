package com.kh.TicketSky.board.controller;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.kh.TicketSky.board.model.service.BoardService;
import com.kh.TicketSky.board.model.vo.Board;
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
		String pageBar = new Page().getPage(cPage, numPerPage, totalContents,
						request.getRequestURI());
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("numPerPage", numPerPage);
		request.setAttribute("list", list);
		request.setAttribute("totalContents", totalContents);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("url", request.getRequestURI());
		
		return "community/board";
	}
	
	@RequestMapping("/community/comboardView.do")
	public String selectBoard(int boardNo, HttpServletRequest request) {
		request.setAttribute("board", service.selectBoard(boardNo));
		return "community/comboardView";
	}
	
	@RequestMapping(value="/community/comboardForm.do", method= {RequestMethod.POST})
	public String insertBoard(Board b) {
		String msg = "";
		String loc = "";
		int result = service.insertBoard(b);
		if(result>0) {
			msg = "성공적으로 등록되었습니다.";
			loc = "/community/comboardView.do?boardNo="+b.getBoardNo();
		}
		else {
			msg = "등록을 실패하였습니다.";
			loc = "/community/board.do";
		}
		return "common/msg";
	}
	
	@RequestMapping("/community/comboardUpdate.do")
	public String updateBoard(Board b) {
		String msg = "";
		String loc = "";
		int result = service.updateBoard(b);
		if(result>0) {
			msg = "정상적으로 수정되었습니다.";
			loc = "/community/comboardView.do?boardNo="+b.getBoardNo();
		}
		else {
			msg = "수정을 실패하였습니다.";
			loc = "/community/board.do";
		}
		return "common/msg";
	}
	
	@RequestMapping("/community/comboardDelete.do")
	public String deleteBoard(Board b) {
		String msg = "";
		String loc = "";
		int result = service.deleteBoard(b);
		if(result>0) {
			msg = "게시글이 정상적으로 삭제되었습니다.";
			loc = "/community/board.do";
		}
		else {
			msg = "삭제를 실패하였습니다.";
			loc = "/community/comboardView.do?boardNo="+b.getBoardNo();
		}
		return "common/msg";
	}
}
