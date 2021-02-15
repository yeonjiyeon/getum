<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/view/color.jspf" %>

<%--deleteForm.jsp--%>
<html>
<head>
 	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	
   <script language="javascript">
        function begin(){
          document.myform.passwd.focus();
        }
        
        function checkIt(){
          if(!document.myform.passwd.value){
            alert("비밀번호를 입력하지 않으셨습니다.");
            document.myform.passwd.focus();
            return false;
          }
        }   
  </script>
</head>
<body onload="begin()">
<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100 p-t-50 p-b-90">
		<form name="myform" action="${ctxpath}/member/deletePro.do" method="post" onSubmit="return checkIt()">
			<span class="login100-form-title p-b-51">
						<font size="+1" ><b></b></font>
			</span>
  
        <div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="password" name="passwd" placeholder="Password">	
						<input type="hidden" name="id" value="${sessionScope.id}">					
						<span class="focus-input100"></span>
					</div>    
    
    	<div class="container-login100-form-btn m-t-17">
						<input type="submit" value="quit member" class="login100-form-btn">
						<input type="button" value="cancel" class="login100-form-btn" onclick="document.location.href='${ctxpath}/member/loginForm.do'">					
		</div>    
		</form>
			</div>
		</div>
	</div>
</body>
</html>
