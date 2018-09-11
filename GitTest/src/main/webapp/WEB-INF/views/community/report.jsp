<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.TicketSky.board.model.vo.*"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시글 신고" name="title"/>
</jsp:include>
<%
	int boardRPT;
	int replyRPT;
	try{
		boardRPT = Integer.parseInt(String.valueOf(request.getAttribute("reportBoardNo")));
		replyRPT = Integer.parseInt(String.valueOf(request.getAttribute("reportReplyNo")));
	}catch(NumberFormatException e){
		boardRPT = 1;
		replyRPT = 1;
	}
%>
<style>
    section{
        text-align:center;
        margin:auto;
        padding-top:100px;
        padding-bottom:150px;
    }
    table{
        margin:auto;
    }
    th{
        font-size:20px;
    }
</style>
	<section class='height-800'>
        <div class='container'>
            <div class='text-center'>
                <h2>관리자에게 신고</h2>
            </div>
            <br><br><br>
	        <form method='post' action='${path}/community/reportBoardEnd'>
		        <input type="hidden" name="boardRPT" style="width:60px;text-align:center;" value="<%=boardRPT%>"/>
		        <div>
		            <strong>
						여기에 신고할 사항을 적으시오.
		            </strong>
		            <table class="table">
		                <tr>
		                	<th>작성자</th>
		                	<td>
		                		<input type="text" name="userID" class='form-control' value="<%="userId"%>" readonly/>
		                	</td>
		                </tr>
		                <tr>
		                	<td colspan='2'>
		                		<input type="text" id="reason" name="reportReason" class="form-control" placeholder="짤막하게 입력하시오."/>
		                	</td>
		                </tr>
		            </table>
		            <br><br>
		            <input type="submit" class="xet_btn medium" value="확인" name='confirm' onclick='return fn_confirm()'/>
		            <input type="reset" class="xet_btn medium" value="취소" name='cancel' onclick='fn_back()'/>
		        </div>
		    </form>
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