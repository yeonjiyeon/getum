<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="order.*"%>
<%@ page import="product.*"%>
<%@ include file="/view/color.jspf"%>
<%--OrderList.jsp--%>

<%--dao 객체생성--%>
<jsp:useBean id="orderDao" class="order.OrderDao"/>
<%
product.ProductDAO proDao=ProductDAO.getInstance();//dao 객체얻기
String id="";
%>

<%
if(session.getAttribute("id") == null) {
	//로그인 상태가 아니면
	response.sendRedirect("../member/loginForm.do");
}else{
	//로그인 상태이면
	id=(String)session.getAttribute("id");
}//else 
%>
<html>
<head>
<script  src="//code.jquery.com/jquery-3.2.1.min.js">
</script>
 <script type="text/javascript" src="script.js"></script>
</head>

<body topmargin="20">
 <table width="80%" align="center">
 
  <tr>
    <td align=center colspan=5>
    <br>
    <h3><%=id%>님의 구매목록</h3>
    </td>
  </tr>
 
 	<tr>
 	 <td align="center">
 	   <table width="95%" align="center" > 
 	   
 	   <tr>
      <td align="center">주문번호</td>
      <td align="center">제품</td>
      <td align="center">주문수량</td>
      <td align="center">주문날짜</td>
      <td align="center">주문상태</td>
     </tr>
     <%
     Vector vec=orderDao.getOrder(id);//OrderMgr메서드 호출

     if(vec.size()==0){//구매목록이 없으면
     %>
    <tr> 
    <td align="center" colspan="5">주문하신 물품이 없습니다.</td>
    </tr>
     <%
     }else{//구매목록이 있으면
    	 for(int i=0;i<vec.size();i++){
    		 OrderDto orddto=(OrderDto)vec.get(i);
    		 
    		 String code=request.getParameter("code");
    		 int pro_no=orddto.getPro_no();
    		 ProductDto product=proDao.getProduct(code,pro_no); 
    		 %>
    		 <tr>
    		 <!-- 주문번호 -->
		     <td align="center"><%=orddto.getOrdno()%></td>
		
		    <!--상품명 클릭하면 , 상세보기 -->
 		    <td align="center">
 		    <a href="javascript:productDetail('<%=product.getCode()%>')">
            <%=product.getName()%>
        </a>
        </td>
		
		 
		     <!--  수량 -->
		     <td align="center"><%=orddto.getQuantity()%></td>
		
		     <!-- 주문 날짜  -->
		     <td align="center"><%=orddto.getOrddate()%></td>
	
	   <!-- 상태 -->
		<td align="center">
		<%
		switch(Integer.parseInt(orddto.getState())){
		 case 1:out.println("접수중");break;
		 case 2:out.println("접수");break;
		 case 3:out.println("입금확인");break;
		 case 4:out.println("배송준비");break;
		 case 5:out.println("배송중");break;
		 default:out.println("배송확인"); 
		}//switch end
		%>
		</td>
		
    		 </tr>
    		 <%
    	 }//for end
     }//else ---
     %>
 	  </table>
 	 
 	 </td>
 	</tr>
 	
 </table>


<form name="detail" method="post" action="../product/productDetail.jsp" >
	<input type="hidden" name="code">
</form>

</body>
</html>
