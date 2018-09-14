<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.TicketSky.board.model.vo.Board"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:useBean id="today" class="java.util.Date"/>
<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="today"/>
<%
	String pageBar = (String)(request.getAttribute("pageBar"));
	List<Map<String,Object>> bList = (List<Map<String,Object>>)request.getAttribute("bList");
%>
<style>
    a.boardtitle{
        color:black;
    }
    .fileIcon{
    	width:16px;
    	height:16px;
    }
    .form-control{
        width:300px;
        margin:0px;
    }
    section{
        text-align:center;
        margin:auto;
        padding:30px;
    }
    table{
        margin:auto;
    }
    table tr td{
        font-size:16px;
    }
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<section class='height-800'>
        <div class='container'>
            <div class='text-center'>
                <h2>
                    <img src="${path}/resources/img/core-img/communityboardlogo.PNG"/> 자유게시판 <img src="${path}/resources/img/core-img/communityboardlogo.PNG"/>
                </h2>
            </div>
            <br><br><br>
            <div style="float:left;">
	            <form name='search' method='post' action="${path}/community/boardKeyword?cPage='<c:out value="${cPage}"/>'">
		            <select name='item'>
		                <option value="userId" ${"userId" eq param.item?"selected":""}>작성자</option>
		                <option value="boardTitle" ${"title" eq param.item?"selected":""}>글 제목</option>
		            	<option value="boardNo" ${"boardnum" eq param.item?"selected":""}>번호</option>
		            </select>
			        <div style="float:left;">
			            <input type="search" id="searchText" name="searchKeyword" class="form-control boardSearchForm" placeholder="${searchKeyword}" value="${searchKeyword}"/>
			        </div>
			        <div style="float:left;">
			            <input type="submit" class="xet_btn large" value="검색"/>
			        </div>
			        <script>
			        	function fn_search(){
			        		if($('input#searchText').val()=='' || $.trim($('input#searchText').val()).length==0){
			        			alert("내용을 입력하지 않으면 검색되지 않습니다.");
			        			return false;
			        		}
			        		else
			        			return true;
			        	}
			        </script>
	        	</form>
	        </div>
	        <div style="float:right;">
	            <input type='button' class="xet_btn medium" id="essay" name="newEssay" value="새 글 쓰기" onclick="location.href='${path}/community/comboardForm'"/>
	        </div>
	        <div style="float:right;">
	            <h4>전체 글(<c:out value="${totalContents}"/>)&nbsp;</h4>
	        </div>
            <br><br><br>
            <table id='xet_board' class='boardList'>
                <thead>
                    <tr>
                        <th style="width:70px;">글 번호</th>
                        <th style="width:270px;">글 제목</th>
                        <th style="width:150px;">작성자</th>
                        <th style="width:120px;">작성일</th>
                        <th style="width:70px;">조회수</th>
                    </tr>
                </thead>
                <tbody>
	                <form method="post" action="${path}/community/replies">
	                	<c:forEach var="b" items="${bList}">
	                	<input type="hidden" name="boardNo" value='<c:out value="${b['BOARDNO']}"/>'/>
	                    <tr>
	                        <td><c:out value="${b['BOARDNO']}"/></td>
	                        <td>	<!-- 첨부 파일이 있을 때 다운로드 할 수 있는 아이콘을 추가한다. -->
		                        <a class='boardtitle' href='${path}/community/comboardView?boardNo=<c:out value="${b['BOARDNO']}"/>'>
			                        <c:out value="${b['BOARDTITLE']}"/>
			                    </a>
			                    <c:if test="${not empty b['ORIGINALFILENAME']}">
			                        <i class='fileIcon'>
			                        	<img src="${path}/resources/img/core-img/다운로드.png"/>
			                        </i>
			                    </c:if>
			                    <!-- 오늘의 날짜와 동일할 때 조건문.
										여기서는 '오늘 올린 게시글은 하루 종일 새 게시글임을 알리는 아이콘을 띄우도록' 설정했다.
										클릭하고 난 후에도 다음 날까지 아이콘이 사라지지 않게 구현하여
										기존의 여러 사이트에 있는 게시판과 차별화를 두었다. -->
								<c:if test="${b['WRITEDATE'] eq java.sql.Date.valueOf(today)}">
									<i class='fileIcon'>
 				                        <img src="${path}/resources/img/core-img/newboardicon.PNG"/>
 				                    </i>
								</c:if>
								<span style="font-size:10px;color:red;">
									<strong>(<c:out value="${b['COUNTREPLIES']}"/>)</strong>
								</span>
	                        </td>
	                        <td><c:out value="${b['USERID']}"/></td>
	                        <td><c:out value="${b['WRITEDATE']}"/></td>
	                        <td><c:out value="${b['VISITS']}"/></td>
	                    </tr>
	                    </c:forEach>
	                </form>
                </tbody>
            </table>
            <hr>
        </div>
    </section>
    <section class='new_arrivals_area section-padding-80 clearfix'>
    	<div><%=pageBar%></div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>