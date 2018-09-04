package com.kh.ticketsky.user.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.kh.ticketsky.user.controller.UserController;
import com.kh.ticketsky.user.model.service.UserService;
import com.kh.ticketsky.user.model.vo.Member;

//value = "" 이렇게 주면 session으로 값 저장하게 됨.
@SessionAttributes(value= {"memberLoggedIn"})
@Controller
public class UserController {

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
	public String reserveList() {
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
	
	
	@RequestMapping("/user/userUpdate")
	public String userUpdate() {
		return "consumer/userUpdate";
	}
	
	@RequestMapping("/user/userUpdateEnd")
	public String userUpdateEnd(String oripassword, Member m, Model model,HttpSession session) {
		String msg="";
		String loc="";
		Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
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
			msg="비밀번호가 일치하지 않습니다.";
			loc="/user/userUpdate";
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
	public String consumerEnroll() {
		return "consumer/consumerEnroll";
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
	public ModelAndView login(@RequestParam(value="saveId", required=false, defaultValue="0") String saveId, String userId, String password, HttpServletResponse response) throws Exception
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
		}
		else
		{
			if(bcryptPasswordEncoder.matches(password, m.getPassword())){
				//위에 조건문은 Encoder가 매칭 메소드에서 내가 적은 비밀번호와 디비에있는 비밀번호를 써주면
				//맞는지 비교해줌.
				msg="로그인 성공";
				mv.addObject("memberLoggedIn",m);
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
				msg="비밀번호가 일치하지 않습니다.";
			}
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.addObject("userChk",userChk);
		mv.setViewName("common/msg");
		return mv;
	}
}
