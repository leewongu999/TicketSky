<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/community/rptCommonTop.jsp">
	<jsp:param value="게시글 신고" name="title"/>
</jsp:include>
<%
	int boardRPT;
	int maxBNo;
	try{
		boardRPT = Integer.parseInt(String.valueOf(request.getAttribute("reportBoardNo")));
		maxBNo = Integer.parseInt(String.valueOf(request.getAttribute("maxBNo")));
	}catch(NumberFormatException e){
		boardRPT = 1;
		maxBNo = 1;
	}
%>
			<form method='post' action='${path}/community/reportBoardEnd'>
				<p>게시글 신고</p>
				<input type="hidden" name="boardRPT" style="width:60px;text-align:center;" value="<%=boardRPT%>"/>
								<div>
					<strong>
						여기에 신고할 사항을 적으시오.
					</strong>
					<table class="table">
					<!-- 아래에서 value 속성의 값은 다른 클래스에서 가져와야 한다. 합칠 때 "userId"라고 적은 값을 지우고 m.getUserId()와 같이 적어주세요. -->
					<!-- 그리고 윗줄 import에도 포함시킬 것 -->
						<input type="hidden" name="userID" class='form-control' value="<%="userId"%>"/>
						<tr>
							<td>
								<input type="text" id="reason" name="reportReason" class="form-control" placeholder="짤막하게 입력하시오."/>
							</td>
						</tr>
					</table>
					<br><br>
					<input type="submit" class="xet_btn medium" value="확인" name='confirm' onclick='return fn_confirm()'/>
					<input type="reset" class="xet_btn medium" value="취소" name='cancel' onclick='fn_back()'/>
				</div>
			</form>
<jsp:include page="/WEB-INF/views/community/rptCommonBottom.jsp"/>