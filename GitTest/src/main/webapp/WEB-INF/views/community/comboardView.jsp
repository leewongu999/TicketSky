<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import="com.kh.TicketSky.board.model.vo.*, java.util.*"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	int visits = Integer.parseInt(String.valueOf(request.getAttribute("visits")));
	Board b = (Board)request.getAttribute("board");
	List<Reply> replies = (List<Reply>)request.getAttribute("replies");
	int totalReplies = Integer.parseInt(String.valueOf(request.getAttribute("totalReplies")));
%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시글" name="title"/>
</jsp:include>
<style>
	form:nth-child(1), form:nth-child(2){
		display:inline-block;
	}
	h5{
        float:left;
    }
    section{
        text-align:center;
        margin:auto;
        padding-top:100px;
        padding-bottom:100px;
    }
    span.input{
        color:black;
        padding-left:40px;
        padding-right:40px;
        padding-top:10px;
        padding-bottom:10px;
    }
    span.userid{
        background-color:beige;
        color:black;
        padding-left:40px;
        padding-right:40px;
        padding-top:10px;
        padding-bottom:10px;
    }
    th{
        background-color:beige;
    }
</style>
        <section class='height-600'>
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
                        <td colspan='5'>
                        <%if(b.getOriginalFileName()!=null){%>
                        	<a href='#'><%=b.getOriginalFileName()%></a>
                        <%}else{%>
                        	첨부 파일이 없습니다.
                        <%} %>
                        </td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td colspan='7' style='text-align:left;'><%=b.getContent()%></td>
                    </tr>
                </table>
                <hr>
                <div id="buttons">
	                <form method='post' action="${path}/community/comboardUpdate">
	                	<input type="hidden" name="title" value="<%=b.getBoardTitle()%>"/>
	                	<input type="hidden" name="userID" value="<%=b.getUserId()%>"/>
	                    <input type='button' class='xet_btn medium' value='수정' name='update' onclick='fn_update()'/>
	                    <input type='button' class='xet_btn medium' value='삭제' name='delete' onclick='fn_delete()'/>
	                </form>
	                <form method='post' action="${path}/community/comboardReport">
	                    <input type="hidden" name="boardNo" value="<%=b.getBoardNo()%>"/>
		                <input type='submit' class='xet_btn medium' value='이 게시글 신고' name='reportBoard'/>
	                </form>
                </div>
                <hr>
                <form method='post' action="${path}/community/comboardReply">
                	<input type="hidden" name="boardNo" value="<%=b.getBoardNo()%>"/>
                    <div style="float:left;">
                        <h5>댓글 달기&nbsp;</h5>
                    </div>
                    <div style="float:left;">
                        <input type="submit" class="xet_btn medium" value="OK" name="reply" onclick="return fn_reply()"/>
                        <input type="reset" class="xet_btn medium" value="취소" name="cancel" onclick="fn_clear()"/>
                    </div><br><br>
                    <div>
                        <textarea cols="100" rows="5" name="replyContent" id="reply" class="form-control" style="resize:none;"></textarea>
                    </div>
                </form>
                <script>
                    function fn_update(){
                        location.href="${path}/community/comboardUpdate?boardNo=<%=b.getBoardNo()%>";
                    }
                    function fn_delete(){
                        location.href="${path}/community/comboardDelete?boardNo=<%=b.getBoardNo()%>";
                    }
                    function fn_reply(){
                    	if($('#reply').val()=='' || $.trim($('#reply').val()).length==0){
                    		alert("댓글 내용을 입력하세요.");
                    		return false;
                    	}else if($.trim($('#reply').val()).length>100){
                    		alert("한글 기준으로 100자까지 입력할 수 있습니다(띄어쓰기 포함).");
                    		return false;
                    	}
                    	else
                    		return true;
                    }
                    function fn_clear(){
                    	$('#reply').val("");
                    }
                </script>
                <hr>
                
            </div>
        </section>
        <%if(replies!=null){%>
        	<section class='new_arrivals_area section-padding-80 clearfix'>
        	<div class="container">
        		<h5>댓글(<%=totalReplies%>)</h5>
	        	<table id='xet_board' class='boardList'>
		        <%for(Reply re : replies){%>
			            <tr>
					      <td><%=re.getUserId()%></td>
					      <td><%=re.getComments()%></td>
					      <td><%=re.getWriteDate()%></td>
					      <%if(!re.getUserId().equals("관리자") && !re.getUserId().equals("admin")){%>
					      <form method='post' action="${path}/community/replyDelete">
					          <input type="hidden" name="replyNo" value="<%=re.getReplyNo()%>"/>
							  <input type="hidden" name="bNo" value="<%=re.getBoardNo()%>"/>
						      <td><input type="submit" name="deleteReply" class="xet_btn medium" value="삭제" onclick="fn_delReply()"/></td>
					      </form>
					      <form method='post' action="${path}/community/replyReport">
					      	<input type="hidden" name="replyNo" value="<%=re.getReplyNo()%>"/>
					      	<td><input type="submit" name="reportReply" class="xet_btn medium" value="신고""/></td>
					      </form>
					      <%}else{%>
					      <td></td>
					      <td></td>
					      <%}%>
				        </tr>
			        <script>
				        function fn_delReply(){
		                	location.href="${path}/community/replyDelete?replyNo=<%=re.getReplyNo()%>";
		                }
			        </script>
			    <%}%>
			    </table>
	        </div>
	        </section>
	    <%}%>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>