<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.kh.TicketSky.common.Page,com.kh.TicketSky.board.model.vo.Board, java.util.*"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
	int cPage = Integer.parseInt((String)request.getAttribute("cPage"));
	int numPerPage = Integer.parseInt((String)request.getAttribute("numPerPage"));
	int totalContents = Integer.parseInt((String)request.getAttribute("totalContents"));
	String url = (String)request.getAttribute("url");
	List<Board> bList = (List<Board>)request.getAttribute("list");
%>
<style>
    a.boardtitle{
        color:black;
    }
    .form-control{
        width:300px;
        margin:0px;
    }
    #pagebar{
        padding:16px;
    }
    #pagebar ul li{
        display:inline;
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
                    <img src="img/core-img/communityboardlogo.PNG"/> 자유게시판 <img src="img/core-img/communityboardlogo.PNG"/>
                </h2>
            </div>
            <br><br><br>
            <div style="float:left;">
                <select>
                    <option>작성자</option>
                    <option>글 제목</option>
                </select>
            </div>
            <div style="float:left;">
                <input type='text' class="form-control" id="searchtext" placeholder="검색할 내용을 입력하시오"/>
            </div>
            <div style="float:left;">
                <input type="button" class="btn btn-primary" value="검색" name='search'/>
            </div>
            <div style="float:right;">
                <input type='button' class="btn btn-default" id="essay" name="newEssay" value="새 글 쓰기" onclick="location.href='comboardForm.html'"/>
            </div>
            <div style="float:right;">
                <h3>전체 글(<%=totalContents%>)&nbsp;</h3>
            </div>
            <br><br><br>
            <table class='table table-hover table-sm'>
                <thead>
                    <tr>
                        <th style="width:70px;">글 번호</th>
                        <th style="width:270px;">글 제목</th>
                        <th style="width:90px;">첨부파일</th>
                        <th style="width:150px;">작성자</th>
                        <th style="width:120px;">작성일</th>
                        <th style="width:70px;">조회수</th>
                    </tr>
                </thead>
                <tbody>
                	<%for(Board b : bList){%>
                    <tr>
                        <td><%=b.getBoardNo()%></td>
                        <td>
	                        <a class='boardtitle' href='community/comboardView?boardNo=<%=b.getBoardNo()%>'>
		                        <%=b.getBoardTitle()%>
	                        </a>
                        </td>
                        <td>
                        	<%=b.getAttachmentNo()%>
                        </td>
                        <td><%="userId"%></td>
                        <td><%=b.getWriteDate()%></td>
                        <td><%=b.getVisits()%></td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
            <hr>
            <div id='pagebar'>
                <%=new Page().getPage(cPage, numPerPage, totalContents, url)%>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>