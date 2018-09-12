<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
	        <br>
	        <p>위에 취소 버튼을 누르시면 게시판 1페이지로 이동합니다.</p>
	        <script>
	            function fn_confirm(){
	            	if($("#reason").val()=='' || $.trim($("#reason").val()).length==0){
	            		alert("신고사항을 입력하시오.");
	            		return false;
	            	}
	            	else{
	            		return true;
	            	}
	            }
	            function fn_back(){
	                location.href="${path}/community/board?cPage=1";
	            }
	        </script>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>