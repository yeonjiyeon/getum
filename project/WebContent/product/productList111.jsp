<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ include file="/view/color.jspf"%>
<%@ page import="java.util.*"%>
<%@ page import="product.*"%>    
    
<%--ProductList.jsp--%>
<fmt:requestEncoding value="utf-8"/>


<html>
<head>
<script src="//code.jquery.com/jquery-3.2.1.min.js"> </script>
<script type="text/javascript" src="script.js"></script>
</head>
<body topmargin="20">
<center><b>all products</b></center>
<c:if test="${empty productList}">
등록된 상품이 없습니다
</c:if>

<table width=80% cellpadding=3 align=center>
 <c:if test="${!empty productList}">
 <tr>
 <td>
   <table>
     <tr>
       <c:set var="n" value="0"/>
       
       <c:forEach var="dto" items="${productList}">
         <c:set var="n" value="${n+1}"/>
          
     
         
		  <td colspan=2 align=center> 
		 
		  <br/>
		 
		 ${dto.name} 
		   <br/>
		 
         
         
		   
		 
		     <c:if test="${dto.stock>0}">
			    <a href="javascript:productDetail('${dto.code}')">
		        <img src="${ctxpath}/imgs/${dto.image}" width="150" height="150">
		 	    </a>
		     </c:if>		
		 	 <c:if test="${dto.stock==0}">
		 	  <script>
		      alert("재고없음");
		      </script>
		 	 </c:if>
		 
		 
		 
	  <br>
	    상품코드: ${dto.code}
	 
		  <br>
	  
	    가격:${dto.price}
	   <br>
	
		   
		   물량,stock :
		  
			   <c:if test="${dto.stock>0}">
			   		${dto.stock}
			   </c:if>
			   
		       <c:if test="${dto.stock==0}">
		               품절
		       </c:if> 
		 
		  </td> 
	 
	      <c:if test="${n%3==0}">
	           </tr><tr>
	      </c:if>  
	     
       
         
       </c:forEach>
       
     </tr>
   </table>
 </td>
 </tr>
 </c:if>
 
</table>


<form name="detail" method="post" action="${ctxpath}/product/productDetail.do" >
<input type="hidden" name="code">
</form>




</body>
</html>