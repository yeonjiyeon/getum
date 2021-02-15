<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/view/color.jspf"%>

<html>
<head>

<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script src="//code.jquery.com/jquery-3.2.1.min.js">
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
function openDaumPostcode(){
       //alert("A")
       new daum.Postcode({
              oncomplete:function(data){
                     document.getElementById('zipcode').value=data.zonecode;
                     document.getElementById('addr').value=data.address;

              }
       }).open();
}//openDaumPostcode()---
</script>

<script>
function check(){
	if($('#id').val()==''){
		alert("id를 입력하시오");
		$('#id').focus();
		return false;
	}
	
	if($('#passwd').val()==''){
		alert("passwd를 입력하시오");
		$('#passwd').focus();
		return false;
	}
	
	if($('#passwd2').val()==''){
		alert("passwd2를 입력하시오");
		$('#passwd2').focus();
		return false;
	}
	
	if($('#passwd').val()!=$('#passwd2').val()){
		alert("passwd,passwd2이 일치하지 않습니다");
        $('#passwd').focus();
        return false;
	}
	
	if($('#name').val()==''){
		alert("name를 입력하시요");
        $('#name').focus();
        return false;
	}
	return true;
}//check() end
//---------------------
// ajax이용하여 id사용 여부 체크 
//---------------------
function confirmIDCheck(){
	if($('#id').val()==''){
		alert("id를 입력하시오");
		$('#id').focus();
	}else{
		$.ajax({
			type:"POST",
			url:"confirmId.jsp",
			data:"id="+$('#id').val(),
			dataType:'JSON',
			success:function(data){
				if(data.check==1){
					alert("사용중인 id");
					$('#id').val("").focus;
				}else{
					alert("사용 가능한 id");
					$('#passwd').focus();
				}//else
			}//success
		});
	}//else
}//confirmIDCheck() end
</script>

</head>
<body>
<div>
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form  class="login100-form validate-form flex-sb flex-w" name="userForm" method="post" action="${ctxpath}/member/inputPro.do" onSubmit="return check()">
					<span class="login100-form-title p-b-51">
						register
					</span>

					
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="id" id="id" placeholder="UserID">	
						<input type="button" value="ID Confirm Check" onClick="confirmIDCheck()" class="txt1">	
						<span class="focus-input100"></span>								
					</div>
					
					<br>
					
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="password" name="passwd"  id="passwd" placeholder="Password">						
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="password" name="passwd2"  id="passwd2" placeholder="Password check">						
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="name"  id="name" placeholder="UserName">						
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="email"  id="email" placeholder="email">	
						<span class="focus-input100"></span>
					</div>
					
				
				
					
					
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="zipcode"  id="zipcode" placeholder="zipcode">	
						 <input type="button" value="search postcode" onClick="openDaumPostcode()" class="txt1">					
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="addr"  id="addr" readonly><br/>					
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="addr2"  id="addr2" placeholder="addr">						
						<span class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn m-t-17">
						<input type="submit" value="Register" class="login100-form-btn">
						
					</div>
				</form>
			</div>
		</div>
</div>

			
</body>
</html>

