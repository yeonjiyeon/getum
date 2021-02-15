<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/view/color.jspf"%>
    
<%@ page import="order.*"%>
<%@ page import="product.*"%>
<%@ page import="java.util.*"%>

<%--OrderProc.jsp--%>
<jsp:useBean id="cartDao" class="order.CartDao" scope="session"/>
<jsp:useBean id="orderDao" class="order.OrderDao"/>
<c:if test="${empty hCart}">
 <script>
alert('장바구니가 비어있습니다.');
location.href='${ctxpath}/product/productList.jsp'
</script>
</c:if>

<c:if test="${!empty hCart}">
 <script>
 alert('주문처리 하였습니다');
 location.href='orderList.jsp'
 </script>
</c:if>

 
 

