<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zxx">
<head>
	<title>Tulen | Photography HTML Template</title>
	<meta charset="UTF-8">
	<meta name="description" content="Tulen Photography HTML Template"">
	<meta name="keywords" content="photo, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Stylesheets -->
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/font-awesome.min.css"/>
	<link rel="stylesheet" href="css/themify-icons.css"/>
	<link rel="stylesheet" href="css/accordion.css"/>
	<link rel="stylesheet" href="css/owl.carousel.min.css"/>

	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="css/style.css"/>


	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<body>
<jsp:include page="/module/top.jsp"/>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Offcanvas Menu Section -->
	<div class="menu-wrapper">
		<div class="menu-switch">
			<i class="ti-menu"></i>
		</div>
		<div class="menu-social-warp">
			
		</div>
	</div>
	<div class="side-menu-wrapper">
		<div class="sm-header">
			<div class="menu-close">
				<i class="ti-arrow-left"></i>
			</div>
			<a href="index.html" class="site-logo"><img src="img/logo.png" alt="">
				
			</a>
		</div>
		<nav class="main-menu">
			<ul>
				<li><a href="index.html" class="active">Home</a></li>
				<li><a href="about.html">About</a></li>
				<li><a href="gallery.html">Gallery</a></li>
				<li><a href="blog.html">Blog</a></li>
				<li><a href="contact.html">Contact</a></li>
			</ul>
		</nav>
		<div class="sm-footer">
			<div class="sm-socail">
				<a href="#"><i class="ti-facebook"></i></a>
				<a href="#"><i class="ti-twitter-alt"></i></a>
				<a href="#"><i class="ti-linkedin"></i></a>
				<a href="#"><i class="ti-instagram"></i></a>
			</div>
			<div class="copyright-text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
		</div>
	</div>
	<!-- Offcanvas Menu Section end -->
		<jsp:include page="${CONTENT}" flush="false"/>
	
	<!-- Hero Section end -->

	</div>
	<!--====== Javascripts & Jquery ======-->
	<script src="js/vendor/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/imagesloaded.pkgd.min.js"></script>
	<script src="js/isotope.pkgd.min.js"></script>
	<script src="js/jquery.nicescroll.min.js"></script>
	<script src="js/circle-progress.min.js"></script>
	<script src="js/pana-accordion.js"></script>
	<script src="js/main.js"></script>

	</body>
</html>
