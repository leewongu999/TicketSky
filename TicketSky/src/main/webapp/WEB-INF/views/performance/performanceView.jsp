<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<c:set var="path" value="<%=request.getContextPath()%>"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>

	
	<script src="${path}/resources/sebu/js/jquery-3.2.1.min.js"></script>
	<script src="${path}/resources/sebu/styles/bootstrap4/popper.js"></script>
	<script src="${path}/resources/sebu/styles/bootstrap4/bootstrap.min.js"></script>
	<script src="${path}/resources/sebu/plugins/Isotope/isotope.pkgd.min.js"></script>
	<script src="${path}/resources/sebu/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
	<script src="${path}/resources/sebu/plugins/easing/easing.js"></script>
	<script src="${path}/resources/sebu/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
	<script src="${path}/resources/sebu/js/single_custom.js"></script>
	
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/sebu/styles/bootstrap4/bootstrap.min.css">
	<link href="${path}/resources/sebu/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/sebu/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/sebu/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/sebu/plugins/OwlCarousel2-2.2.1/animate.css">
	<link rel="stylesheet" href="${path}/resources/sebu/plugins/themify-icons/themify-icons.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/sebu/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/sebu/styles/single_styles.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/sebu/styles/single_responsive.css">
	<style>
		#sebuimg{
			margin : auto;
			width: 300px;
			height: 380px;
		}
		
	</style>
	<script>
		$(function(){
			$('#star_score').children().on('click',function(){
				var starScore = $(this).children().attr('name');
				console.log($(this).children());
				$('#starScore').val(starScore);
				
			});
		});
		function fn_review_validate()
		{
			var review=$("#review_message");
			if(review.val().trim().length>=10)
			{
				return true;
			}
			else
			{
				alert("리뷰는 10글자 이상");
				review.val("");
				review.focus();
				return false;
			}
		} 
	</script>
	<div class="container single_product_container">
		<div class="row">
			<div class="col">

				<!-- Breadcrumbs -->

				<div class="breadcrumbs d-flex flex-row align-items-center">
					<ul>
						<li><a href="${path }/">Ticketsky</a></li>
						<li><a href="${path }/performance/performanceAllList.do?category=${MAJORCATEGORY}"><i class="fa fa-angle-right" aria-hidden="true"></i>${MAJORCATEGORY }</a></li>
						<li class="active"><a href=""><i class="fa fa-angle-right" aria-hidden="true"></i>${PERFORMNAME }</a></li>
					</ul>
				</div>

			</div>
		</div>

		<div class="row" >
			
			<div class="col-lg-5" style='margin:auto;'>
				<div class="single_product_pics">
					<div class="row" >
						<img id='sebuimg' src="${path}/resources/img/product-img/${ORICONTENTIMG}" alt=""  />
					</div>
				</div>
			</div>
			<div class="col-lg-5" style='margin-right:2.3%;'>
				<div class="product_details">
					<div class="product_details_title">
						<span>
							<ul class="star_rating" style='margin-left:5px;'>
								<li><i class="fa fa-star" aria-hidden="true"></i></li>
								<li><i class="fa fa-star" aria-hidden="true"></i></li>
								<li><i class="fa fa-star" aria-hidden="true"></i></li>
								<li><i class="fa fa-star" aria-hidden="true"></i></li>
								<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
							</ul>
						</span>
						<h3>
							${PERFORMNAME }
						</h3>
						<p><strong>장소</strong>&nbsp;&nbsp;&nbsp;&nbsp;${PLACENAME }</p>
						<p><strong>기간</strong>&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${ENDDATE }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${ENDDATE }" pattern="yyyy-MM-dd"/></p>
						<p><strong>관람시간</strong>&nbsp;&nbsp;&nbsp;&nbsp;${PERFORMTIME }</p>
						<p><strong>관람등급</strong>&nbsp;&nbsp;&nbsp;&nbsp;${PERFORMGRADE }</p>
					</div>
					<div class="free_delivery d-flex flex-row align-items-center justify-content-center" style='margin-right:15%; margin-bottom:15px;'>
						<!-- <span class="ti-truck"></span> -->
						<span>
							가격
						</span>
					</div>
					<div class="product_price">
							<p><strong>VIP석</strong>&nbsp;&nbsp;&nbsp;&nbsp;$495.00</p>
							<p><strong>S석</strong>&nbsp;&nbsp;&nbsp;&nbsp;$495.00</p>
							<p><strong>R석</strong>&nbsp;&nbsp;&nbsp;&nbsp;$495.00</p>

					</div>
					<div class="quantity d-flex flex-column flex-sm-row align-items-sm-center" style='margin-top:10px;'>
						<div class="red_button add_to_cart_button" style='margin-left:0'><a href="#">구매하기</a></div>
						<div class="product_favorite d-flex flex-column align-items-center justify-content-center"></div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Tabs -->

	<div class="tabs_section_container">

		<div class="container">
			<div class="row" style='margin:0 auto;'>
				<div class="col">
					<div class="tabs_container">
						<ul class="tabs d-flex flex-sm-row flex-column align-items-left align-items-md-center justify-content-center">
							<li class="tab active" data-active-tab="tab_1"><span>상세정보</span></li>
							<li class="tab" data-active-tab="tab_2"><span>공연장정보</span></li>
							<li class="tab" data-active-tab="tab_3"><span>관람후기</span></li>
							<li class="tab" data-active-tab="tab_4"><span>Q&A</span></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row" >
				<div class="col" >

					<!-- Tab Description -->

					<div id="tab_1" class="tab_container active" style='margin:0 auto;'>
						<div class="row w-100" >
							<div class="col-lg-5 desc_col" style='margin-left:15%;'>
								<div class="tab_title" style='margin-bottom:14px;'>
									<h4>Description</h4>
								</div>
								<div class="tab_text_block" style='margin-bottom:10px;'>
									<p>[공연정보]</p>
									<p>
										2018년 09월 13일(목) ~ 2018년 11월 18일(일) 
										화,목,금 20시 / 수 16시, 20시 / 토 15시, 19시 / 일, 공휴일 14시, 18시	
										* 월 공연 없음
									</p>
									<br>
								</div>
							</div>
							<div class="col-lg-9 " style='margin:0 auto;'>
								<div class="tab_image" style="margin-left:3%;">
									<img src="${path}/resources/img/product-img/very.jpg" alt="" style='width:100%; height: 100%;'>
									<img src="${path}/resources/img/product-img/very.jpg" alt="" style='width:100%; height: 100%;'>
									<img src="${path}/resources/img/product-img/very.jpg" alt="" style='width:100%; height: 100%;'>

								</div>
							</div>
						</div>
					</div>

					<!-- Tab Additional Info -->

					<div id="tab_2" class="tab_container">
						<div class="row w-100">
							<div class="col-lg-5 desc_col" style='margin-left:15%;'>
								<div class="tab_title" style='margin-bottom:14px;'>
									<h4>Information</h4>
								</div>
								<div class="tab_text_block" style='margin-bottom:10px;'>
									<p>[공연장 정보]</p>
									<p>장소 : ${PLACENAME }</p>
									<p>주소 : ${PLACEADDRESS }</p>
									<p>대표번호 : ${COMPANYPHONENUM}</p>
								</div>
								<br>
								
							</div>
							<div id="map" style="width:100%;height:350px; margin-left:16.5%; margin-right:11%"></div>
								<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ce19947ed179f0c460473a072a402ed&libraries=services"></script>
								<script>
								var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
								    mapOption = {
								        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
								        level: 3 // 지도의 확대 레벨
								    };
								
								// 지도를 생성합니다
								
								var map = new daum.maps.Map(mapContainer, mapOption); 
								
								// 주소-좌표 변환 객체를 생성합니다
								var geocoder = new daum.maps.services.Geocoder();
								
								// 주소로 좌표를 검색합니다
								
								geocoder.addressSearch('${PLACEADDRESS}', function(result, status) {
								
								    // 정상적으로 검색이 완료됐으면 
								    
								     if (status === daum.maps.services.Status.OK) {
								
								        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
								
								        // 결과값으로 받은 위치를 마커로 표시합니다
								        
								        var marker = new daum.maps.Marker({
								            map: map,
								            position: coords
								        });
								
								        // 인포윈도우로 장소에 대한 설명을 표시합니다
								        
								        var infowindow = new daum.maps.InfoWindow({
								            content: '<div style="width:150px;text-align:center;padding:1px 0;">공연장</div>'
								        });
								        infowindow.open(map, marker);
								
								        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								        
								        map.setCenter(coords);
								    } 
								});    
								</script> 
							</div>
						</div>						
					</div>
					

					<!-- Tab Reviews -->
					<script>
						var performNo = ${no};
						function fn_paging(cPage,numPerPage){
							$.ajax({
								url : "${path}/performance/performReviewPaging.do",
								data : {no : performNo,
									cPage : cPage}										
								,
								dataType : "html",
								success : function(data)
								{
									
									var reviewForm = $("#reviewList");
									reviewForm.html(data);
								}
							});
						};
						function fn_review_delete(a,b)
						{
							var bool = confirm("정말로 삭제하시겠습니까??");
							if(bool)
							{
								location.href='${path}/performance/performReviewDelete.do?no='+a+'&reviewNo='+b;
							}
							else
							{
								return;		
							}
						}
						function fn_review_update(no,pNo)
						{
							var re = {reviewNo : no,
									performNo : pNo};
							 $.ajax({
								url : "${path}/performance/performReviewUpdate.do",
								data : re,
								dataType : "html",
								success : function(data)
								{
									$('#review_'+no).html(data);
									$('#review_cancel').on("click",function(){
										
										var up_reviewNo = $('#up_reviewNo').val();
										var canRe = {reviewNo : up_reviewNo};
										$.ajax({
											url : "${path}/performance/performReviewUpdateCancel.do",
											data : canRe,
											dataType : "html",
											success : function(data)
											{
												$('#review_'+no).html(data);
												
											}
										});
									});
									
									$('#review_update_submit').on("click",function(){
										
										var upBool = confirm("수정 하시겠습니까?");
										if(upBool)
										{  
											var review=$("#reviewUp_message");
											var bool=false;
											if(review.val().trim().length>=10)
											{															
												bool=true;
											}
											else
											{
												alert("리뷰는 10글자 이상");
												review.val("");
												review.focus();
												bool=false;
											}
											if(bool)
											{
												var upRe = {reviewNo : $('#up_reviewNo').val(),
														reviewUp_message : $('#reviewUp_message').val(),
														starUpdateScore : $('#starUpdateScore').val()
														};
												$.ajax({
													url : "${path}/performance/performReviewUpdateEnd.do",
													data : upRe,
													dataType : "html",
													success : function(data)
													{
														$('#review_'+no).html(data);
													}
												});
											}
											else{return}
										}else{return}
									});
								}
							});
						}
					</script>
					<div id="tab_3" class="tab_container" style='margin-left: 10%; margin-right: 10%;' >
						<div class="col w-100" >
							<!-- Add Review -->
							<div class="tab_title reviews_title" style='margin-bottom:-5%;' >
								<h4>Reviews (${reviewTotalCount })</h4>
							</div>
							<div class=" add_review_col">
								
								<div class="add_review">
									<form id="review_form" action="${path }/performance/performReviewInsert.do?no=${PERFORMNO}" method="post" onsubmit="return fn_review_validate();">
										<div style='margin-top:30px;'>							
										<h1>&nbsp;&nbsp;
											ID : admin 
											<ul id='star_score' class="user_star_rating">
												<li><i class="fa fa-star" name='1' aria-hidden="true" ></i></li>
												<li><i class="fa fa-star-o" name='2' aria-hidden="true"></i></li>
												<li><i class="fa fa-star-o" name='3' aria-hidden="true"></i></li>
												<li><i class="fa fa-star-o" name='4' aria-hidden="true"></i></li>
												<li><i class="fa fa-star-o" name='5' aria-hidden="true"></i></li>
											</ul>
											
											<input type='hidden' id='starScore' name='starScore' value='1'/>
										</h1>
											<span></span>
											<textarea id="review_message" class="input_review" name="review"  placeholder="Your Review" rows="5" required data-error="Please, leave us a review."></textarea>
										</div>
										<div class="text-left text-sm-right">
											<button id="review_submit" type="submit" class="red_button review_submit_btn trans_300" value="Submit">확인</button>
										</div>
									</form>
								</div>

							</div>
							<!-- User Reviews -->

							<div id='reviewList'>
								<c:forEach items="${reviewList}" var="r" varStatus="status">
								<c:if test="${status.index==0 }">
									<hr>
								</c:if>
									<div id='review_${r.REVIEWNO }' class="user_review_container flex-column flex-sm-row">
										<div style='float:right;'>
											<button class='red_button review_submit_btn trans_30' onclick ='fn_review_update(${r.REVIEWNO},${r.PERFORMNO })' style='width:50px; height:20px; background-color:#E4E4E4'>수정</button>
											<button class='red_button review_submit_btn trans_30' onclick ='fn_review_delete(${r.PERFORMNO},${r.REVIEWNO })' style='width:50px; height:20px; background-color:#E4E4E4'>삭제</button>
										</div>
									<div>
										<div class="review_date">
											<fmt:formatDate value="${r.REVIEWDATE }" pattern="yyyy-MM-dd "/><br>
										</div>
										<div class="user_name">
											${r.USERID }
											<script>
												$(function(){
													var score=${r.PERFORMSCORE};
													switch(score)
													{
													case 1: break;
													case 2: 
														$('.re_${r.REVIEWNO}').children().eq(1).children().attr('class','fa fa-star');
														break;
													case 3: 
														$('.re_${r.REVIEWNO}').children().eq(1).children().attr('class','fa fa-star');
														$('.re_${r.REVIEWNO}').children().eq(2).children().attr('class','fa fa-star');
														break;
													case 4: 
														$('.re_${r.REVIEWNO}').children().eq(1).children().attr('class','fa fa-star');
														$('.re_${r.REVIEWNO}').children().eq(2).children().attr('class','fa fa-star');
														$('.re_${r.REVIEWNO}').children().eq(3).children().attr('class','fa fa-star');
														break;
													case 5: 
														$('.re_${r.REVIEWNO}').children().eq(1).children().attr('class','fa fa-star');
														$('.re_${r.REVIEWNO}').children().eq(2).children().attr('class','fa fa-star');
														$('.re_${r.REVIEWNO}').children().eq(3).children().attr('class','fa fa-star');
														$('.re_${r.REVIEWNO}').children().eq(4).children().attr('class','fa fa-star');
														break;
													default : break;
													}
												});
											</script>
											<span>
												<ul class="star_rating re_${r.REVIEWNO}">
													<li><i class="fa fa-star" name='1' aria-hidden="true"></i></li>
													<li><i class="fa fa-star-o" name='2' aria-hidden="true"></i></li>
													<li><i class="fa fa-star-o" name='3' aria-hidden="true"></i></li>
													<li><i class="fa fa-star-o" name='4' aria-hidden="true"></i></li>
													<li><i class="fa fa-star-o" name='5' aria-hidden="true"></i></li>
												</ul>
											</span>
										</div>
										<div>
											<p>${r.REVIEWCONTENT }</p>
										</div>
									</div>
								</div>
								<c:if test='${!status.last }'>
									<hr>
								</c:if> 
								</c:forEach>
								<div id='pageBar1' align="center">
				         			${pageBar }<br/>
				         		</div>
							</div>
						</div>
					</div>
					
					<div id="tab_4" class="tab_container" style='margin-left: 10%; margin-right: 10%;' >
						<div class="col w-100" >
							<!-- Add Review -->
							<div class="tab_title reviews_title" style='margin-bottom:-5%;' >
								<h4>Q&A (4)</h4>
							</div>
							<div class=" add_review_col">
								<div class="add_review">
									<form id="review_form1" method='post'>
										<div>
										<h1>&nbsp;&nbsp;
											<span>
												<strong>상품 문의</strong>
											</span>
										</h1>
											<span></span>
											<textarea id="review_message1" class="input_review" name="review"  placeholder="Your Review" rows="5" required data-error="Please, leave us a review."></textarea>
										</div>
										<div class="text-left text-sm-right" style='margin:10px;'>
											<button id="review_submit" type="submit" class="red_button review_submit_btn trans_300" value="Submit">확인</button>
										</div>
									</form>
								</div>
							</div>
							<!-- User Reviews -->

							<div>
								<hr>
								<div class="user_review_container d-flex flex-column flex-sm-row">
									<div style='margin:3.8% 0 0 0;'>
										<div><img src="${path}/resources/img/product-img/Q.png"  style='width:35px; height:30px;' alt=""></div>
									</div>
									<div class="review" style='margin-left:-10px;'>
										<div class="review_date">2018-09-12</div>
										<div class="user_name">
											user(<small>djsrnsla</small>)
											<div style='float:right'>
												<button class='red_button review_submit_btn trans_30' style='width:50px; height:20px; background-color:#E4E4E4'>답글</button>
												<button class='red_button review_submit_btn trans_30' style='width:50px; height:20px; background-color:#E4E4E4'>수정</button>
												<button class='red_button review_submit_btn trans_30' style='width:50px; height:20px; background-color:#E4E4E4'>삭제</button>
											</div>
										</div>
										<p style='width:800px;'>안녕하세요안녕하세요
										</p>
										<br>
										<div>
										<div class="user_review_container d-flex flex-column flex-sm-row" style='margin-bottom:-20px;'>
											<div style='margin:3.8% 0 0 0;'>
												<div><img src="${path}/resources/img/product-img/A.png"  style='width:35px; height:30px;' alt=""></div>
											</div>
											<!-- <div style='float:right;'>
												<button class='red_button review_submit_btn trans_30' style='width:50px; height:20px; background-color:#E4E4E4'>수정</button>
												<button class='red_button review_submit_btn trans_30' style='width:50px; height:20px; background-color:#E4E4E4'>삭제</button>
											</div> -->
												<div class="review" style='margin-left:-10px;'>
													<div class="review_date">2018-09-12</div>
													<div class="user_name">
														admin
														<div style='float:right; margin-left:500px;'>
															<button class='red_button review_submit_btn trans_30' style='width:50px; height:20px; background-color:#E4E4E4'>수정</button>
															<button class='red_button review_submit_btn trans_30' style='width:50px; height:20px; background-color:#E4E4E4'>삭제</button>
														</div>
													</div>
													<p style='width:720px;'>안녕하세요안녕하세요
													</p>
													<p>맘스터치 먹고싶다.</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<hr>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	<!-- Benefit -->

	<div class="benefit">
		<div class="container">
			<div class="row benefit_row">
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-truck" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>free shipping</h6>
							<p>Suffered Alteration in Some Form</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-money" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>cach on delivery</h6>
							<p>The Internet Tend To Repeat</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-undo" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>45 days return</h6>
							<p>Making it Look Like Readable</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-clock-o" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>opening all week</h6>
							<p>8AM - 09PM</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Newsletter -->

	<div class="newsletter">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="newsletter_text d-flex flex-column justify-content-center align-items-lg-start align-items-md-center text-center">
						<h4>Newsletter</h4>
						<p>Subscribe to our newsletter and get 20% off your first purchase</p>
					</div>
				</div>
				<div class="col-lg-6">
					<form action="post">
						<div class="newsletter_form d-flex flex-md-row flex-column flex-xs-column align-items-center justify-content-lg-end justify-content-center">
							<input id="newsletter_email" type="email" placeholder="Your email" required="required" data-error="Valid email is required.">
							<button id="newsletter_submit" type="submit" class="newsletter_submit_btn trans_300" value="Submit">subscribe</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>