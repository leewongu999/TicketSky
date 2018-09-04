<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시글 삭제" name="title"/>
</jsp:include>
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
                <h2>게시글 삭제 확인</h2>
            </div>
            <br><br><br>
            <form method='post' action='/community/comboardDeleteEnd'>
	            <div>
	                <table class="table">
	                    <tr>
	                        <th>
	                        	<strong>
	                        		한 번 삭제되면 다시 복구할 수 없습니다.<br>정말로 삭제하시겠습니까?
	                        	</strong>
	                        </th>
	                    </tr>
	                </table>
	                <br><br>
	                <input type="submit" class="xet_btn medium" value="예" name='yes' onclick='return fn_delete()'/>
	                <input type="reset" class="xet_btn medium" value="아니오" name='no' onclick='fn_back()'/>
	            </div>
	            <script>
	            	function fn_delete(){
	            		return true;
	            	}
	                function fn_back(){
	                    history.back(-1);
	                }
	            </script>
            </form>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>