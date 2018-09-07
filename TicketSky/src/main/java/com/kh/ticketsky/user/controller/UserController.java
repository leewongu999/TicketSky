package com.kh.ticketsky.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.ticketsky.common.Page;
import com.kh.ticketsky.user.model.service.UserService;
import com.kh.ticketsky.user.model.vo.Member;

//value = "" 이렇게 주면 session으로 값 저장하게 됨.
@SessionAttributes(value= {"memberLoggedIn","snsLoginChk"})

@Controller
public class UserController {

	@Autowired
	private JavaMailSender mailSender;
	private Logger logger=LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService service;

	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("/user/consumerMyPage")
	public String consumerMyPage()
	{
		return "consumer/consumerMyPage";
	}
	
	@RequestMapping("/user/userDelete")
	public String consumerDelete() {
		return "consumer/userDelete";
	}
	

	@RequestMapping("/user/reserveList")
	public String reserveList(Model model, HttpSession session) {
		
		Member m = (Member)session.getAttribute("memberLoggedIn");
		List<Map<String,String>> list = service.selectReserveList(m.getUserId());
		
		return "consumer/reserveList";
	}
	
	@RequestMapping("/user/reviewManage")
	public String reviewManage() {
		return "consumer/reviewManage";
	}
	
	
	@RequestMapping("/user/inquiryManage")
	public String inquiryManage() {
		return "consumer/inquiryManage";
	}
	
	
	@RequestMapping("/user/forgetPassword")
	public String forgetPassword() {
		return "consumer/forgetPassword";
	}
	
	@RequestMapping("/user/adminPlayConfirm")
	public String adminPlayConfirm() {
		return "admin/playConfirm";
	}
	
	@RequestMapping("/user/adminPlayManage")
	public String adminPlayManage() {
		return "admin/playManage";
	}
	
	@RequestMapping("/user/userUpdate")
	public String userUpdate() {
		return "consumer/userUpdate";
	}
	
	@RequestMapping("user/adminUserUpdate")
	public String adminUserUpdate(String userId, Model model) {
		Member m = service.selectOne(userId);
		
		model.addAttribute("m",m);
		return "admin/userUpdate";
	}
	
	@RequestMapping("user/adminUserUpdateEnd")
	public String adminUserUpdateEnd(Member m, Model model) {
		String msg="";
		String loc="";
		
		int result = service.updateConsumer(m);
		if(result>0){
			msg="회원정보가 변경되었습니다.";
			loc="/user/consumerList";
		}
		else {
			msg="회원정보 수정이 실패하였습니다.";
			loc="/user/consumerList";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}
	
	@RequestMapping("/user/sellerUpdate")
	public String sellerUpdate() {
		return "seller/sellerUpdate";
	}
	
	@RequestMapping("/user/consumerRatingSetting")
	public String consumeRatingSetting(Model model) {
		List<Map<String,String>> list = service.selectConsumerRating(); 
		model.addAttribute("list",list);
		return "admin/ratingSetting";
	}
	
	@RequestMapping("/user/consumerRatingSettingEnd")
	public String consumeRatingSettingEnd(String ratingCode, String ratingName, String discountrate, String ratingamount, Model model) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("ratingCode", ratingCode);
		map.put("ratingName", ratingName);
		map.put("discountrate", discountrate);
		map.put("ratingamount", ratingamount);
		
		System.out.println("ratingCode : " + ratingCode);
		System.out.println("ratingName : " + ratingName);
		System.out.println("discountrate : " + discountrate);
		System.out.println("ratingamount : " + ratingamount);
		
		int result = service.updateConsumerRating(map);	
		String msg="";
		String 	loc="/user/consumerRatingSetting";

		if(result>0){
			msg="등급 수정 완료.";
		}
		else {
			msg="등급 수정 실패.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}
	
	
	
	
	@RequestMapping("/user/consumerList")
	public String consumerList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
			@RequestParam(value="searchTitle", required=false, defaultValue="") String searchTitle,
			HttpServletRequest req,Model model) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("searchType", searchType);
		map.put("searchTitle", searchTitle);
		int numPerPage = 10;
		List<Member> list = service.selectConsumerList(cPage, numPerPage,map);

		int totalCount = service.selectConsumerTotalCount(map);
		String pageBar = new Page().getPage(cPage, numPerPage, totalCount, req.getRequestURI());
		
		
		model.addAttribute("list",list);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("pageBar",pageBar);
		
		return "admin/consumerList";
	}
	
