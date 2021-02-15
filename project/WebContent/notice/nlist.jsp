<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@ include file="/view/color.jspf"%>
<%--list.jsp --%>

<fmt:requestEncoding value="utf-8"/>

<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<center><b>notice:${count}</b></center>

<table width="70%" align="center">
	<tr>
		<td align="right">
			<a href="${ctxpath}/notice/nwriteForm.do">글쓰기</a>
		</td>
	</tr>
</table>
<c:if test="${count==0}">
게시판에 저장된 글이 없습니다
</c:if>

<c:if test="${count>0}">
	<table border="1" width="70%" align="center">
		<tr height="30">
		<td>number</td>
		<td>subject</td>
		<td>writer</td>
		<td>register date</td>
		<td>count</td>
		
		</tr>
		
		<c:forEach var="dto" items="${articleList}">
			<tr>
				<td>
					<c:out value="${number}"/>
					<c:set var="number" value="${number-1}"/>
				</td>
				
				<td>
					<c:if test="${dto.re_level>0}">
						<img src="../imgs/level.gif" width="${5*dto.re_level}" height="16"/>
						<img src="../imgs/re.gif"/>
					</c:if>
					
					<c:if test="${dto.re_level==0}">
						<img src="../imgs/level.gif" width="${5*dto.re_level}" height="16"/>
					</c:if>
					
					<a href="${ctxpath}/notice/ncontent.do?num=${dto.num}&pageNum=${currentPage}">${dto.subject}</a>
					<c:if test="${dto.readcount>=20}">
						<img src="../imgs/hot.gif" height="16" border="0"/>
					</c:if>
				</td>
				
				<td>
					${dto.writer}
				</td>
				
				<td>
				<fmt:formatDate value="${dto.regdate}" type="date"/>
				</td>
				
				<td>
				${dto.readcount}
				</td>
				
				
			</tr>
		</c:forEach>
	</table>
</c:if>
<%--블럭처리 --%>
<table width="70%" align="center">
	<tr>
		<td align="center">
			<c:if test="${count>0}">
				<fmt:parseNumber var="result" value="${currentPage/10}" integerOnly="true"/>
				<c:set var="startPage" value="${result*10+1}"/>
				<c:set var="endPage" value="${startPage+pageBlock-1}"/>
			</c:if>
			
			<c:if test="${endPage>pageCount}">
				<c:set var="endPage" value="${pageCount}"/>
			</c:if>
			
			<%--이전블럭 --%>
			<c:if test="${startPage>10}">
				<a href="${ctxpath}/notice/nlist.do?pageNum=${startPage-10}">[이전블럭]</a>
			</c:if>
			
			<%--페이지처리 --%>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="${ctxpath}/notice/nlist.do?pageNum=${i}">[${i}]</a>

			</c:forEach>
			
			<%--다음블럭 --%>
			<c:if test="${endPage<pageCount}">
				<a href="${ctxpath}/notice/nlist.do?pageNum=${startPage+10}">[다음블럭]</a>
			</c:if>
		</td>
	</tr>

</table>

</body>
</html>