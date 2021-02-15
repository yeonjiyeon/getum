<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
	<table width="100%" height="900" border="0">
		<tr height="20%">
			<td colspan="2" align="center">
				<jsp:include page="/module/top.jsp" flush="false"/>
			</td>
		</tr>
		
		<tr>
			<td width="10%" valign="top" align="right">
				<jsp:include page="/module/left.jsp"/>
			</td>
			
			<td width="80%" valign="top">
				<jsp:include page="${CONTENT}" flush="false"/>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" height="10%">
				<jsp:include page="/module/bottom.jsp" flush="false"/>
			</td>
		</tr>
	</table>
</body>
</html>