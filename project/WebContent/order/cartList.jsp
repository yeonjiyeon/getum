<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="order.*"%>
<%@ page import="product.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/view/color.jspf"%>

<%--CartList.jsp--%>
<fmt:requestEncoding value="utf-8" />
<jsp:useBean id="cartDao" class="order.CartDao" scope="session" />
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
<style>
* {
	box-sizing: border-box;
}

html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	font-family: 'Roboto', sans-serif;
}

.shopping-cart {
	width: 750px;
	height: 423px;
	margin: 80px auto;
	background: #FFFFFF;
	box-shadow: 1px 2px 3px 0px rgba(0, 0, 0, 0.10);
	border-radius: 6px;
	display: flex;
	flex-direction: column;
}

.title {
	height: 60px;
	border-bottom: 1px solid #E1E8EE;
	padding: 20px 30px;
	color: #5E6977;
	font-size: 18px;
	font-weight: 400;
}

.item {
	padding: 20px 30px;
	height: 120px;
	display: flex;
}

.item:nth-child(3) {
	border-top: 1px solid #E1E8EE;
	border-bottom: 1px solid #E1E8EE;
}

.is-active {
	animation-name: animate;
	animation-duration: .8s;
	animation-iteration-count: 1;
	animation-timing-function: steps(28);
	animation-fill-mode: forwards;
}

@
keyframes animate { 0% {
	background-position: left;
}

50%
{
background-position
:
 
right
;
 
}
100%
{
background-position
:
 
right
;
 
}
}
.image {
	margin-right: 50px;
}

Let’s add some basic style to  product name and description .
.description {
	padding-top: 10px;
	margin-right: 60px;
	width: 115px;
}

.description span {
	display: block;
	font-size: 14px;
	color: #43484D;
	font-weight: 400;
}

.description span:first-child {
	margin-bottom: 5px;
}

.description span:last-child {
	font-weight: 300;
	margin-top: 8px;
	color: #86939E;
}

.quantity {
	padding-top: 20px;
	margin-right: 60px;
}

.quantity input {
	-webkit-appearance: none;
	border: none;
	text-align: center;
	width: 32px;
	font-size: 16px;
	color: #43484D;
	font-weight: 300;
}

button[class*=btn] {
	width: 30px;
	height: 30px;
	background-color: #E1E8EE;
	border-radius: 6px;
	border: none;
	cursor: pointer;
}


button:focus, input:focus {
	outline: 0;
}

.total-price {
	width: 83px;
	padding-top: 27px;
	text-align: center;
	font-size: 16px;
	color: #43484D;
	font-weight: 300;
}
</style>
</head>
<body>
	<!-- Title -->
	<div class="title">Shopping Cart</div>
	<%
 int totalPrice=0 ;//총금액		
 hCart=cartDao.getCartList();//장바구니내용 가져오기
 
 if(hCart.size()==0){//장바구에 물건이 없을때
	%>
	선택하신 물품이 없습니다.
	<br/>
	<a href="${ctxpath}/product/productList.do">상품구매하러 가기</a>
	
	<% 
 }else{//장바구니에 물건이 있을때
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
		<input type="hidden" name="flag"> <input type="hidden"
			name="state" value="2">
			
		<!-- Product #1 -->
		<div class="item">
			<div class="image">
				<img src="${ctxpath}/imgs/<%=proBean.getImage()%>" width="50" height="70" />
			</div>
			
			<p>	<span style="color:#43484D; margin:50px;"><%=proBean.getName()%></span></p>
			
			<div class="quantity">
				<span><input type=number max="<%=proBean.getStock() %>" name=quantity value="<%=ordBean.getQuantity()%>" size=5>개</span>
			</div>

			<div class="total-price">\<%=subTotal+""%></div>
			<a href="javaScript:productDetail('<%=proBean.getCode()%>')">detail</a>
		</div>
		
			
			<div class="buttons">
				 
				<input type="button" value="수량변경" onClick="javaScript:cartUpdate(this.form)"> 
				<input type="button" value="X" onClick="javaScript:cartDelete(this.form)">
			</div>
			<hr>	
	</form>

	<% 
	 }//while end---
	 %>
	<div>
		총 금액 :<%=totalPrice%>원
	</div>
	<a href="<%=request.getContextPath()%>/order/orderPro.do">주문하기</a>

	<%
 }//else end ---
 %>
	<form name="detail" method="post"
		action="${ctxpath}/product/productDetail.do">
		<input type="hidden" name="code">
	</form>

</body>
</html>
<%
	}//else --
	
	
	}catch(Exception ex){}
%>
