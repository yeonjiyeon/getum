<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/view/color.jspf"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
h1, h2, h3, h4, h5, h6 {
	 color:#43484D; 
	 margin:50px;
}

</style>
</head>
<body>
<%
if(session.getAttribute("id")!=null){
%>
	<table width="100%" align="center">
		<tr>
			<td rowspan="3" align="center">
			<h2>${sessionScope.name}님</h2>	
			 <br>
			 	<div>
				<input type="button" value="개인정보변경"  class="txt1" onClick="document.location.href='${ctxpath}/member/modify.do'">	
				</div>
				 <br>
				 <div>	
				<input type="button" value="장바구니"  class="txt1" onClick="document.location.href='${ctxpath}/order/cartList.do'">
				</div>		
				 <br>	
				 <div>						
				<input type="button" value="주문내역"  class="txt1" onClick="document.location.href='${ctxpath}/order/orderList.do'">	
				</div>							
			</td>
		</tr>		
	</table>
	<%
}else{
%>
<meta http-equiv="Refresh" content="1;url=${ctxpath}/member/loginForm.do">
<%
}
%>
</body>
</html>