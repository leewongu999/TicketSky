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
	
	@RequestMapping("/community/board")
	public String boardList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, HttpServletRequest request) {
		final int numPerPage = 10;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage = 1;
		}
		List<Board> list = service.selectList(cPage, numPerPage);
		int totalContents = service.selectTotalContents();	// 전체 게시글 수
		String pageBar = new Page().getPage(cPage, numPerPage, totalContents, request.getRequestURI());
		
		request.setAttribute("list", list);
		request.setAttribute("totalContents", totalContents);
		request.setAttribute("pageBar", pageBar);
		
		return "community/board";
	}
	
	@RequestMapping("/community/comboardView")
	public String selectBoard(int boardNo, HttpServletRequest request) {
		request.setAttribute("board", service.selectOne(boardNo));
		request.setAttribute("visits", service.addVisits(service.selectOne(boardNo)));
		return "community/comboardView";
	}
	
	@RequestMapping("/community/comboardForm")
	public String insertOne() {
		return "community/comboardForm";
	}
	
	@RequestMapping("/community/comboardFormEnd")
	public String insertBoard(Board b, HttpServletRequest request) {
		request.getCharacterEncoding();
		String msg = "";
		String boardTitle = request.getParameter("boardtitle");
		String userID = request.getParameter("userID");
		String file = request.getParameter("file");
		String contents = request.getParameter("content");
		b = new Board(0, boardTitle, contents, userID, 0, 0, file, null);
		int result = service.insertBoard(b);
		if(result>0) {
			msg = "성공적으로 등록되었습니다.";
		}else {
			msg = "등록을 실패하였습니다.";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", "/community/board?cPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/community/comboardUpdate")
	public String updateOne(Board b, HttpServletRequest request) {
		int boardNo;
		try {
			boardNo = Integer.parseInt((String)request.getParameter("boardNo"));
		}catch(NumberFormatException e) {
			boardNo = 1;
		}
		b = service.selectOne(boardNo);
		request.setAttribute("board", b);
		return "community/comboardUpdate";
	}
	
	@RequestMapping("/community/comboardUpdateEnd")
	public String updateBoard(Board b, HttpServletRequest request) {
		request.getCharacterEncoding();
		String msg = "";
		String loc = "";
		int boardNo;
		try {
			boardNo = Integer.parseInt(request.getParameter("boardNo"));
		}catch(NumberFormatException e) {
			boardNo = 1;
		}
		String boardtitle = request.getParameter("boardtitle");
		String userID = request.getParameter("userID");
		String file = request.getParameter("file");
		String content = request.getParameter("content");
		b = (Board)request.getAttribute("board");
		
		b = new Board(boardNo, boardtitle, content, userID, 0, 0, file, null);
		int result = service.updateBoard(b);
		System.out.println("게시글 수정 결과 : "+b);
		System.out.println("결과 : "+result);
		if(result>0) {
			msg = "정상적으로 수정되었습니다.";
			loc = "/community/comboardView?boardNo="+b.getBoardNo();
		}else {
			msg = "수정을 실패하였습니다.";
			loc = "/community/board?cPage=1";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		return "common/msg";
	}
	
	@RequestMapping("/community/comboardDelete")
	public String deleteOne(Board b, HttpServletRequest request) {
		int boardNo;
		try {
			boardNo = Integer.parseInt(request.getParameter("boardNo"));
		}catch(NumberFormatException e) {
			boardNo = 1;
		}
		b = service.selectOne(boardNo);
		request.setAttribute("board", b);
		return "community/comboardDelete";
	}
	
	@RequestMapping("/community/comboardDeleteEnd")
	public String deleteBoard(Board b, HttpServletRequest request) {
		String msg = "";
		String loc = "";
		try {
			b.setBoardNo(Integer.parseInt(request.getParameter("deleteBoardNo")));
		}catch(NumberFormatException e) {
			b.setBoardNo(1);
		}
		int result = service.deleteBoard(b);
		System.out.println("선택한 게시글 번호 : "+b.getBoardNo());
		if(result>0) {
			msg = "게시글이 정상적으로 삭제되었습니다.";
			loc = "/community/board?cPage=1";
		}else {
			msg = "삭제를 실패하였습니다.";
			loc = "/community/board?cPage=1";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		return "common/msg";
	}
	
	@RequestMapping("/community/boardKeyword")
	public String selectSearch(Map<String,Object> map) {
		List<Map<String,Object>> bList = service.selectSearch(map);
		return "community/board";
	}
}
