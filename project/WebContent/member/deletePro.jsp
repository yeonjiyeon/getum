<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/view/color.jspf" %>

<%--deletePro.jsp--%>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
</head>

<body>
<c:if test="${check==1}">
    <c:remove var="memId" scope="session"/>
 
    <table width="270"  cellpadding="5" align="center">
    
    <tr> 
       <td height="39" align="center" class="login100-form-title p-b-51">
         <font size="+1" ><b>회원정보가 삭제되었습니다.</b></font></td>
    </tr>
    
    <tr>
      <td align="center" class="login100-form-title p-b-51"> 
        <p>안녕히 가세요.</p>
        <meta http-equiv="Refresh" content="3;url=${ctxpath}/member/loginForm.do">
      </td>
    </tr>
   </table>
</c:if>  

<c:if test="${check==0}">
  <script> 
        alert("비밀번호가 틀립니다.");
        history.go(-1);
  </script>
</c:if>
</html>
