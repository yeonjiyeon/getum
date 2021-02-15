   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/view/color.jspf" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글내용보기</title>
</head>
<body>
<center><h1>notice </h1></center>
<table width="500" cellpadding="3" align="center" border="1">
 <tr height="30">
<td align="center" width="125">subject</td>
<td align="center" width="375" colspan="3">${dto.subject}</td>
</tr>

<tr height="30">
<td align="center" width="125">writer</td>
<td align="center" width="125" colspan="3">${dto.writer}</td>
</tr>
 
<tr height="30">
<td align="center" width="125">count</td>
<td align="center" width="125">${dto.readcount}</td>
<td align="center" width="125">register date</td>
<td align="center" width="125">${dto.regdate}</td>
</tr>

<tr height="30">
<td align="center" width="125">content</td>
<td align="center" width="375" colspan="3">
 ${content}
</td>
</tr>

<tr height="30">
<td colspan="4" align="right">

<input type="button" value="글수정" onClick="document.location.href='${ctxpath}/notice/nupdateForm.do?num=${num}&pageNum=${pageNum}'">
<input type="button" value="글삭제" onClick="document.location.href='${ctxpath}/notice/ndeleteForm.do?num=${num}&pageNum=${pageNum}'">
<input type="button" value="list" onClick="document.location.href='${ctxpath}/notice/nlist.do?pageNum=${pageNum}'">

</td>
</tr>
</table>
</body>
</html>
