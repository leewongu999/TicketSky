<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<c:set value="${pageContext.request.contextPath}" var="path"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/adminAside.jsp"></jsp:include>



	<style media="screen">
      #enrollform{
        font-size: 1.1em;
      }
      #enrollform input::placeholder{
        font-size: 1.2em;
      }

	  span.guide {display:none;}

    </style>



     <div class="col-12 col-md-8 col-lg-9">
      <div class="container" style="">
        <div class="row" style="padding-left: 3%; ">
          <h4>회원정보수정</h4>
        </div>
        <hr>
        <form class="form-horizontal" id="enrollform" action="${path }/user/adminUserUpdateEnd" method="post" onsubmit="return fn_enroll_validate();">
        	<input type="hidden" name="separator" value="${m.separator }">
          <div class="form-group" >
            <label for="inputEmail" class="col-xs-2 control-label">아이디</label>
            <div class="col-xs-9">
              <input type="text" name="userId" class="form-control" id="userId_" value="${m.userId }" readonly>
            </div>
          </div>
          <div class="form-group">
            <label for="inputRipple" class="col-xs-2 control-label">이메일</label>
            <div class="col-xs-9">
              <input type="email" name="email" class="form-control"  value="${m.email }"id="inputRipple" placeholder="이메일">
            </div>
          </div>
          <div class="form-group" hidden>
            <label for="inputPassword" class="col-xs-2 control-label">변결할 비밀번호</label>
            <div class="col-xs-9">
              <input type="password" name="password" class="form-control" id="password_" placeholder="비밀번호" value="${m.password }">
              <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
            </div>
          </div>
          <div class="form-group">
            <label for="inputName" class="col-xs-2 control-label">이름</label>
            <div class="col-xs-9">
              <input type="text" name="userName" class="form-control"  value="${m.userName }"placeholder="이름" readonly>
            </div>
          </div>

          <div class="form-group">
            <label for="inputName" class="col-xs-2 control-label">주소</label>
            <div class="col-xs-9">
              <input type="text" name="address" class="form-control"  value="${m.address }"  placeholder="주소">
            </div>
          </div>

            <div class="form-group">
              <label for="inputName" class="col-xs-2 control-label">생년월일</label>
              <div class="col-xs-9">
                <input type="text" name="birthdate" class="form-control"  value="${m.birthdate }" readonly placeholder="생년월일">
              </div>
            </div>
            <div class="form-group">
              <label for="inputNumber" class="col-xs-2 control-label">휴대폰번호</label>
              <div class="col-xs-9">
                <input type="text" name="phone" class="form-control"  value="${m.phone }" placeholder="휴대폰번호">
                <p class="help-block">- 없이 적어주세요.</p>
              </div>

            </div>
            
            <div class="form-group " hidden>
              <label for="inputNumber" class="col-xs-2 control-label">관심카테고리</label>
              <div class="col-xs-9">
                <label class="radio-inline">
				  <input type="radio" name="categoryNo" value="1" > 뮤지컬
				</label>
				<label class="radio-inline">
				  <input type="radio" name="categoryNo" value="2" checked> 연극
				</label>
				<label class="radio-inline">
				  <input type="radio" name="categoryNo" value="3"> 콘서트
				</label>
				<label class="radio-inline">
				  <input type="radio" name="categoryNo"  value="4"> 클래식/무용
				</label>
              </div>
            </div>

            
            <div class="form-group">
              <label for="inputName" class="col-sm-2 control-label"></label>
              <div class="col-xs-9">
                <button  type="submit" class="btn btn-primary">회원정보수정</button>
              </div>
            </div>
          </form>
      </div> <!-- container -->
    </div>
    </section>
    
    <script>
$(function(){
	if("${m.separator}" == "C") // 구매자 이면
		$("input:radio[name ='categoryNo']:input[value='${m.categoryNo}']").attr("checked", true);
});	

		
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>