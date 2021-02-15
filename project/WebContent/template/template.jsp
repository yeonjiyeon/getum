<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body, h1,h2,h3,h4,h5,h6 {font-family: "Montserrat", sans-serif}
</style>
<body>
<jsp:include page="/module/top.jsp" flush="false"/>

<div>
<jsp:include page="/module/left.jsp"/>
<!-- Hidden Sidebar (reveals when clicked on menu icon)-->
<%
if(session.getAttribute("id")==null){
%>
	<nav class="w3-sidebar w3-black w3-animate-right w3-xxlarge" style="display:none;padding-top:150px;right:0;z-index:2" id="mySidebar">
	  <a href="javascript:void(0)" onclick="closeNav()" class="w3-button w3-black w3-xxxlarge w3-display-topright" style="padding:0 12px;">
	    <i class="fa fa-remove"></i>
	  </a>
	  <div class="w3-bar-block w3-center">
	    <a href="../member/loginForm.do" class="w3-bar-item w3-button w3-text-grey w3-hover-black" onclick="closeNav()">login</a>
	    <a href="../member/inputForm.do" class="w3-bar-item w3-button w3-text-grey w3-hover-black" onclick="closeNav()">register</a>
	    <a href="#" class="w3-bar-item w3-button w3-text-grey w3-hover-black">product
	   	<ul style="list-style-type:none;">
	   	<li><a href="../product/productList.do" onclick="closeNav()">all</a></li>
	   		<li><a href="#" onclick="closeNav()">best</a></li>
	   		<li><a href="#" onclick="closeNav()">new</a></li>
	   	</ul></a>
	    <a href="../notice/nlist.do" class="w3-bar-item w3-button w3-text-grey w3-hover-black" onclick="closeNav()">notice</a>
	    <a href="#contact" class="w3-bar-item w3-button w3-text-grey w3-hover-black" onclick="closeNav()">notice</a>
	  </div>
	</nav>
<%
} else if(session.getAttribute("id")!=null){
%>
<nav class="w3-sidebar w3-black w3-animate-right w3-xxlarge" style="display:none;padding-top:150px;right:0;z-index:2" id="mySidebar">
  <a href="javascript:void(0)" onclick="closeNav()" class="w3-button w3-black w3-xxxlarge w3-display-topright" style="padding:0 12px;">
    <i class="fa fa-remove"></i>
  </a>
  <div class="w3-bar-block w3-center">
	 	<%String name=(String)session.getAttribute("name"); %> 
			<%=session.getAttribute("name") %>님<br>
    <a href="../member/logout.do" class="w3-bar-item w3-button w3-text-grey w3-hover-black" onclick="closeNav()">logout</a>
    <a href="../member/myDetail.do" class="w3-bar-item w3-button w3-text-grey w3-hover-black" onclick="closeNav()">my Information</a>
    <a href="#" class="w3-bar-item w3-button w3-text-grey w3-hover-black" onclick="closeNav()">product
   	<ul style="list-style-type:none;">
   	<li><a href="../product/productList.do">all</a></li>
   	<li><a href="#" onclick="closeNav()">best</a></li>
	<li><a href="#" onclick="closeNav()">new</a></li>
   	</ul></a>
    <a href="../notice/nlist.do" class="w3-bar-item w3-button w3-text-grey w3-hover-black" onclick="closeNav()">notice</a>
    <a href="#contact" class="w3-bar-item w3-button w3-text-grey w3-hover-black" onclick="closeNav()">notice</a>
  </div>
</nav>
<%
}

%>

<!-- Page Content -->
<!-- Menu icon to open sidebar -->
  <span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto;right:0;" onclick="openNav()"><i class="fa fa-bars"></i></span>
</div>  

  
<jsp:include page="${CONTENT}" flush="false"/>

<!-- END PAGE CONTENT -->

<script>
// Open and close sidebar
function openNav() {
  document.getElementById("mySidebar").style.width = "60%";
  document.getElementById("mySidebar").style.display = "block";
}

function closeNav() {
  document.getElementById("mySidebar").style.display = "none";
}
</script>
</body>
</html>
