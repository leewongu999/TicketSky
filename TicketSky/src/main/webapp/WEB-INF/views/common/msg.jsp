<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<c:set var="path" value="<%=request.getContextPath()%>"/>

<script>
	alert("${msg}");
	if("${userChk}" == "C"){
		self.close();
		opener.location.href="${path}/user/consumerMyPage";
	}
	location.href="${path}${loc}";
	
	
</script>