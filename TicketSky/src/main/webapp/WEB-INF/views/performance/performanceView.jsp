<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<c:set var="path" value="<%=request.getContextPath()%>"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>

<style>
	#sebuimg{
		margin : auto;
		width: 300px;
		height: 380px;
	}
		
</style>
	<link rel="stylesheet" type="text/css" href="${path}/resources/sebu/styles/bootstrap4/bootstrap.min.css">
	<link href="${path}/resources/sebu/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/sebu/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/sebu/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/sebu/plugins/OwlCarousel2-2.2.1/animate.css">
	<link rel="stylesheet" href="${path}/resources/sebu/plugins/themify-icons/themify-icons.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/sebu/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/sebu/styles/single_styles.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/sebu/styles/single_responsive.css">

	<div class="fs_menu_overlay"></div>

	<!-- Hamburger Menu -->

	<div class="hamburger_menu">
		<div class="hamburger_close"><i class="fa fa-times" aria-hidden="true"></i></div>
		<div class="hamburger_menu_content text-right">
			<ul class="menu_top_nav">
				<li class="menu_item has-children">
					<a href="#">
						usd
						<i class="fa fa-angle-down"></i>
					</a>
					<ul class="menu_selection">
						<li><a href="#">cad</a></li>
						<li><a href="#">aud</a></li>
						<li><a href="#">eur</a></li>
						<li><a href="#">gbp</a></li>
					</ul>
				</li>
				<li class="menu_item has-children">
					<a href="#">
						English
						<i class="fa fa-angle-down"></i>
					</a>
					<ul class="menu_selection">
						<li><a href="#">French</a></li>
						<li><a href="#">Italian</a></li>
						<li><a href="#">German</a></li>
						<li><a href="#">Spanish</a></li>
					</ul>
				</li>
				<li class="menu_item has-children">
					<a href="#">
						My Account
						<i class="fa fa-angle-down"></i>
					</a>
					<ul class="menu_selection">
						<li><a href="#"><i class="fa fa-sign-in" aria-hidden="true"></i>Sign In</a></li>
						<li><a href="#"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a></li>
					</ul>
				</li>
				<li class="menu_item"><a href="#">home</a></li>
				<li class="menu_item"><a href="#">shop</a></li>
				<li class="menu_item"><a href="#">promotion</a></li>
				<li class="menu_item"><a href="#">pages</a></li>
				<li class="menu_item"><a href="#">blog</a></li>
				<li class="menu_item"><a href="#">contact</a></li>
			</ul>
		</div>
	</div>

	<div class="container single_product_container">
		<div class="row">
			<div class="col">

				<!-- Breadcrumbs -->

				<div class="breadcrumbs d-flex flex-row align-items-center">
					<ul>
						<li><a href="index.html">Ticketsky</a></li>
						<li><a href="categories.html"><i class="fa fa-angle-right" aria-hidden="true"></i>뮤지컬</a></li>
						<li class="active"><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>위대한쇼맨</a></li>
					</ul>
				</div>

			</div>
		</div>

		<div class="row" >
			
			<div class="col-lg-6">
				<div class="single_product_pics">
					<div class="row" >
						<img id='sebuimg' src="${path}/resources/img/product-img/barnum1.jpg" alt=""  />
					</div>
				</div>
			</div>
			<div class="col-lg-5">
				<div class="product_details">
					<div class="product_details_title">
						
						<h2>위대한 쇼맨</h2>
						<p><strong>장소</strong>&nbsp;&nbsp;&nbsp;&nbsp;충무아트센터 대극장</p>
						<p><strong>기간</strong>&nbsp;&nbsp;&nbsp;&nbsp;2018.09.20~2018.10.10</p>
						<p><strong>관람시간</strong>&nbsp;&nbsp;&nbsp;&nbsp;160분</p>
						<p><strong>관람등급</strong>&nbsp;&nbsp;&nbsp;&nbsp;만 7세이상</p>
					</div>
					<div class="free_delivery d-flex flex-row align-items-center justify-content-center">
						<!-- <span class="ti-truck"></span> -->
						<span>가격</span>
					</div>
					<div class="product_price">
							<p><strong>VIP석</strong>&nbsp;&nbsp;&nbsp;&nbsp;$495.00</p>
							<p><strong>S석</strong>&nbsp;&nbsp;&nbsp;&nbsp;$495.00</p>
							<p><strong>R석</strong>&nbsp;&nbsp;&nbsp;&nbsp;$495.00</p>
						
					</div>
					<ul class="star_rating">
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
						<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
					</ul>
					
					<div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
						
						
						<div class="red_button add_to_cart_button" ><a href="#">구매하기</a></div>
						<div class="product_favorite d-flex flex-column align-items-center justify-content-center"></div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Tabs -->

	<div class="tabs_section_container">

		<div class="container">
			<div class="row" >
				<div class="col">
					<div class="tabs_container">
						<ul class="tabs d-flex flex-sm-row flex-column align-items-left align-items-md-center justify-content-center">
							<li class="tab active" data-active-tab="tab_1"><span>상세정보</span></li>
							<li class="tab" data-active-tab="tab_2"><span>공연장정보</span></li>
							<li class="tab" data-active-tab="tab_3"><span>관람후기</span></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row" >
				<div class="col" >

					<!-- Tab Description -->

					<div id="tab_1" class="tab_container active"  >
						<div class="row w-100" >
							<div class="col-lg-5 desc_col" style='margin-left:13%;'>
								<div class="tab_title" style='margin-bottom:15px;'>
									<h4>Description</h4>
								</div>
								<div class="tab_text_block" style='margin-bottom:10px;'>
									<p>[공연정보]</p>
									<p>
									2018년 09월 13일(목) ~ 2018년 11월 18일(일) 
									화,목,금 20시 / 수 16시, 20시 / 토 15시, 19시 / 일, 공휴일 14시, 18시	
									* 월 공연 없음</p>
									<br>
								</div>
							</div>
							<div class="col-lg-9 " style='margin:0 auto;'>
								<div class="tab_image">
									<img src="${path}/resources/img/product-img/very.jpg" alt="" style='width:100%; height: 100%;'>
									<img src="${path}/resources/img/product-img/very.jpg" alt="" style='width:100%; height: 100%;'>
									<img src="${path}/resources/img/product-img/very.jpg" alt="" style='width:100%; height: 100%;'>

								</div>
							</div>
						</div>
					</div>

					<!-- Tab Additional Info -->

					<div id="tab_2" class="tab_container">
						<div class="row w-100"  >
							<div class="col-lg-5 desc_col" style='margin-left:13%;'>
								<div class="tab_title" style='margin-bottom:15px;'>
									<h4>Information</h4>
								</div>
								<div class="tab_text_block" style='margin-bottom:10px;'>
									<p>[공연장 정보]</p>
									<p>장소 : 충무아트센터 대극장</p>
									<p>주소 : 서울특별시 중구 동대문역사문화공원역 옆</p>
									<p>대표번호 : 02-2056-5787</p>
								</div>
								<br>
								
							</div>
							<div id="map" style="width:100%;height:350px; margin-left:13%;margin-right:13%;"></div>
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
								geocoder.addressSearch('서울 성동구 하왕십리동 966-30', function(result, status) {
								
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
								            content: '<div style="width:150px;text-align:center;padding:6px 0;">공연장</div>'
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

					<div id="tab_3" class="tab_container" >
						<div class="row w-100" style='margin:0 auto;'>

							<!-- User Reviews -->

							<div class="col-lg-6 reviews_col">
								<div class="tab_title reviews_title" style='margin-left:5%;' >
									<h4>Reviews (2)</h4>
								</div>

								<!-- User Review -->

								<div class="user_review_container d-flex flex-column flex-sm-row">
									<div class="review">
										<div class="review_date">27 Aug 2016</div>
										<div class="user_name">
											Brandon William
											<span>
												<ul class="star_rating">
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
												</ul>
											</span>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
									</div>
								</div>
								<div class="user_review_container d-flex flex-column flex-sm-row">
									<div class="review">
										<div class="review_date">27 Aug 2016</div>
										<div class="user_name">
											Brandon William
											<span>
												<ul class="star_rating">
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
													<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
												</ul>
											</span>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
									</div>
								</div>
								<!-- User Review -->

								<div class="user_review_container d-flex flex-column flex-sm-row">
										<div class="review">
											<div class="review_date">27 Aug 2016</div>
											<div class="user_name">
												Brandon William
												<span>
													<ul class="star_rating">
														<li><i class="fa fa-star" aria-hidden="true"></i></li>
														<li><i class="fa fa-star" aria-hidden="true"></i></li>
														<li><i class="fa fa-star" aria-hidden="true"></i></li>
														<li><i class="fa fa-star" aria-hidden="true"></i></li>
														<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
													</ul>
												</span>
											</div>
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
										</div>
									</div>
							</div>

							<!-- Add Review -->

							<div class="col-lg-5 add_review_col">

								<div class="add_review">
									<form id="review_form" action="post">
										<div>
											<h1>Add Review</h1>
											<input id="review_name" class="form_input input_name" type="text" name="name" value='이원구' data-error="Name is required." readonl>
											
										</div>
										<div>
<!-- <script>

	function ff()
	{
		var value=$('.aa').attr("name");
		$('#difo').val(value);
		
	}
</script> -->
											<h1>Your Rating:</h1>
											<ul class="user_star_rating">
												<li><i class="fa fa-star" aria-hidden="true" ></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star" aria-hidden="true" name='4' onclick = 'ff()'></i></li>
												<li><i class="fa fa-star" aria-hidden="true"></i></li>
												<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
											</ul>
											<textarea id="review_message" class="input_review" name="message"  placeholder="Your Review" rows="4" required data-error="Please, leave us a review."></textarea>
										</div>
										<div class="text-left text-sm-right">
											<button id="review_submit" type="submit" class="red_button review_submit_btn trans_300" value="Submit">submit</button>
										</div>
									</form>
								</div>

							</div>

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
	<script src="${path}/resources/sebu/js/jquery-3.2.1.min.js"></script>
	<script src="${path}/resources/sebu/styles/bootstrap4/popper.js"></script>
	<script src="${path}/resources/sebu/styles/bootstrap4/bootstrap.min.js"></script>
	<script src="${path}/resources/sebu/plugins/Isotope/isotope.pkgd.min.js"></script>
	<script src="${path}/resources/sebu/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
	<script src="${path}/resources/sebu/plugins/easing/easing.js"></script>
	<script src="${path}/resources/sebu/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
	<script src="${path}/resources/sebu/js/single_custom.js"></script>


<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>