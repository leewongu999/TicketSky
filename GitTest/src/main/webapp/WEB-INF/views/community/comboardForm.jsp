<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="새 글 쓰기"/>
</jsp:include>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
%>
<style>
    section{
        text-align:center;
        margin:auto;
        padding-top:50px;
        padding-bottom:100px;
    }
    table{
        margin:auto;
    }
    th{
        font-size:16px;
    }
</style>
	<section class='height-800'>
        <div class='container'>
            <div class='text-center'>
                <h2>새 게시글 작성</h2>
            </div>
            <br><br><br>
            <form method='post' action='${path}/community/comboardFormEnd'>
                <div>
                    <table>
                        <tr>
                            <th><label>&nbsp;제목&nbsp;</label></th>
                            <td>
                                <input type="text" class="form-control" name="boardtitle" id="title"/>
                            </td>
                        </tr>
                        <tr>
                            <th><label>&nbsp;작성자&nbsp;</label></th>
                            <td>
                            	<!-- 아래의 input 태그의 value 속성은 Member 객체에서 가져와야 한다.
                            	여기서는 임의의 값을 넣었으므로, 나중에 다른 것과 합칠 때 value 속성의 값을 지우기 바랍니다.
                            	단, System.out.println()과 같은 기능을 하는 태그까지 지우지 말고 그 안의 값만 지울 것. -->
                                <input type="text" class="form-control" name="userID" value="<%="dongmakgol0110"%>" readonly/>
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
                    <input type="submit" id='add' class="xet_btn medium" value="등록" name='addboard' onclick='return fn_add()'/>
                    <input type="button" class="xet_btn medium" value="뒤로 가기" onclick='fn_back()'/>
                </div>
            </form>
            <script>
                function fn_add(){
                    if($('#title').val()=='' || $('#contents').val()==''){
                        if($('#title').val()==''){
                            alert("제목을 입력하세요.");
                            return false;
                        }
                        if($('#contents').val()==''){
                            alert("내용을 입력하세요.");
                            return false;
                        }
                    }
                    else
                    	return true;
                }
                function fn_back(){
                    history.back(-1);
                }
            </script>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>