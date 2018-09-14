<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set value="${pageContext.request.contextPath}" var="path"/>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>TICKET SKY - Fashion Ecommerce Template</title>

    <!-- Favicon  -->
    <link rel="icon" href="${path }/resources/img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="${path }/resources/css/core-style.css"/>
    <link rel="stylesheet" href="${path }/resources/style.css"/>
<%-- 	<link rel="stylesheet" href="${path }/resources/classy-nav.min.css"/>
 --%>	
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	
</head>

<body>
    <!-- ##### Header Area Start ##### -->
    <header class="header_area">
        <div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
            <!-- Classy Menu -->
            <nav class="classy-navbar" id="essenceNav">
                <!-- Logo -->
                <a class="nav-brand" href="${path }/"><img src="${path }/resources/img/core-img/KakaoTalk_20180823_202728608.png" alt=""></a>
                <!-- Navbar Toggler -->
                <div class="classy-navbar-toggler">
                    <span class="navbarToggler"><span></span><span></span><span></span></span>
                </div>

                <!-- Menu -->
                <div class="classy-menu">
                    <!-- close btn -->
                    <div class="classycloseIcon">
                        <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                    </div>
                    <!-- Nav Start -->
                    <div class="classynav">
                        <ul>
                            <li><a href="${path }/performance/performanceAllList.do?category=뮤지컬"> 뮤지컬 </a>
                                <ul class="dropdown">
                                    <li><a href="${path }/performance/performanceAllList.do?category=뮤지컬"> 전체 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=뮤지컬&subCategory=오리지날/내한공연"> 오리지날/내한공연 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=뮤지컬&subCategory=라이선스"> 라이선스 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=뮤지컬&subCategory=창작뮤지컬"> 창작뮤지컬 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=뮤지컬&subCategory=넌버별퍼포먼스"> 넌버별퍼포먼스 </a></li>
                                </ul>
                            </li>
                            <li><a href="${path }/performance/performanceAllList.do?category=연극"> 연극 </a>
                                <ul class="dropdown">
                                    <li><a href="${path }/performance/performanceAllList.do?category=연극"> 전체 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=연극&subCategory=로맨틱">로맨틱 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=연극&subCategory=코미디"> 코미디 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=연극&subCategory=드라마"> 드라마 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=연극&subCategory=스릴러"> 스릴러 </a></li>
                                </ul>
                            </li>
                            <li><a href="${path }/performance/performanceAllList.do?category=콘서트"> 콘서트 </a>
                                <ul class="dropdown">
                                    <li><a href="${path }/performance/performanceAllList.do?category=콘서트"> 전체 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=콘서트&subCategory=발라드"> 발라드 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=콘서트&subCategory=락/메탈"> 락/메탈 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=콘서트&subCategory=랩/힙합"> 랩/힙합 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=콘서트&subCategory=내한공연"> 내한공연 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=콘서트&subCategory=페스티벌"> 페스티벌 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=콘서트&subCategory=기타"> 기타 </a></li>                                    
                                </ul>
                            </li>
                            <li><a href="${path }/performance/performanceAllList.do?category=클래식/무용"> 클래식/무용 </a>
                                <ul class="dropdown">
                                    <li><a href="${path }/performance/performanceAllList.do?category=클래식/무용"> 전체 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=클래식/무용&subCategory=클래식"> 클래식 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=클래식/무용&subCategory=오페라"> 오페라 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=클래식/무용&subCategory=발레/무용"> 발레/무용 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=클래식/무용&subCategory=국악"> 국악 </a></li>
                                </ul>
                            </li>

                            <li><a href="contact.html" >커뮤니티 </span></a></li>
                        </ul>
                    </div>
                    <!-- Nav End -->
                </div>
            </nav>

            <!-- Header Meta Data -->
            <div class="header-meta d-flex clearfix justify-content-end">
                <!-- Search Area -->
                <div class="search-area">
                    <form action="#" method="post">
                        <input type="search" name="search" id="headerSearch" placeholder="검색">
                        <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                    </form>
                </div>
                <link href="http://cdn.jsdelivr.net/xeicon/1.0.4/xeicon.min.css" rel="stylesheet">
                <!-- User Login Info -->
                <div class="user-login-info">
                <c:if test="${memberLoggedIn eq null }">
                    <a href="#" onclick="window.open('${path}/user/login', '_blank', 'width=400 height=350');">로그인</a>
				</c:if>
				<c:if test="${memberLoggedIn ne null }">
                    <a href="${path }/user/userlogout.do" onclick="snslogout();">로그아웃</a>
				</c:if>
                </div>
                <!-- User Login Info -->
                <div class="user-login-info">
                <c:if test="${memberLoggedIn.separator eq 'C' }">
                    <a href="${path }/user/consumerMyPage">마이 페이지</a>
                </c:if>
                <c:if test="${memberLoggedIn.separator eq 'S' }">
                    <a href="${path }/user/sellerStatus">마이 페이지</a>
                </c:if>
                <c:if test="${memberLoggedIn.separator eq 'A' }">
                    <a href="${path }/user/consumerList">마이 페이지</a>
                </c:if>
                <c:if test="${memberLoggedIn.separator eq null }">
                    <a href="" onclick="window.open('${path}/user/login', '_blank', 'width=400 height=350');">마이 페이지</a>
                </c:if>
                
                    
                </div>
                <div class="user-login-info">
                    <a href="#"><!--<img src="img/core-img/user.svg" alt="">--> 고객 센터</a>
                </div>
                <div class="cart-area">
                    <a href="#" id="essenceCartBtn"><img src="${path }/resources/img/core-img/heart.svg" alt=""> <span>3</span></a>
                </div>
            </div>

        </div>
    </header>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Right Side Cart Area ##### -->
    <div class="cart-bg-overlay"></div>

    <div class="right-side-cart-area">

        <!-- Cart Button -->
        <div class="cart-button">
            <a href="#" id="rightSideCart"><img src="${path }/resources/img/core-img/bag.svg" alt=""> <span>3</span></a>
        </div>

        <div class="cart-content d-flex">

            <!-- Cart List Area -->
            <div class="cart-list">
                <!-- Single Cart Item -->
                <div class="single-cart-item">
                    <a href="#" class="product-image">
                        <img src="${path }/resources/img/product-img/product-1.jpg" class="cart-thumb" alt="">
                        <!-- Cart Item Desc -->
                        <div class="cart-item-desc">
                          <span class="product-remove"><i class="fa fa-close" aria-hidden="true"></i></span>
                            <span class="badge">Mango</span>
                            <h6>Button Through Strap Mini Dress</h6>
                            <p class="size">Size: S</p>
                            <p class="color">Color: Red</p>
                            <p class="price">$45.00</p>
                        </div>
                    </a>
                </div>

                <!-- Single Cart Item -->
                <div class="single-cart-item">
                    <a href="#" class="product-image">
                        <img src="${path }/resources/img/product-img/product-2.jpg" class="cart-thumb" alt="">
                        <!-- Cart Item Desc -->
                        <div class="cart-item-desc">
                          <span class="product-remove"><i class="fa fa-close" aria-hidden="true"></i></span>
                            <span class="badge">Mango</span>
                            <h6>Button Through Strap Mini Dress</h6>
                            <p class="size">Size: S</p>
                            <p class="color">Color: Red</p>
                            <p class="price">$45.00</p>
                        </div>
                    </a>
                </div>

                <!-- Single Cart Item -->
                <div class="single-cart-item">
                    <a href="#" class="product-image">
                        <img src="${path }/resources/img/product-img/product-3.jpg" class="cart-thumb" alt="">
                        <!-- Cart Item Desc -->
                        <div class="cart-item-desc">
                          <span class="product-remove"><i class="fa fa-close" aria-hidden="true"></i></span>
                            <span class="badge">Mango</span>
                            <h6>Button Through Strap Mini Dress</h6>
                            <p class="size">Size: S</p>
                            <p class="color">Color: Red</p>
                            <p class="price">$45.00</p>
                        </div>
                    </a>
                </div>
            </div>

            <!-- Cart Summary -->
            <div class="cart-amount-summary">

                <h2>Summary 요약</h2>
                <ul class="summary-table">
                    <li><span>subtotal: 총액 :</span> <span>$274.00</span></li>
                    <li><span>delivery: 배송비 :</span> <span>Free</span></li>
                    <li><span>discount: 할인율 : </span> <span>-15%</span></li>
                    <li><span>total: 거래금액 : </span> <span>$232.00</span></li>
                </ul>
                <div class="checkout-btn mt-100">
                    <a href="checkout.html" class="btn essence-btn">check out</a>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Right Side Cart End ##### -->
    <section class="new_arrivals_area section-padding-80 clearfix">