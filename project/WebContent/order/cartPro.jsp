<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="order.*"%>
<%--CartProc.jsp--%>

<jsp:useBean id="cartDao" class="order.CartDao" scope="session">
</jsp:useBean>

<%-- dto에 모두 setter 작업  --%>

<jsp:useBean id="orderDto" class="order.OrderDto">
	<jsp:setProperty name="orderDto" property="*"/>
</jsp:useBean>
<%

String flag=request.getParameter("flag");
String id=(String)session.getAttribute("id");
orderDto.setM_id(id);


if(id==null){
	response.sendRedirect("../member/loginForm.do");
}else{
	if(flag==null){
		orderDto.setM_id(id);
		Hashtable hcart = cartDao.addCart(orderDto);/////////////////
		session.setAttribute("hCart", hcart);
		%>
		<script>
			alert("장바구니에 담았습니다");
			location.href="cartList.do";
		</script>
	<% 
	}else if(flag.equals("update")){
		orderDto.setM_id(id);
		cartDao.updateCart(orderDto);	
	%>
	<script>
			alert("수정 하였습니다");
			location.href="cartList.do";
	</script>
		<% 
	}else if(flag.equals("del")){
		cartDao.deleteCart(orderDto);	
	%>
	<script>
			alert("삭제 하였습니다");
			location.href="cartList.do";
	</script>
	<% 
	}//else if
}//else
%>
