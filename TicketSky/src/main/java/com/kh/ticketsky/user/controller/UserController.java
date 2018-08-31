package com.kh.ticketsky.user.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.ticketsky.user.controller.UserController;
import com.kh.ticketsky.user.model.service.UserService;
import com.kh.ticketsky.user.model.vo.Member;

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
	
	@RequestMapping("/user/login")
	public String login() {
		return "consumer/login";
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
	public ModelAndView login(String userId, String password) throws Exception
	{		
		/*과부화 줄이기 위해*/
		if(logger.isDebugEnabled())
		{
			logger.debug("로그인페이지 : "+userId);
		}
		
		Member m = service.selectOne(userId);
		
		/*try {
			if(true)
			{
				throw new RuntimeException("my Error");
			}
		}
		catch(Exception e)
		{
			logger.error("로그인 에러 : ", e);
			throw new MyException("로그인 에러 : "+e.getMessage());
		}*/
		
		ModelAndView mv=new ModelAndView();
		//객체를 String, model로 나뉜걸 같이 쓰는게 ModelAndView 이다.
		String msg="";
		String loc="";
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
				
			}
			else
			{
				msg="비밀번호가 일치하지 않습니다.";
			}
		}
		loc="/";
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
}
