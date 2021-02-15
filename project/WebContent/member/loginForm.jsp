<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/view/color.jspf"%>

<html>
<head>

	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	
	
	<style>
	  .aa {
      width:240px;
      height:30px;
      color:red;
      font-size:15px;
      border:none;
      float:right;
    }
    
	</style>
	<script>
	function check(){
		if(document.inForm.id.value==""){
			document.getElementById("id2").style.display="inline";
			return false;
		}
		if(document.inForm.passwd.value==""){
			document.getElementById("passwd2").style.display="inline";
			return false;
		}
		return true;
	}
</script>
</head>

<body>
<c:if test="${empty sessionScope.id}"><%--로그인 안된 상태 --%>
<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form class="login100-form validate-form flex-sb flex-w" name="inForm" method="post" action="${ctxpath}/member/loginPro.do" onSubmit="return check()">
					<span class="login100-form-title p-b-51">
						Login
					</span>

					
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="id" id="id" placeholder="UserID">						
						<span class="focus-input100"></span>						
					</div>
					<div id="id2" style="display:none;" class="aa">Username is required</div>
					
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="password" name="passwd" placeholder="Password">						
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="flex-sb-m w-full p-t-3 p-b-24">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="ckb1">
								Remember me
							</label>
						</div>

						<div>
							<a href="#" class="txt1">
								Forgot?
							</a>
							<input type="button" value="Register" class="txt1" onClick="document.location.href='${ctxpath}/member/inputForm.do'">
						</div>
					</div>

					<div class="container-login100-form-btn m-t-17">
						<input type="submit" value="login" class="login100-form-btn">
						
					</div>
				</form>
			</div>
		</div>
	</div>
</c:if>


<%--로그인 상태 --%>
<c:if test="${!empty sessionScope.id}">
	<table width="100%" align="center">
	<tr>
			<td rowspan="3" align="center">
			<meta http-equiv="Refresh" content="0;url=${ctxpath}/index/index.do">
			${sessionScope.name}님 <br>
			
			<form method="post" action="${ctxpath}/member/logout.jsp">
			<input type="button" value="회원정보변경"  class="txt1" onClick="document.location.href='${ctxpath}/member/modify.do'">
				<input type="submit" value="로그아웃"  class="txt1" >
				
			</form>
			</td>
		</tr>
		
	</table>
</c:if>
</body>
</html>