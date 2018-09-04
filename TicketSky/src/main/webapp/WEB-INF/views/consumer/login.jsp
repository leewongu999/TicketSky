<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<c:set value="${pageContext.request.contextPath}" var="path"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>로그인</title>

    <!-- bootstrap -->
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">



</head>




<body>
  <div class="container">
    <div class="login-form">
        <form action="${path }/user/memberLogin.do" method="post">
            <h2 class="text-center">로그인</h2>
            <div class="form-group">
            	<div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    <input type="text" class="form-control" name="userId" placeholder="Username" required="required" value="${cookie.id.value }">
                </div>
            </div>
    		<div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                    <input type="password" class="form-control" name="password" placeholder="Password" required="required">
                </div>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary login-btn btn-block">로그인</button>
            </div>
            <div class="clearfix">
                <label class="pull-left checkbox-inline"><input type="checkbox" name="saveId" value="1"<c:if test="${cookie.saveId.value ne null }">checked</c:if>> 아이디 저장</label>
                <a herf="#" onclick="fn_forgetPassword();" class="pull-right">아이디/비밀번호 찾기</a>
            </div>
    		<!-- <div class="or-seperator"><i>or</i></div> -->
            <br>
            <!-- <p class="text-center">소셜 로그인</p> -->
            <div class="text-center social-btn">
                <a href="#" class="btn btn-primary"><i class="fa fa-facebook"></i>&nbsp; Facebook</a>
                <a href="#" class="btn btn-info"><i class="fa fa-twitter"></i>&nbsp; Twitter</a>
    			<a href="#" class="btn btn-danger"><i class="fa fa-google"></i>&nbsp; Google</a>
            </div>
        </form>
        <p style="margin-top:3px;" class="text-center text-muted small">Ticket Sky 계정이 없으신가요? <a herf="#" onclick="fn_con_enroll();">구매자 회원가입</a></p>
        <p class="text-center text-muted small">Ticket Sky 계정이 없으신가요? <a herf="#" onclick="fn_sel_enroll();">판매자 회원가입</a></p>
        
    </div>
  </div>

<script type="text/javascript">
  function fn_con_enroll(){
    window.open('${path}/user/consumerEnroll');
    window.close();
  }
  
  function fn_sel_enroll(){
	window.open('${path}/user/sellerEnroll');
	window.close();
  }

  function fn_forgetPassword(){
    window.open('${path}/user/forgetPassword', '_blank', 'width=400 height=480');
    window.close();
  }
</script>


</body>

</html>
