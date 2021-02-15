<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/view/color.jspf" %>

<%--modifyPro.jsp--%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
			<span class="login100-form-title p-b-51">
						modify ok!!!
			</span>
				<form>
					<input type="button" value="메인으로" class="login100-form-btn" onClick="document.location.href='${ctxpath}/member/loginForm.do'">
				</form>
				5초후에 메인으로 이동합니다.
				<meta http-equiv="Refresh" content="5;url=${ctxpath}/member/loginForm.do">
			</td>
		</tr>
	</table>
</body>
</html>