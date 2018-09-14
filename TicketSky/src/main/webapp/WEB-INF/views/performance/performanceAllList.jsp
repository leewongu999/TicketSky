<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<c:set var="path" value="<%=request.getContextPath()%>"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>

	

<script>
	
	function fn_performSelect(a)
	{
		
		location.href = '${path}/performance/performanceSelectList.do?category=${category}&subCategory='+a;
	}
	function fn_performAll()
	{
		location.href='${path}/performance/performanceAllList.do?category=${category}';
	}
	
</script>
	<!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <section class="new_arrivals_area section-padding-80 clearfix">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading text-center">
                        <br>
                        <h2>${category } </h2>
                        <br>
                        <div class="btn-group" role="group" aria-label="...">
                         	<button type="button" class="btn btn-default" onclick="fn_performAll()" >전체</button>
                         	<c:forEach items="${categoryList}" var="c">
                            	<button type="button" class="btn btn-default" onclick="fn_performSelect('${c.MINOR}')" >${c.MINOR }</button>
                            </c:forEach>
                        </div>
                        <br>
                        <br><br>
                        <!-- <img src="${path}/resources/img/musical.jpg" align='center'/> -->
                        <div id="demo" class="carousel slide" data-ride="carousel">

	                        <!-- Indicators -->
	                        <ul class="carousel-indicators">
	                          <li data-target="#demo" data-slide-to="0" class="active"></li>
	                          <li data-target="#demo" data-slide-to="1"></li>
	                          <li data-target="#demo" data-slide-to="2"></li>
	                        </ul>
	                      
	                        <!-- The slideshow -->
	                        <div class="carousel-inner">
	                          <div class="carousel-item active">
	                            <img src="${path}/resources/img/product-img/show1.jpg" alt="Los Angeles">
	                          </div>
	                          <div class="carousel-item">
	                            <img src="${path}/resources/img/product-img/show2.jpg" alt="Chicago">
	                          </div>
	                          <div class="carousel-item">
	                            <img src="${path}/resources/img/product-img/show3.jpg" alt="New York">
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
            <h2>추천공연</h2>
            <br>
            <!-- Page Heading -->
            <div class="row">
            <c:forEach items="${allList}" var="l">
            	 <div class="col-lg-3 col-sm-6 portfolio-item">
                    <div class="card h-100">
                    
                      	<a href="${path }/performance/performanceView.do?no=${l.PERFORMNO}" style='text-decoration:none;'><img class="card-img-top" src="${path}/resources/img/product-img/${l.ORICONTENTIMG}" alt="" style='height : 310px;'></a>
                    
                    
                      <div class="card-body">
                        <h4 class="card-title">
                            <strong>
                                <a href="${path }/performance/performanceView.do?no=${l.PERFORMNO}">${l.PERFORMNAME }</a>
                            </strong>
                        </h4>
                        <p class="card-text" style='font-size:12px;'> 
                        <fmt:formatDate value="${l.STARTDATE }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${l.ENDDATE }" pattern="yyyy-MM-dd"/>
                        <br>
                            <strong style='font-size:15px;'>${l.PLACENAME }</strong>
                        </p>
                      </div>
                    </div>
                  </div>
            </c:forEach>
            </div>
        </div>
        <div class="container">
            <br><br>
            <h2>전체</h2>
            <br>
            <!-- Page Heading -->
            <div class="row">
                <c:forEach items="${allList}" var="l">
            	 <div class="col-lg-3 col-sm-6 portfolio-item">
                    <div class="card h-100">
                      <a href="${path }/performance/performanceView.do?no=${l.PERFORMNO}" style='text-decoration:none;'><img class="card-img-top" src="${path}/resources/img/product-img/${l.ORICONTENTIMG}" alt="" style='height : 310px;'></a>
                      <div class="card-body">
                        <h4 class="card-title">
                            <strong>
                                <a href="${path }/performance/performanceView.do?no=${l.PERFORMNO}">${l.PERFORMNAME }</a>
                            </strong>
                        </h4>
                        <p class="card-text" style='font-size:12px;'> 
                            <fmt:formatDate value="${l.STARTDATE }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${l.ENDDATE }" pattern="yyyy-MM-dd"/><br>
                            <strong style='font-size:15px;'>${l.PLACENAME }</strong>
                        </p>
                      </div>
                    </div>
                  </div>
            </c:forEach>
            </div>
        </div>
             
         <!-- Pagination -->
         <br><br>
         <!-- <div id='pageBar1' align="center">
        	<ul class="pagination">
			    <li>
			      <a href="#" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <li><a href="#">1</a></li>
			    <li><a href="#">2</a></li>
			    <li><a href="#">3</a></li>
			    <li><a href="#">4</a></li>
			    <li><a href="#">5</a></li>
			    <li>
			      <a href="#" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
        	</div> -->
       </section>
<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>