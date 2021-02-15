<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/view/color.jspf"%>
<!-- 로그인 성공 -->
<c:if test="${check==1}">
	<c:set var="id" value="${id}" scope="session"/>
	<c:set var="name" value="${name}" scope="session"/>
  <meta http-equiv="Refresh"  content="0;url=${ctxpath}/member/loginForm.do"/>
</c:if>


<!-- 로그인 실패 -->
<c:if test="${check==0}">
	<script>
		alert("비밀번호가 틀립니다");
		history.go(-1);
	</script>
</c:if>