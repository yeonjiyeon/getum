<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/view/color.jspf" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updateForm.jsp</title>
<script  src="//code.jquery.com/jquery-3.2.1.min.js">
</script>

<script type="text/javascript">
function writeSave(){
	 //script.js		   
		if($("#writer").val()==''){
		   alert("이름을 입력 하시요 ");
		   $("#writer").focus();
		   return false;
	   }
	   if($("#subject").val()==''){
		   alert("글제목을 입력 하시요 ");
		   $("#subject").focus();
		   return false;
	   }
	   if($("#content").val()==''){
		   alert("글내용을 입력 하시요 ");
		   $("#content").focus();
		   return false;
	   }
	   if($("#passwd").val()==''){
		   alert("암호을 입력 하시요 ");
		   $("#passwd").focus();
			   return false;
		   }
	   return true;
	   }//writeSave() end
		 
</script> 
</head>
<body>
<center><h2>글수정</h2></center>
<form name="nwriteform" method="post" action="${ctxpath}/notice/nupdatePro.do?pageNum=${pageNum}" onClick="return writeSave()">
	<table>
		<tr>
			<td>이름</td>
			<td>
			<input type="text" id="writer" name="writer" size="12" value="${dto.writer}">
			<input type="hidden" name="num" value="${dto.num}">
			</td>
		</tr>
		
		<tr>
			<td>제목</td>
			<td>
			<input type="text" id="subject" name="subject" size="40" value="${dto.subject}">
			</td>
		</tr>	
		
		<tr>
			<td>글내용</td>
			<td>
			<textarea id="content" name="content" rows="10" cols="40">${dto.content}</textarea>
			</td>
		</tr>	
		
		<tr>
			<td>암호</td>
			<td>
			<input type="password" id="passwd "name="passwd" size="8">
			</td>
		</tr>	
		
		<tr>
			<td colspan="2" align="center">
			<input type="submit" value="글수정">
			<input type="reset" value="다시작성">
			<input type="button" value="목록보기" 
			onclick="document.location.href='${ctxpath}/notice/nlist.do?pageNum=${pageNum}'">
			</td>
		</tr>
		
	</table>
</form>
</body>
</html>