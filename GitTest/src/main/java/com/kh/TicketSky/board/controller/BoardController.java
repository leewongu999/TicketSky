package com.kh.TicketSky.board.controller;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
/*import org.slf4j.*;*/
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.kh.TicketSky.board.model.service.BoardService;
import com.kh.TicketSky.board.model.vo.*;
import com.kh.TicketSky.common.*;

@Controller
public class BoardController {
/*	private Logger logger = LoggerFactory.getLogger(BoardController.class);*/
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("/community/board")
	public String boardList(@RequestParam(value="cPage", required=false, defaultValue="1")
							int cPage, HttpServletRequest request) {
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
	
	@RequestMapping("/community/replies")
	public String replies(int boardNo, int totalReplies, HttpServletRequest request) {
		try {
			boardNo = Integer.parseInt(request.getParameter("boardNo"));
			totalReplies = service.selectTotalReplies(boardNo);
		}catch(NumberFormatException e) {
			boardNo = 1;
			totalReplies = 0;
		}
		System.out.println("게시글 번호 : "+boardNo);
		System.out.println("댓글 수 : "+totalReplies);
		request.setAttribute("totalReplies", totalReplies);
		return "community/board";
	}
	
	@RequestMapping("/community/comboardView")
	public String selectBoard(int boardNo, HttpServletRequest request) {
		request.setAttribute("visits", service.addVisits(service.selectOne(boardNo)));
		request.setAttribute("board", service.selectOne(boardNo));
		request.setAttribute("replies", service.showReplies(boardNo));
		int totalReplies = service.selectTotalReplies(boardNo);
		request.setAttribute("totalReplies", totalReplies);
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
		b = new Board(0, boardTitle, contents, userID, 0, 0, file, null, 0);
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
		b.setBoardNo(boardNo);
		b.setBoardTitle(request.getParameter("title"));
		b.setUserId(request.getParameter("userID"));
		request.setAttribute("board", b);
		return "community/comboardUpdate";
	}
	
	@RequestMapping("/community/comboardUpdateEnd")
	public String updateBoard(Board b, HttpServletRequest request) {
		request.getCharacterEncoding();
		String msg = "";
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
		
		b = new Board(boardNo, boardtitle, content, userID, 0, 0, file, null, 0);
		int result = service.updateBoard(b);
		if(result>0) {
			msg = "정상적으로 수정되었습니다.";
		}else {
			msg = "수정을 실패하였습니다.";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", "/community/board?cPage=1");
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
		try {
			b.setBoardNo(Integer.parseInt(request.getParameter("deleteBoardNo")));
		}catch(NumberFormatException e) {
			b.setBoardNo(1);
		}
		int result = service.deleteBoard(b);
		System.out.println("선택한 게시글 번호 : "+b.getBoardNo());
		if(result>0) {
			msg = "게시글이 정상적으로 삭제되었습니다.";
		}else {
			msg = "삭제를 실패하였습니다.";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", "/community/board?cPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/community/boardKeyword")
	public String selectSearch(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
								Map<String,Object> map, HttpServletRequest request) {
		final int numPerPage = 10;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage = 1;
		}
		String item = request.getParameter("item");
		String searchKeyword = request.getParameter("searchKeyword");
		
		map = new HashMap<String, Object>();
		map.put("item", item);
		map.put("searchKeyword", searchKeyword);
		map.put("cPage", cPage);
		
		int totalContents = service.selectSearchTotalContents(map);
		List<Map<String,Object>> bList = service.selectSearch(map);
		String pageBar = new PageKeyword().getPage(cPage, numPerPage, totalContents, request.getRequestURI());
		
		request.setAttribute("bList", bList);
		request.setAttribute("totalContents", totalContents);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("searchKeyword", searchKeyword);
		request.setAttribute("cPage", cPage);
		return "community/boardKeyword";
	}
	
	@RequestMapping("/community/comboardReply")
	public String addReply(HttpServletRequest request) {
		String replyContent = request.getParameter("replyContent");
		String msg = "";
		String loc = "";
		int boardNo;
		try {
			boardNo = Integer.parseInt(request.getParameter("boardNo"));
		}catch(NumberFormatException e) {
			boardNo = 1;
		}
		// 아래의 줄 설명
		// Reply 객체에서 두 번째 인자(String형)는 Member 클래스에서 가져와야 한다.
		// 여기서는 임의의 값을 넣었기 때문에, 나중에 다른 것과 합칠 때에는 이 입력한 값을 지우고 m.getUserId()와 같이 바꿔주세요.
		// 그리고 그 클래스를 import하는 것도 잊지 마세요.
		Reply re = new Reply(0, "관리자", replyContent, null, boardNo);
		
		int result1 = service.addReply(re);
		int result2 = service.replyPlus(re);
		if(result1>0 && result2>0) {
			msg = "댓글이 정상적으로 달렸습니다.";
			loc = "/community/comboardView?boardNo="+re.getBoardNo();
		}else {
			msg = "댓글 추가를 실패하였습니다.";
			loc = "/community/board";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.setAttribute("reply", re);
		return "common/msg";
	}
	
	@RequestMapping("/community/replyDelete")
	public String deleteOne(Reply re, HttpServletRequest request) {
		int replyNo;
		int bNo;
		try {
			replyNo = Integer.parseInt(request.getParameter("replyNo"));
			bNo = Integer.parseInt(request.getParameter("bNo"));
		}catch(NumberFormatException e) {
			replyNo = 1;
			bNo = 1;
		}
		re.setReplyNo(replyNo);
		re.setBoardNo(bNo);
		request.setAttribute("reply", re);
		return "community/replyDelete";
	}
	
	@RequestMapping("/community/delReplyEnd")
	public String deleteReply(Reply re, HttpServletRequest request) {
		String msg = "";
		try {
			re.setReplyNo(Integer.parseInt(request.getParameter("deleteReplyNo")));
			re.setBoardNo(Integer.parseInt(request.getParameter("replyBoardNo")));
		}catch(NumberFormatException e) {
			re.setReplyNo(1);
			re.setBoardNo(1);
		}
		int result1 = service.deleteReply(re);
		System.out.println("댓글 고유 번호 : "+re.getReplyNo());
		System.out.println("댓글이 달린 게시글 번호 : "+re.getBoardNo());
		int result2 = service.replyMinus(re);
		if(result1>0 && result2>0) {
			msg = "댓글이 정상적으로 삭제되었습니다.";
		}else {
			msg = "댓글 삭제가 실패하였습니다.";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", "/community/board");
		return "common/msg";
	}
	
	@RequestMapping("/community/comboardReport")
	public String reportBoard(HttpServletRequest request) {
		int boardNo;
		try {
			boardNo = Integer.parseInt(request.getParameter("boardNo"));
		}catch(NumberFormatException e) {
			boardNo = 1;
		}
		int maxBoardNo = service.maxBoardNo();
		System.out.println("신고할 게시글 번호 : "+boardNo);
		request.setAttribute("reportBoardNo", boardNo);
		request.setAttribute("maxBNo", maxBoardNo);
		return "community/reportBoard";
	}
	
	@RequestMapping("/community/replyReport")
	public String reportReply(HttpServletRequest request) {
		int replyNo;
		try {
			replyNo = Integer.parseInt(request.getParameter("replyNo"));
		}catch(NumberFormatException e) {
			replyNo = 1;
		}
		int maxReplyNo = service.maxReplyNo();
		System.out.println("신고할 댓글 번호 : "+replyNo);
		request.setAttribute("maxRNo", maxReplyNo);
		request.setAttribute("reportReplyNo", replyNo);
		return "community/reportReply";
	}
	
	@RequestMapping("/community/reportReplyEnd")
	public String reportReplyConfirm(ReportReply rReply, int replyRPT, HttpServletRequest request) {
		String msg = "";
		try {
			replyRPT = Integer.parseInt(request.getParameter("replyRPT"));
		}catch(NumberFormatException e) {
			replyRPT = 1;
		}
		String userID = request.getParameter("userID");
		String reportReason = request.getParameter("reportReason");
		rReply = new ReportReply(0, reportReason, userID, 0, null, null, replyRPT);
		int result = service.reportReply(rReply);
		System.out.println(replyRPT);
		
		if(result>0) {
			msg = "댓글 신고를 관리자에게 보냈습니다.";
		}else {
			msg = "신고가 제대로 이루어지지 않았습니다.";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", "/community/board?cPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/community/reportBoardEnd")
	public String reportBoardConfirm(ReportBoard rBoard, int boardRPT, HttpServletRequest request) {
		String msg = "";
		try {
			boardRPT = Integer.parseInt(request.getParameter("boardRPT"));
		}catch(NumberFormatException e) {
			boardRPT = 1;
		}
		String userID = request.getParameter("userID");
		String reportReason = request.getParameter("reportReason");
		rBoard = new ReportBoard(0, reportReason, userID, 0, null, null, boardRPT);
		int result = service.reportBoard(rBoard);
		System.out.println(boardRPT);
		
		if(result>0) {
			msg = "게시글 신고를 관리자에게 보냈습니다.";
		}else {
			msg = "신고가 제대로 이루어지지 않았습니다.";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", "/community/board?cPage=1");
		return "common/msg";
	}
}