<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/view/color.jspf"%>    
<%@ page import="java.util.*"%>
<%@ page import="product.*"%>   
<%--ProductDetail.jsp --%>
<fmt:requestEncoding value="utf-8"/>
<html>
<head>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="script.js"></script>
</head>

<body topmargin="20">
<center><h2>${dto.name}</h2></center>

<%--장바구에 담기로 이동 --%>
<form method="post" action="${ctxpath}/order/cartPro.jsp">
<table align="center" width="80%" cellpadding="3">

<tr>
  <td colspan=2 align=center>
   <img src="${ctxpath}/imgs/${dto.image}">
  </td> 
</tr>

<%--
//이미지파일을 가져올때 사용
컨텍스트 경로(웹경로):<%= request.getContextPath() %><br>

//이미지파일 파일업로드할때 사용
실제경로:<%=config.getServletContext().getRealPath("/")%>
--%>

<tr>
  <td width=45%>상품코드</td>
  <td>
  <input type="text" name="code" id="code" value="${dto.code}">
  </td>
</tr>

<tr>
  <td>가격</td>
  <td><input type="text" name="price" id="price" value="${dto.price}"></td>
</tr>

<tr> 
  <td>출시날짜</td>
  <td>
 
  ${dto.regdate}
  
  <%--주문날짜 --%>
  <%--
  OrderMgr.java에서 NOW()로 입력 했음
  아래와 같이 넘기면 무조건 String 이다 
  <input type="hidden" name="ord_date" id="ord_date" value="<%=sdf.format(date) %>">
  --%>
 </td>
</tr>


 <tr>
  <td> 수량:</td>
  <td>
  <input type="number" name="quantity" id="quantity" max="99" min="1"/>
  </td>
 </tr>
<tr>
   <td colspan="2" align="center">
   <input type="submit" value="장바구니담기">
   <input type="reset" value="취소">
   
   <input type=hidden name=pro_no value="${dto.pro_no}">
   
   <c:set var="id" value="${id}" scope="session"/>
   
   <input type=hidden name=id value="${sessionScope.id}">
   <input type=hidden name=state value="1">
   
   </td>
</tr>      
</table>
</form>
</body>
</html>