<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="게시글 수정"/>
</jsp:include>
	<section class='height-800'>
        <div class='container'>
            <div class='text-center'>
                <h2>게시글 수정</h2>
            </div>
            <br><br><br>
                <form method='post' action="index.html">
                    <div>
                        <table>
                            <tr>
                                <th><label>&nbsp;제목&nbsp;</label></th>
                                <td>
                                    <input type="text" class="form-control" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <th><label>&nbsp;작성자&nbsp;</label></th>
                                <td>
                                    <input type="text" class="form-control" value="" readonly/>
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
                        <input type="submit" class="xet_btn medium" value="수정 완료" onclick='fn_update()' name='updateboard'/>
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