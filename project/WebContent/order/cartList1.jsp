<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="order.*"%>
<%@ page import="product.*"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ include file="/view/color.jspf"%>

<%--CartList.jsp--%>
<fmt:requestEncoding value="utf-8" />
<jsp:useBean id="cartDao" class="order.CartDao" scope="session"/>
<%
OrderDto ordBean=null;
ProductDto proBean=null;
product.ProductDAO proDao=null;
Hashtable hCart=null;
try{
	//String id=request.getParameter("id");
	//session.setAttribute("mem_Id", id);
	//String passwd=request.getParameter("passwd");
	proDao=product.ProductDAO.getInstance();//dao 객체얻기 
	
	
	if(session.getAttribute("id")==null){
		  response.sendRedirect("../member/loginForm.do");//로그인으로 가기
	}else{//로그인 상태
	%>
<html>
<head>
 <script src="//code.jquery.com/jquery-3.2.1.min.js">
 </script>
 <script type="text/javascript" src="script.js"></script>
</head>
<body  topmargin="100">

<table width="80%" align="center">
<tr>
<td align="center">

<table width="95%" align="center" border="1">
 <tr>
   <td align="center">제품<td>
   <td align="center">수량</td>
   <td align="center">가격</td>
   <td align="center">수정/삭제</td>
   <td align="center">조회</td>

 </tr>
 <%
 int totalPrice=0 ;//총금액		
 hCart=cartDao.getCartList();//장바구니내용 가져오기
 
 if(hCart.size()==0){//장바구에 물건이 없을때
	%>
	 <tr><td colspan="5" align="center">
	    선택하신 물품이 없습니다.
	    </td>
	 </tr>
	<% 
 }else{//장바구니에 물건이 있을때
	 out.println("<tr><td align=center colspan=5>장바구니에 들어있는 상품</td></tr>");
	 Enumeration hCartKey=hCart.keys();//모든 key값  얻기 
	 
	 while(hCartKey.hasMoreElements()){//자료가 있는 동안 반복 수행
		 ordBean=(OrderDto)hCart.get(hCartKey.nextElement());
		 proBean=proDao.getProduct(request.getParameter("code"),ordBean.getPro_no());
		 
		 int price=proBean.getPrice();//가격
		 int quantity=Integer.parseInt(ordBean.getQuantity());//수량
		 int subTotal=price*quantity;//계산
		 //totalPrice += price*quantity; // 총금액 구함 
		 totalPrice += subTotal; // 총금액 구함
		 
		 java.util.Date date=new java.util.Date();
	   java.text.SimpleDateFormat sdf=
	    		 new java.text.SimpleDateFormat("yyyy-MM-dd H:mm:ss");
	        
		%>
		 <form method="post" action="cartPro.jsp">
		 <input type="hidden" name="pro_no" value="<%=proBean.getPro_no()%>">
		 <input type="hidden" name="flag">
		 <input type="hidden" name="state" value="2"> 
		 
		 <tr>
		 <td align="center"><%=proBean.getName()%></td>
		 <td align="center">
		  <input type=text name=quantity value="<%=ordBean.getQuantity()%>" size=5>개
		 </td>
		 
		 <td align="center"><%=subTotal+""%></td>
		  
		 <td align="center">
		 <input type="button" value="cart수정" onClick="javaScript:cartUpdate(this.form)">/
		 <input type="button" value="cart삭제" onClick="javaScript:cartDelete(this.form)">
		 </td>
		 
		 <td align="center">
		 <a href="javaScript:productDetail('<%=proBean.getCode()%>')">상세보기</a>
		 </td>
		 </tr> 
		  
		 </form>
		<% 
	 }//while end---
	 %>
	 <tr>  
	    <td colspan="4" align="right">총 금액 :<%=totalPrice%>원</td>
	    <td align="center">
	    	<a href="<%=request.getContextPath()%>/order/orderPro.do">주문하기</a>hCart
	    	
	    </td>
	</tr> 
	 <%
 }//else end ---
 %>
</table>
</td>
</tr>
</table>

<form name="detail" method="post" action="${ctxpath}/product/productDetail.do" >
  <input type="hidden" name="code">
</form>
</body>
</html>
	
	
	<%
	}//else --
	
	
	}catch(Exception ex){}
%>
