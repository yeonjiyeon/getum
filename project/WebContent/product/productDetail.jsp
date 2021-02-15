<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/view/color.jspf"%>    

<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
body {font-family: "Times New Roman", Georgia, Serif;}
h1, h2, h3, h4, h5, h6 {
  font-family: "Playfair Display";
  letter-spacing: 5px;
}
</style>
<body topmargin="20">
<!-- Page content -->
<div class="w3-content" style="max-width:1100px">

  <!-- About Section -->
  <div class="w3-row w3-padding-64" id="about">
    <div class="w3-col m6 w3-padding-large w3-hide-small">
     <img src="${ctxpath}/imgs/${dto.image}" class="w3-round w3-image w3-opacity-min" width="600" height="750">
    </div>

    <div class="w3-col m6 w3-padding-large">
    <%--장바구에 담기로 이동 --%>
	<form method="post" action="${ctxpath}/order/cartPro.jsp">
      <h1 class="w3-center"> ${dto.name}</h1><br>
      <h3 class="w3-center">코드:<input type="text" name="code" id="code" value="${dto.code}"></h3>
      <h3 class="w3-center">\<input type="text" name="price" id="price" value="${dto.price}"></h3>
      <h6 class="w3-center">${dto.regdate}</h6>
      <p>
      <h3>${dto.detail}</h3>
      	
      </p>
     	수량: <input type="number" name="quantity" id="quantity" max="99" min="1" value="1"/><br/>
       	<input type="submit" value="cart">
   	   	<input type="button" value="more" onclick="window.location='${ctxpath}/product/productList.do'">
   
   		<input type=hidden name=pro_no value="${dto.pro_no}">
   
   <c:set var="id" value="${id}" scope="session"/>
   
   <input type=hidden name=id value="${sessionScope.id}">
   <input type=hidden name=state value="1">
      
    </form>
    </div>
  </div>
  </div>
  
</body>
</html>
