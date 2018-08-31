<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import="com.kh.TicketSky.board.model.vo.Board"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:param value="게시글" name="title"/>
<%
	Board b = new Board();
%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <section class='height-800'>
            <div class='container'>
                <div class='text-center'>
                    <h2>게시글</h2>
                </div>
                <br>
                <table class='table'>
                    <tr>
                        <th>게시글 번호</th>
                        <td><%= %></td>
                        <th>글 제목</th>
                        <td><%= %></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td><%= %></td>
                        <th>작성일</th>
                        <td><%= %></td>
                    </tr>
                    <tr>
                        <th>조회수</th>
                        <td><%= %></td>
                        <th>첨부파일</th>
                        <td><%= %></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td colspan="3"><%= %></td>
                    </tr>
                </table>
                <hr>
                <div id="buttons">
                    <input type='button' class='btn btn-primary' value='수정' name='update' onclick='fn_update()'/>
                    <input type='button' class='btn btn-primary' value='삭제' name='delete' onclick='fn_delete()'/>
                    <input type='button' class='btn btn-danger' value='이 게시글 신고' name='report' onclick='fn_report()'/>
                    <input type='button' class='btn btn-default' value='뒤로 가기' onclick='fn_back()'/>
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