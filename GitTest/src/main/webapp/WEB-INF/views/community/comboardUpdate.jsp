<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.TicketSky.board.model.vo.Board"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="게시글 수정"/>
</jsp:include>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	Board b = (Board)request.getAttribute("board");
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
                <h2>게시글 수정</h2>
            </div>
            <br><br><br>
                <form method='post' action="${path}/community/comboardUpdateEnd">
                    <div>
                    	<p>
                    		<input type='text' name='boardNo' style="width:60px;text-align:center;" value='<%=b.getBoardNo()%>'/>번 게시글을 수정합니다.
                    	</p>
                        <table>
                            <tr>
                                <th><label>&nbsp;제목&nbsp;</label></th>
                                <td>
                                    <input type="text" class="form-control" name='boardtitle' value="<%=b.getBoardTitle()%>" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th><label>&nbsp;작성자&nbsp;</label></th>
                                <td>
                                    <input type="text" class="form-control" name='userID' value="<%=b.getUserId()%>" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th><label>&nbsp;첨부파일&nbsp;</label></th>
                                <td>
                                    <input type="file" class="form-control" id="file" name="file"/>
                                </td>
                            </tr>
                            <tr>
                                <th><label>&nbsp;내용&nbsp;</label></th>
                                <td>
                                    <textarea class="form-control" cols="100" rows="10" name="content" id="contents" style="resize:none;"></textarea>
                                </td>
                            </tr>
                        </table>
                        <hr>
                        <input type="submit" class="xet_btn medium" value="수정 완료" onclick='return fn_update()'/>
                        <input type="button" class="xet_btn medium" value="뒤로 가기" onclick='fn_back()'/>
                    </div>
                </form>
            <script>
                function fn_update(){
                    if($('#contents').val()==null || $('#contents').val()==''){
                        alert("내용을 입력하시오.");
                        return false;
                    }
                    else{
                        alert("수정 완료하였습니다.\n메인 홈페이지로 이동합니다.");
                        return true;
                    }
                }
                function fn_back(){
                    history.back(-1);
                }
            </script>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>