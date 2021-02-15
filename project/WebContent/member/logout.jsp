<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/view/color.jspf" %>
<c:remove var="id" scope="session"/>
<meta http-equiv="Refresh" content="0;url=${ctxpath}/member/loginForm.do">