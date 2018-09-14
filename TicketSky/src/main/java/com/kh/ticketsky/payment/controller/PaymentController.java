package com.kh.ticketsky.payment.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class PaymentController 
{

	
	
	
	@RequestMapping(value="/payment/payment.do",method= {RequestMethod.POST})
	public ModelAndView Payment(@RequestParam("imp_amount") int imp_amount,HttpServletResponse res)
	{
		ModelAndView mv=new ModelAndView();
		System.out.println(imp_amount);
	    ObjectMapper mapper = new ObjectMapper();
	    
	    
	    try 
	    {
	    	res.getWriter().print(mapper.writeValueAsString(imp_amount));
	    }
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		mv.setViewName("mail/mailForm");
		return mv;
	}

}