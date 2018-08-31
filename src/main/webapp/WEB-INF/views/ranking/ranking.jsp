<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

 
<style>
	
	div .container
	{
	    padding-left : 50px;
	    padding-right : 50px;  
	    
	}
	
	div .inner
	{
	    padding-left : 60px;
	    padding-right : 60px;
	}
	
	td img
	{
		width : 100px;
		height : 150px;
	}
	table td.tdpadding
	{
		padding-top: 6%;
		
	}
	li a 
	{
		display: inline-block; 
		text-align:center; 
		padding-top:15px;
	}
	ul 
	{
	    margin:0;
	    padding:0;
	}

	li 
	{
	    margin: 0 0 0 0;
	    padding: 0 0 0 0;
	    border : 0;
	    display: inline-block;
	}
	
	.list-inline 
	{
		width : 140px;
		height : 20px;
	}
	
</style>

<div class="container"> 
     <ul class="category">
       <li class="active"><a href="#none" categoryID="16">뮤지컬</a></li>
       <li><a href="#none" categoryID="15">콘서트</a></li>
       <li><a href="#none" categoryID="17">연극</a></li>
       <li><a href="#none" categoryID="18">클래식</a></li>
       <li><a href="#none" categoryID="22">레저</a></li>
       <li><a href="#none" categoryID="20">전시</a></li>
       <li><a href="#none" categoryID="21">가족/어린이</a></li>
   </ul>
  
  
  
  
	<div class="inner">	
	<table class="table" style="text-align: center;">
	  <thead class="thead-dark">
	    <tr>
	      <th scope="col"> 순위 </th>
   	      <th scope="col">  </th>
	      <th scope="col"> 공연명 </th>
	      <th scope="col"> 예매율 </th>
	      <th scope="col"> 공연기간 </th>
	      <th scope="col"> 장소 </th>
	      <th scope="col"> 예매하기 </th>
	    </tr>
	  </thead>
	  <tbody>
	    <tr>
	      <th class="tdpadding" >1</th>
	      <td><img src="http://image.toast.com/aaaaab/ticketlink/TKL_3/thanks_main0620.jpg"></td>
   	      <td class="tdpadding">Mark</td>
          <td class="tdpadding">9.62 %</td>
          <td class="tdpadding">2018.08.01 ~ 2018.10.28</td>
          <td class="tdpadding">대학로 아트원씨어터2관</td>	      
		  <td class="tdpadding"><button type="button" class="btn btn-success">Success</button></td>	      
	    </tr>
	    
   	    <tr>
	      <th class="tdpadding" scope="row">2</th>
	      <td><img src="http://image.toast.com/aaaaab/ticketlink/TKL_3/thanks_main0620.jpg"></td>
   	      <td class="tdpadding">Mark</td>
          <td class="tdpadding">9.62 %</td>
          <td class="tdpadding">2018.08.01 ~ 2018.10.28</td>
          <td class="tdpadding">대학로 아트원씨어터2관</td>	      
		  <td class="tdpadding"><button type="button" class="btn btn-success">Success</button></td>	      
	    </tr>
	    
   	    <tr>
	      <th scope="row"> 3 </th>
	      <td><img src="http://image.toast.com/aaaaab/ticketlink/TKL_3/thanks_main0620.jpg"></td>
   	      <td class="tdpadding">핑크 스트로베리</td>
          <td class="tdpadding">9.62 %</td>
          <td class="tdpadding">2018.08.01 ~ 2018.10.28</td>
          <td class="tdpadding">대학로 아트원씨어터2관</td>	      
		  <td class="tdpadding"><button type="button" class="btn btn-success">Success</button></td>	      
	    </tr>
	    
		<tr>
	      <th scope="row"> 4 </th>
	      <td><img src="http://image.toast.com/aaaaab/ticketlink/TKL_3/thanks_main0620.jpg"></td>
   	      <td class="tdpadding">핑크 스트로베리</td>
          <td class="tdpadding">9.62 %</td>
          <td class="tdpadding">2018.08.01 ~ 2018.10.28</td>
          <td class="tdpadding">대학로 아트원씨어터2관</td>	      
		  <td class="tdpadding"><button type="button" class="btn btn-success">Success</button></td>	      
	    </tr>
	    
		<tr>
	      <th scope="row"> 5 </th>
	      <td><img src="http://image.toast.com/aaaaab/ticketlink/TKL_3/thanks_main0620.jpg"></td>
   	      <td class="tdpadding">핑크 스트로베리</td>
          <td class="tdpadding">9.62 %</td>
          <td class="tdpadding">2018.08.01 ~ 2018.10.28</td>
          <td class="tdpadding">대학로 아트원씨어터2관</td>	      
		  <td class="tdpadding"><button type="button" class="btn btn-success">Success</button></td>	      
	    </tr>
	  </tbody>
	</table>
	</div> <!-- inner -->
</div>

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>