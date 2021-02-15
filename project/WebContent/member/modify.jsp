<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/view/color.jspf"%>
<%--modify.jsp--%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>
<form name="modifyForm" method="post" action="${ctxpath}/member/modifyForm.do">
					<div class="container-login100-form-btn m-t-17">
						<input type="hidden" name="id" value="${sessionScope.id}">
						<input type="submit" value="modify" class="login100-form-btn">						
					</div>
</form>
	
				<form name="deleteForm" method="post" action="${ctxpath}/member/deleteForm.do">
				<div class="container-login100-form-btn m-t-17">
					<input type="hidden" name="id" value="${sessionScope.id}">
  					 <input type="submit" value="quit member" class="login100-form-btn">
  				</div>
				</form>
</body>
</html>