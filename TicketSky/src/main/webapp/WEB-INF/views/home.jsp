<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>

 
<!-- 합쳐지고 최소화된 최신 CSS -->

<style>
	  
  	div .carousel-inner
  	{
  		height: 400px;
  	}
  
	.ticketTodayTitle 
	{
  		height: 19px;
  		margin: 30px 0;
  		background: url("//ticketimage.interpark.com/TicketImage/2015/20150429_main/img/ticketToday_Titles.gif") 0 0 no-repeat;
  		margin-left: 75px;
	}

</style>


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <section class="new_arrivals_area section-padding-80 clearfix">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading text-center">
                        <br>
                        <h2> ${category } </h2>

                        <!-- <img src="${path}/resources/img/musical.jpg" align='center'/> -->
                        <div id="demo" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ul class="carousel-indicators">
                                
                                  <li data-target="#demo" data-slide-to="0" class="active"> </li>
                                  
                                  <li data-target="#demo" data-slide-to="1"> </li>
                                  
                                  <li data-target="#demo" data-slide-to="2"> </li>
                                  
                                  <li data-target="#demo" data-slide-to="3"> </li>
                                </ul>

                                <!-- The slideshow -->
                                <div class="carousel-inner">
                                  <div class="carousel-item active">
                                    <img src="${path}/resources/img/bg-img/breadcumb.jpg" alt="Los Angeles">
                                  </div>
                                  <div class="carousel-item">
                                    <img src="${path}/resources/img/bg-img/breadcumb.jpg" alt="Chicago">
                                  </div>

                                  <div class="carousel-item">
                                    <img src="${path}/resources/img/bg-img/breadcumb.jpg" alt="New York">
                                  </div>
                                  
                                  <div class="carousel-item">
                                    <img src="${path}/resources/img/bg-img/breadcumb.jpg" alt="New York">
                                  </div>
                                  
                                </div>

                                <!-- Left and right controls -->

                                <a class="carousel-control-prev" href="#demo" data-slide="prev">
                                  <span class="carousel-control-prev-icon"></span>
                                </a>
                                
                                <a class="carousel-control-next" href="#demo" data-slide="next">
                                  <span class="carousel-control-next-icon"></span>
                                </a>
                              </div>

                    </div>
                </div>
            </div>
        </div>

 

        <div class="container">
            <h2 style="text-align: center">추천공연</h2>
            <div class="ticketTodayTitle"></div>
            
            <!-- Page Heading -->

            <div class="row">
                <div class="col-lg-3 col-sm-6 portfolio-item">
                    <div class="card h-100">
                      <a href="${path }/performance/performanceView.do?no=1" style='text-decoration:none;'><img class="card-img-top" src="${path}/resources/img/bg-img/breadcumb.jpg" alt="" style='height : 310px;'></a>
                      <div class="card-body">
                        <h4 class="card-title">
                            <strong>
                                <a href="#">위대한쇼맨</a>
                            </strong>

                        </h4>
                        <p class="card-text" style='font-size:12px;'> 
                            18.08.29~18.10.01 <br>
                            <strong style='font-size:15px;'>충무아트센터 대극장</strong>
                        </p>
                      </div>
                    </div>
                  </div>
                    
			
              <div class="col-lg-3 col-sm-6 portfolio-item">
                <div class="card h-100">
                  <a href="#"><img class="card-img-top" src="${path}/resources/img/bg-img/breadcumb.jpg" alt="" style='height : 310px;'></a>
                  <div class="card-body">
                    <h4 class="card-title">
                        <strong>
                            <a href="#">위대한쇼맨</a>
                        </strong>
                    </h4>
                    
                    <p class="card-text">18.08.29~18.10.01</p>
                  </div>
                </div>
              </div>
	
              

              <div class="col-lg-3 col-sm-6 portfolio-item">
                <div class="card h-100">
                  <a href="#"><img class="card-img-top" src="${path}/resources/img/bg-img/breadcumb.jpg" alt="" style='height : 310px;'></a>
                  <div class="card-body">
                    <h4 class="card-title">
                        <strong>
                                <a href="#">위대한쇼맨</a>
                        </strong>

                    </h4>

                    <p class="card-text">18.08.29~18.10.01</p>
                  </div>
                </div>
              </div>

              <div class="col-lg-3 col-sm-6 portfolio-item">
                <div class="card h-100">
                  <a href="#"><img class="card-img-top" src="${path}/resources/img/bg-img/breadcumb.jpg" alt="" style='height : 310px;'></a>
                  <div class="card-body">
                    <h4 class="card-title">
                        <strong>
                                <a href="#">위대한쇼맨</a>
                        </strong>
                    </h4>
                    
                    <p class="card-text">18.08.29~18.10.01</p>
                  </div>
                </div>
              </div>

              


            </div>
        </div>

        <div class="container">

            <br><br> 
            <h2 style="text-align: center">추천공연</h2>
            <div class="ticketTodayTitle"></div>
			
			
			<c:forEach items="${list }" var="p">
			
              <div class="col-lg-3 col-sm-6 portfolio-item">
                <div class="card h-100">
                  <a href="#"><img class="card-img-top" src="${path}/resources/img/bg-img/breadcumb.jpg" alt="" style='height : 310px;'></a>
                  <div class="card-body">
                    <h4 class="card-title">
                        <strong>
                                <a href="#">위대한쇼맨</a>
                        </strong>
                    </h4>
                    
                        <p class="card-text" style='font-size:12px;'> 
                            18.08.29~18.10.01 <br>
                            <strong style='font-size:15px;'>${p.PLACENAME }</strong>
                  </div>
                </div>
              </div>
              </c:forEach>



            </div>
       </section>

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>

