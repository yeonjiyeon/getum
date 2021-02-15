<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/view/color.jspf" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기 폼</title>

<script  src="//code.jquery.com/jquery-3.2.1.min.js">
</script>

<script type="text/javascript" src="script.js"></script>

<script type="text/javascript">
function writeSave(){
	 //script.js		   
		if($("#writer").val()==''){
		   alert("이름을 입력 하시오 ");
		   $("#writer").focus();
		   return false;
	   }
	   if($("#subject").val()==''){
		   alert("글제목을 입력 하시오 ");
		   $("#subject").focus();
		   return false;
	   }
	   if($("#content").val()==''){
		   alert("글내용을 입력 하시오 ");
		   $("#content").focus();
		   return false;
	   }
	   if($("#passwd").val()==''){
		   alert("암호을 입력 하시오 ");
		   $("#passwd").focus();
			   return false;
		   }
	   		return true;
	   }//writeSave() end
</script>
</head>
<body>
<center><h2>글쓰기</h2></center>

<form method="post" name="nwriteform" action="${ctxpath}/notice/nwritePro.do" onClick="return writeSave()">

 <input type="hidden" name="num" value="${num}"/>
 <input type="hidden" name="ref" value="${ref}"/>
 <input type="hidden" name="re_step" value="${re_step}"/>
 <input type="hidden" name="re_level" value="${re_level}"/>

 <table width="400" border="1" align="center">
 <tr>
  <td align="right" colspan="2">
    <a href="${ctxpath}/notice/nlist.do">글목록</a>
  </td>
 </tr>
 
 <tr>
  <td width="70">이름</td>
  <td width="330">
   <input type="text" id="writer" name="writer" size="12">
  </td>
 </tr>

<tr>
<td>제목</td>
<td>
 <c:if test="${num==0}">
   <input type="text" id="subject" name="subject" size="40">
 </c:if>

 <c:if test="${num!=0}">
  <input type="text" id="subject" name="subject" size="40" value="[답변]">
 </c:if>
</td>
</tr>

<tr>
<td>글내용</td>
<td>
<textarea id="content" name="content" rows="10" cols="40"></textarea>
</td>
</tr>

<tr>
<td>암호</td>
<td>
<input type="password" id="passwd" name="passwd" size="8">
</td>
</tr>

<tr>
<td colspan="2" align="center">
 <input type="submit" value="글쓰기">
 <input type="reset" value="다시작성">
 <input type="button" value="목록보기" 
 onclick="window.location='${ctxpath}/notice/nlist.do'">
 
</td>
</tr>


 
 </table>

</form>
</body>
</html>
