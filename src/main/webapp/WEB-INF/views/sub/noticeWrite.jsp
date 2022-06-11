<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700,900|Rubik:300,400,700" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">

<!-- Style css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

<!-- script -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/magnific-popup-options.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</head>
<body>
<!-- header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- //header -->

<!-- sub_banner -->
<section class="site-hero overlay" data-stellar-background-ratio="0.5" style="background-image: url(${pageContext.request.contextPath}/resources/images/sub_banner.jpg);">
	<div class="container">
		<div class="row align-items-center site-hero-inner justify-content-center">
			<div class="col-md-12 text-center">
				<div class="mb-5 element-animate">
					<h1>Notice</h1>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- //sub_banner -->


<!-- body -->
	<h2 style="color: #9F8562; font-size: 40px; text-align: center; margin: 40px 0px 60px 0px;">Notice Write</h2>
	<div class="content">
	<div class="writeForm" style="width: 1000px; height:650px; margin: auto;" >
		<form action="${pageContext.request.contextPath}/sub/noticeWritePro" enctype="multipart/form-data" style="text-align: center; margin: 2px;" method="post">
			<table>
				<tr style="margin: auto;">
					<td></td>
					<td><input type="text" name="notice_subject" placeholder="제목" style="width: 1000px; height: 40px; margin-bottom: 20px; border: 1px solid #9F8562;">
					</tr>
				<tr>
					<td></td>
					<td><textarea name="notice_content" placeholder="내용" rows="15" cols="120" style="resize: both; border: 1px solid #9F8562;"></textarea></td>
				</tr>
				<tr style="margin: auto; text-align: center;">
					<td></td>
					<td>파일첨부 <input type="file" name="notice_file" /></td>
				</tr>
			</table>
			<input type="submit" value="write" class="btn btn-primary btn-outline-primary btn-sm" >
			<input type="button" value="list" class="btn btn-primary btn-outline-primary btn-sm" onclick="location.href='${pageContext.request.contextPath}/sub/notice'">
		</form>
		</div>
	</div>
	<!-- //body      -->

<!-- footer -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- //footer -->

<!-- loader -->
<div id="loader" class="show fullscreen">
	<svg class="circular" width="48px" height="48px">
		<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
		<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#f4b214"/>
	</svg>
</div>
<!-- //loader -->
</body>
</html>