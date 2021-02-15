<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/view/color.jspf"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
<script>
function openDaumPostcode(){
	new daum.Postcode({
		oncomplete:function(data){
 			document.getElementById('zipcode').value=data.zonecode;
			document.getElementById('addr').value=data.address;
 		}
	}).open();
}//openDaumPostcode()---
</script>
<script>
function checkIt(){
	var inputForm=eval("document.userInput");
	
	if(!userInput.passwd.value){
		alert("비밀번호를 입력하세요");
		userInput.passwd.focus();
		return false;
	}
	
	if(inputForm.passwd.value != inputForm.passwd2.value){
		alert("비밀번호를 동일하게 입력하세요");
		inputForm.passwd.value="";
		inputForm.passwd2.value="";
		inputForm.passwd.focus();
		return false;
	}
	
}//checkIt() end
</script>
</head>
<body>

<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form class="login100-form validate-form flex-sb flex-w" name="userInput" method="post" action="${ctxpath}/member/modifyPro.do" onSubmit="return checkIt()">
					<span class="login100-form-title p-b-51">
						member information modify
					</span>

					
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="id" id="id" value="${sessionScope.id}">						
						<span class="focus-input100"></span>				
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="password" name="passwd"  id="passwd" placeholder="Password">						
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="name"  id="name" value="${dto.name}">						
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-16">
					<c:if test="${empty dto.email}">
						<input class="input100" type="text" name="email"  id="email" placeholder="email">	
					</c:if>
					<c:if test="${!empty dto.email}">
				     	 <input class="input100" type="text" name="email" id="email" value="${dto.email}">
				     	</c:if>		
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="zipcode"  id="zipcode" value="${dto.zipcode}">	
						<input type="button" value="우편번호찾기" onClick="openDaumPostcode()">					
						<span class="focus-input100"></span>
					</div>
				  
				   <div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="addr"  id="addr" value="${addr}">
						<input class="input100" type="text" name="addr2"  id="addr2" value="${addr2}">						
						<span class="focus-input100"></span>
					</div>
					
	
					<div class="container-login100-form-btn m-t-17">
						<input type="submit" value="modify" class="login100-form-btn">
						 <input type="button" value="취소" class="login100-form-btn" onClick="document.location.href='${ctxpath}/member/loginForm.do'">
						
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	
				  
				  
				 
				  
				  
				  
				  
				 
				 
	
</body>
</html>