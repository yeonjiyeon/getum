<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="/view/color.jspf"%>  
<%--inputPro.jsp --%>
회원가입을 축하합니다

<c:set var="id" value="${id}" scope="session"/>
<c:set var="name" value="${name}" scope="session"/>

<meta http-equiv="Refresh" content="0;url=${ctxpath}/member/loginForm.do"/>
