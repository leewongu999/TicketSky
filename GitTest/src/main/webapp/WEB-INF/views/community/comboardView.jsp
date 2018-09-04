<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import="com.kh.TicketSky.board.model.vo.Board"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:param value="게시글" name="title"/>
<%
	Board b = (Board)request.getAttribute("board");
%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <section class='height-800'>
            <div class='container'>
                <div class='text-center'>
                    <h4 class='boardTitle'>게시글</h4>
                </div>
                <br>
                <table id='xet_board' class='boardList'>
                    <tr>
                        <th>게시글 번호</th>
                        <td><%=b.getBoardNo()%></td>
                        <th>글 제목</th>
                        <td><%=b.getBoardTitle()%></td>
                        <th>작성자</th>
                        <td><%=b.getUserId()%></td>
                        <th>작성일</th>
                        <td><%=b.getWriteDate()%></td>
                    </tr>
                    <tr>
                        <th>조회수</th>
                        <td><%=b.getVisits()%></td>
                        <th>첨부파일</th>
                        <td colspan='5'><%=b.getOriginalFileName()%></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td colspan='7' style='text-align:left;'><%=b.getContent()%></td>
                    </tr>
                </table>
                <hr>
                <div id="buttons">
                    <input type='button' class='xet_btn medium' value='수정' name='update' onclick='fn_update()'/>
                    <input type='button' class='xet_btn medium' value='삭제' name='delete' onclick='fn_delete()'/>
                    <input type='button' class='xet_btn medium' value='이 게시글 신고' name='report' onclick='fn_report()'/>
                    <input type='button' class='xet_btn medium' value='뒤로 가기' onclick='fn_back()'/>
                </div>
                <script>
                    function fn_update(){
                        location.href="${path}/comboardUpdate.do";
                    }
                    function fn_delete(){
                        location.href="${path}/comboardDelete.do";
                    }
                    function fn_report(){
                        location.href="${path}/comboardReport.do";
                    }
                    function fn_back(){
                        history.back(-1);                       // 현재 페이지를 기준으로 바로 직전 페이지로 돌아가게 하는 메소드 구현
                    }
                </script>
            </div>
        </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>