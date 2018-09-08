<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<c:set var="path" value="<%=request.getContextPath()%>"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>
	
	<!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <section class="new_arrivals_area section-padding-80 clearfix">
        
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading text-center">
                        <br>
                        <h2> 뮤지컬 </h2>
                        <br>
                        <div class="btn-group" role="group" aria-label="...">
                         	<button type="button" class="btn btn-default" onclick="fn_performAll()" >전체</button>
                         	<c:forEach items="${categoryList}" var="c">
                            	<button type="button" class="btn btn-default" onclick="fn_performSelect('${c.MINOR}')" >${c.MINOR }</button>
                            </c:forEach>
                        </div>
                        <br>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
                <p class="location_path" id="d2_path">
                    <a>티켓스카이 홈</a> &#62;
                    <a>공연</a> &#62;
                    <a>${category }</a> &#62;
                    <a class="lastCategoryName">${subCategory }</a>
                </p>
            <br>
            <!-- Page Heading -->
            <div class="row">
              
              <c:forEach items="${selectList}" var="s">
                <div class="col-lg-3 col-sm-6 portfolio-item">
                    <div class="card h-100">
                      <a href="${path }/performance/performanceView.do?no=${s.PERFORMNO}" style='text-decoration:none;'><img class="card-img-top" src="${path}/resources/img/product-img/${s.ORICONTENTIMG}" alt="" style='height : 310px;'></a>
                      <div class="card-body">
                        <h4 class="card-title">
                            <strong>
                                <a href="${path }/performance/performanceView.do?no=${s.PERFORMNO}">${s.PERFORMNAME }</a>
                            </strong>
                        </h4>
                        <p class="card-text" style='font-size:12px;'> 
                            ${s.STARTDATE }~${s.ENDDATE } <br>
                            <strong style='font-size:15px;'>${s.PLACENAME }</strong>
                        </p>
                      </div>
                    </div>
                  </div>
                 </c:forEach>
            </div>            
        </div>
        
        <!-- Pagination -->
        <br><br>
        <div id='pageBar1' align="center">
       <ul class="pagination justify-content-center ">
           <li class="page-item">
             <a class="page-link" href="#" aria-label="Previous">
               <span aria-hidden="true">&laquo;</span>
               <span class="sr-only">Previous</span>
             </a>
           </li>
           <li class="page-item">
             <a class="page-link" href="#">1</a>
           </li>
           <li class="page-item">
             <a class="page-link" href="#">2</a>
           </li>
           <li class="page-item">
             <a class="page-link" href="#">3</a>
           </li>
           <li class="page-item">
               <a class="page-link" href="#">4</a>
           </li>
           <li class="page-item">
               <a class="page-link" href="#">5</a>
           </li>
           <li class="page-item">
             <a class="page-link" href="#" aria-label="Next">
               <span aria-hidden="true">&raquo;</span>
               <span class="sr-only">Next</span>
             </a>
           </li>
         </ul>
       </div>
    </section>


<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>