	@RequestMapping("/user/sellerList")
	public String sellerList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
			@RequestParam(value="searchTitle", required=false, defaultValue="") String searchTitle,
			HttpServletRequest req,Model model) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("searchType", searchType);
		map.put("searchTitle", searchTitle);
		int numPerPage = 10;
		List<Member> list = service.selectSellerList(cPage, numPerPage,map);

		int totalCount = service.selectSellerTotalCount(map);
		String pageBar = new Page().getPage(cPage, numPerPage, totalCount, req.getRequestURI());
		
		
		model.addAttribute("list",list);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("pageBar",pageBar);
		
		return "admin/sellerList";
	}
	
	
	@RequestMapping("/user/sellerStatus")
	public String sellerStatus() {
		return "seller/sellerStatus";
	}
	
	@RequestMapping("/user/sellerStatusInfo")
	public String sellerStatusInfo() {
		return "seller/sellerStatusInfo";
	}
	
	@RequestMapping("/user/userDeleteChk")
	public String userDeleteChk() {
		return "consumer/userDeleteChk";
	}
	
	@RequestMapping("/user/sellerReviewManage")
	public String sellerReviewManage() {
		return "seller/reviewManage";
	}
	
	@RequestMapping("/user/sellerInquiryManage")
	public String sellerInquiryManage() {
		return "seller/inquiryManage";
	}
	
	@RequestMapping("/user/sellerMyPlayList")
	public String sellerMyPlayList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
			@RequestParam(value="searchTitle", required=false, defaultValue="") String searchTitle,
			HttpServletRequest req,Model model, HttpSession session) {
		Member m = (Member)session.getAttribute("memberLoggedIn");

		Map<String,String> map = new HashMap<String,String>();
		map.put("searchType", searchType);
		map.put("searchTitle", searchTitle);
		map.put("userId", m.getUserId());
		int numPerPage = 10;

		
		List<Map<String,String>> list = service.selectMyPlayList(cPage, numPerPage,map);
		int totalCount = service.selectSellerPlayTotalCount(map);
		String pageBar = new Page().getPage(cPage, numPerPage, totalCount, req.getRequestURI());

		model.addAttribute("list",list);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("pageBar",pageBar);


		return "seller/myPlayList";
		
		/*Map<String,String> map = new HashMap<String,String>();
		map.put("searchType", searchType);
		map.put("searchTitle", searchTitle);
		int numPerPage = 10;
		List<Member> list = service.selectConsumerList(cPage, numPerPage,map);

		int totalCount = service.selectConsumerTotalCount(map);
		String pageBar = new Page().getPage(cPage, numPerPage, totalCount, req.getRequestURI());
		
		
		model.addAttribute("list",list);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("pageBar",pageBar);
		
		return "admin/consumerList";*/
	}
	
	@RequestMapping("/user/adminInquiryManage")
	public String adminInquiryManage() {
		return "admin/inquiryManage";
	}
	
	@RequestMapping("/user/adminReportBoard")
	public String adminReportBoard() {
		return "admin/reportBoard";
	}
	
	@RequestMapping("/user/consumerDeleteOne")
	public String consumerDeleteOne(String userId, Model model) {
		String msg="";
		String loc="/user/consumerList";
		int result = service.deleteConsumer(userId);
		
		if(result>0){
			msg="회원 삭제가 정상적으로 완료되었습니다.";
		}
		else {
			msg="회원 삭제가 실패하였습니다";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}

	@RequestMapping("/user/userDelete.do")
	public String userDelete(String password, Model model,HttpSession session) {
		String msg="";
		String loc="";
		String deleteChk="";
		System.out.println(password);
		Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
		String snsLoginChk = (String)session.getAttribute("snsLoginChk"); 
		if(bcryptPasswordEncoder.matches(password, memberLoggedIn.getPassword())){ // 현재 비밀번호가 일치하면
			int result = service.deleteConsumer(memberLoggedIn.getUserId());
			if(result>0){
				msg="회원탈퇴가 정상적으로 처리되었습니다.";
				loc="/user/userlogout.do";
			}
			else {
				msg="회원탈퇴가 실패하였습니다";
				loc="/user/userDelete";
			}
			deleteChk="1";

		}else {
			if(snsLoginChk.equals("1")) { // sns 로그인이면 
				int result = service.deleteConsumer(memberLoggedIn.getUserId());
				if(result>0){
					msg="회원탈퇴가 정상적으로 처리되었습니다.";
					loc="/user/userlogout.do";
				}
				else {
					msg="회원탈퇴가 실패하였습니다";
					loc="/user/userDelete";
				}
				deleteChk="1";
			}else {
				msg="비밀번호가 일치하지 않습니다.";
				loc="/user/userDeleteChk";
			}
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		model.addAttribute("deleteChk",deleteChk);
		return "common/msg";
	}
	
	@RequestMapping("/user/userUpdateEnd")
	public String userUpdateEnd(String oripassword, Member m, Model model,HttpSession session) {
		String msg="";
		String loc="";
		Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
		String snsLoginChk= (String)session.getAttribute("snsLoginChk");
		String enPw = bcryptPasswordEncoder.encode(m.getPassword());
		m.setPassword(enPw);
		if(bcryptPasswordEncoder.matches(oripassword, memberLoggedIn.getPassword())){ // 현재 비밀번호가 일치하면
			int result = service.updateConsumer(m);
			if(result>0){
				msg="회원정보가 변경되었습니다. 다시 로그인 해주세요";
				loc="/user/userlogout.do";
			}
			else {
				msg="회원정보 수정이 실패하였습니다.";
				loc="/user/userUpdate";
			}
		}else {
			if(snsLoginChk.equals("1")) {
				int result = service.updateConsumer(m);
				if(result>0){
					msg="회원정보가 변경되었습니다. 다시 로그인 해주세요";
					loc="/user/userlogout.do";
				}
				else {
					msg="회원정보 수정이 실패하였습니다.";
					loc="/user/userUpdate";
				}
			}else {
				msg="비밀번호가 일치하지 않습니다.";
				loc="/user/userUpdate";
			}
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}
	
	@RequestMapping("/user/login")
	public String login() {
		return "consumer/login";
	}
	
	@RequestMapping("/user/userlogout.do")
	public String memberLogout(SessionStatus ss)
	{
		if(logger.isDebugEnabled()) {
			logger.debug("로그인아웃  : "+ss);
		}
		//SessionStatus ss에 완료가 됬으면 세션값이 끊어지는데 완료 안됬다고 조건을 주고
		//조건문 안에 setCompelete를 하면 세션이 끊어짐!!
		if(!ss.isComplete())
		{
			ss.setComplete();
		}
		
		return "redirect:/";
	}
	
	@RequestMapping("/user/consumerEnroll")
	public String consumerEnroll(@RequestParam(value="userId", required=false, defaultValue="") String userId, 
			@RequestParam(value="userName", required=false, defaultValue="") String userName,
			@RequestParam(value="snsLogin", required=false, defaultValue="0") String snsLogin, Model model) {
		if(snsLogin.equals("1")) {
			model.addAttribute("userName",userName);
			model.addAttribute("userId",userId);
			model.addAttribute("snsLogin",snsLogin);
		}
		return "consumer/consumerEnroll";
	}
	
	@RequestMapping("/user/sellerEnroll")
	public String sellerEnroll() {
		return "seller/sellerEnroll";
	}
	
	/* 구매자 회원가입 */
	@RequestMapping("/user/sellerEnrollEnd")
	public String sellerEnrollEnd(Member member, Model model)
	{		
		//암호화 처리
		String enPw = bcryptPasswordEncoder.encode(member.getPassword());
				
		member.setPassword(enPw);
		
		int result=service.insertSeller(member);
		String msg="";
		String loc="";
		if(result>0)
		{
			msg="회원가입을 성공하였습니다. 로그인을 해주세요.";
		}
		else
			msg="회원가입을 실패하였습니다.";
		loc="/";
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}
	
	
	/* 구매자 회원가입 */
	@RequestMapping("/user/consumerEnrollEnd")
	public String memberEnrollEnd(Member member, Model model)
	{		
		//암호화 처리
		String enPw = bcryptPasswordEncoder.encode(member.getPassword());
				
		member.setPassword(enPw);
		
		int result=service.insertConsumer(member);
		String msg="";
		String loc="";
		if(result>0)
		{
			msg="회원가입을 성공하였습니다. 로그인을 해주세요.";
		}
		else
			msg="회원가입을 실패하였습니다.";
		loc="/";
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
		
	}
	
	/* 아이디 중복체크 */
	@RequestMapping("/user/checkDuplicate.do")
	@ResponseBody
	public String duplicate(String userId, Model model) throws Exception
	{
		Map<String,Object> map = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = null;
		boolean flag=service.selectOne(userId)!=null?true:false; 
//		List<Board> bList = new ArrayList<Board>(); 
//		bList.add(new Board(0,"board","yoo",URLEncoder.encode("하하하", "UTF-8"),null,0));
//		bList.add(new Board(1,"board1","boo",URLEncoder.encode("호호호", "UTF-8"),null,1));
		
		
		map.put("flag", flag);
		
		jsonStr = mapper.writeValueAsString(map);
		
		
		return jsonStr;
	}
	
	/* 로그인 */
	@RequestMapping(value="/user/memberLogin.do", method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView login(@RequestParam(value="saveId", required=false, defaultValue="0") String saveId,@RequestParam(value="snsLoginChk", required=false, defaultValue="0") String snsLoginChk, String userId, String password, HttpServletResponse response) throws Exception
	{		
		Member m = service.selectOne(userId);
		
		ModelAndView mv=new ModelAndView();
		//객체를 String, model로 나뉜걸 같이 쓰는게 ModelAndView 이다.
		String msg="";
		String loc="";
		String userChk = "";
		if(m==null)
		{
			msg="존재하지 않는 아이디입니다.";
			loc="/user/login";
		}
		else
		{
			if(bcryptPasswordEncoder.matches(password, m.getPassword())){
				//위에 조건문은 Encoder가 매칭 메소드에서 내가 적은 비밀번호와 디비에있는 비밀번호를 써주면
				//맞는지 비교해줌.
				msg="로그인 성공";
				mv.addObject("memberLoggedIn",m);
				mv.addObject("snsLoginChk",snsLoginChk);
				userChk = m.getSeparator();
				if(saveId.equals("1")) {
					Cookie setCookie = new Cookie("saveId", saveId); // 쿠키 생성
					Cookie id = new Cookie("id", userId); // 쿠키 생성
					setCookie.setMaxAge(60*60*24*30);
					response.addCookie(setCookie);
					id.setMaxAge(60*60*24*30);
					response.addCookie(id);
				}else {
					Cookie setCookie = new Cookie("saveId", null); // 쿠키 생성
					setCookie.setMaxAge(0); // 기간을 하루로 지정
					response.addCookie(setCookie);
					Cookie id = new Cookie("id", null); // 쿠키 생성
					id.setMaxAge(0); // 기간을 하루로 지정
					response.addCookie(id);
				}
			}
			else
			{
				if(snsLoginChk.equals("1")) {
					msg="로그인 성공";
					mv.addObject("memberLoggedIn",m);
					mv.addObject("snsLoginChk",snsLoginChk);
					userChk = m.getSeparator();
					if(saveId.equals("1")) {
						Cookie setCookie = new Cookie("saveId", saveId); // 쿠키 생성
						Cookie id = new Cookie("id", userId); // 쿠키 생성
						setCookie.setMaxAge(60*60*24*30);
						response.addCookie(setCookie);
						id.setMaxAge(60*60*24*30);
						response.addCookie(id);
					}else {
						Cookie setCookie = new Cookie("saveId", null); // 쿠키 생성
						setCookie.setMaxAge(0); // 기간을 하루로 지정
						response.addCookie(setCookie);
						Cookie id = new Cookie("id", null); // 쿠키 생성
						id.setMaxAge(0); // 기간을 하루로 지정
						response.addCookie(id);
					}
				}else {
					msg="비밀번호가 일치하지 않습니다.";
					loc="/user/login";
				}
			}
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.addObject("userChk",userChk);
		mv.setViewName("common/msg");
		return mv;
	}
	
	   @RequestMapping(value="/user/findPassword", method= {RequestMethod.POST,RequestMethod.GET})
	   public ModelAndView findPassword(String userName, String email, HttpServletResponse response,HttpServletRequest request) throws Exception
	   {
	      ModelAndView mv=new ModelAndView();
	      //객체를 String, model로 나뉜걸 같이 쓰는게 ModelAndView 이다.
	      
	      Member m = service.selectOne("kdf321");
	      
	      String msg="";
	      String loc="";
	      String userChk = "";
	      
	      if(/*m.getUserName().equals(userName) && m.getEmail().equals(email)*/true)
	      {
	          String setfrom = "TicketSky7@gmail.com";  //이메일을 보낼 주소     
	         
	          try 
	          {
	             
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper messageHelper 
	                              = new MimeMessageHelper(message, true, "UTF-8");
	       
	            messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	            messageHelper.setTo(m.getEmail());     // 받는사람 이메일
	            messageHelper.setSubject("요청하신 비밀번호입니다."); // 메일제목은 생략이 가능하다
	            messageHelper.setText("비밀번호 "+m.getPassword());  // 메일 내용
	           
	            mailSender.send(message);
	            
	            msg = "입력하신 메일 주소로 비밀번호를 발송하였습니다";
	          }
	          
	          catch(Exception e)
	          {
	             e.printStackTrace();
	          }
	          
	      }
	      else
	      {
	         msg =" (임시)false임니당 "; 
	      }
	      
	      mv.addObject("msg",msg);
	      mv.addObject("loc",loc);
	      mv.addObject("userChk",userChk);
	      mv.setViewName("common/msg");
	      return mv;
	   }
	
}
