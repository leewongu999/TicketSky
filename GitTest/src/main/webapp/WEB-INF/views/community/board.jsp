<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.kh.TicketSky.common.Page,com.kh.TicketSky.board.model.vo.Board, java.util.*"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
	int totalContents = Integer.parseInt(String.valueOf(request.getAttribute("totalContents")));
	String pageBar = (String)request.getAttribute("pageBar");
	List<Board> list = (List<Board>)request.getAttribute("list");
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
	            <form name='search' method='post' action="${path}/community/boardKeyword">
		            <select name='item'>
		                <option value="userId" ${"userId" eq param.item?"selected":""}>작성자</option>
		                <option value="boardTitle" ${"boardTitle" eq param.item?"selected":""}>글 제목</option>
		                <option value="boardNo" ${"boardNo" eq param.item?"selected":""}>글 번호</option>
		            </select>
			        <div style="float:left;">
			            <input type='search' name="searchKeyword" class="form-control boardSearchForm" placeholder="검색할 내용을 입력하시오" value="${searchtext}"/>
			        </div>
			        <div style="float:left;">
			            <input type="submit" class="xet_btn large" value="검색"/>
			        </div>
	        	</form>
	        </div>
	        <div style="float:right;">
	            <input type='button' class="xet_btn medium" id="essay" name="newEssay" value="새 글 쓰기" onclick="location.href='${path}/community/comboardForm'"/>
	        </div>
	        <div style="float:right;">
	            <h4>전체 글(<%=totalContents%>)&nbsp;</h4>
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
	                	<%for(Board b : list){%>
		                	<input type="hidden" name="boardNo" value="<%=b.getBoardNo()%>"/>
		                    <tr>
		                        <td><%=b.getBoardNo()%></td>
		                        <td>	<!-- 첨부 파일이 있을 때 다운로드 할 수 있는 아이콘을 추가한다. -->
			                        <a class='boardtitle' href='${path}/community/comboardView?boardNo=<%=b.getBoardNo()%>'>
				                        <%=b.getBoardTitle()%>
				                    </a>
			                        <%if(b.getOriginalFileName()!=null){%>
				                        <i class='fileIcon'>
				                        	<img src="${path}/resources/img/core-img/다운로드.png"/>
				                        </i>
				                    <%}%>
				                    <span style="font-size:10px;color:red;">
				                    	<strong>(<%=b.getCountReplies()%>)</strong>
				                    </span>
		                        </td>
		                        <td><%=b.getUserId()%></td>
		                        <td><%=b.getWriteDate()%></td>
		                        <td><%=b.getVisits()%></td>
		                    </tr>
	                    <%}%>
                    </form>
                </tbody>
            </table>
            <hr>
        </div>
    </section>
    <section class='new_arrivals_area section-padding-80 clearfix'>
    	<div>
            <%=pageBar%>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>