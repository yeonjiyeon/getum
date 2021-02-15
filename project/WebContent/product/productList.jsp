<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/view/color.jspf"%>
<%@ page import="java.util.*"%>
<%@ page import="product.*"%>

<%--ProductList.jsp--%>
<fmt:requestEncoding value="utf-8" />


<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Karma">
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Karma", sans-serif
}

.w3-bar-block .w3-bar-item {
	padding: 20px
}
</style>


	
</script>
<script type="text/javascript" src="script.js"></script>
</head>
<body>
	<!-- !PAGE CONTENT! -->
	<div class="w3-main w3-content w3-padding"
		style="max-width: 1200px; margin-top: 100px">
		<center><h2><b>all products</b></h2></center>
		<c:if test="${empty productList}">
			등록된 상품이 없습니다
		</c:if>

		<c:if test="${!empty productList}">
			<div class="w3-row-padding w3-padding-16 w3-center" id="food">
				<c:forEach var="dto" items="${productList}">
					<div class="w3-quarter">
						<c:if test="${dto.stock>0}">
							<a href="javascript:productDetail('${dto.code}')"> 
							<img src="${ctxpath}/imgs/${dto.image}" alt=" ${dto.name}" width="320" height="380">
							</a>
						</c:if>
						<c:if test="${dto.stock==0}">
							<script>
								alert("재고없음");
							</script>
						</c:if>
						<h6>${dto.name}</h6>
						<h6>${dto.price}</h6>
								
					</div>
				</c:forEach>
			</div>
		</c:if>

		<form name="detail" method="post"
			action="${ctxpath}/product/productDetail.do">
			<input type="hidden" name="code">
		</form>

	</div>

</body>
</html>