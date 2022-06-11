<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LuxuryHotel a Hotel Template</title>
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

<script type="text/javascript">



</script>
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
					<h1>Login</h1>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- //sub_banner -->

<!-- body -->
<div class="content">
	<div class="member_wrapper">
		<h1 class="member_page_title">로그인</h1>
		<form id="login-form" action="${pageContext.request.contextPath}/member/loginPro" method="post" class="login_form">
			<p>
				<input type="text" id="id" name="member_id" placeholder="id" required><i class="validation"><span></span><span></span></i>
			</p>
			<p>
				<input type="password" id="pass" name="member_pass" placeholder="password" required><i class="validation"><span></span><span></span></i>
			</p>
			<p>
				<input type="submit" id="login" value="Login">
			</p>
			<input type="button" id="join" value="Join" onclick="location.href='${pageContext.request.contextPath}/member/insert'"><br>
			<span class="login_find_txt">
				<a href="${pageContext.request.contextPath}/member/findId">아이디찾기 |</a>
				<a href="${pageContext.request.contextPath}/member/findPass"> 비밀번호찾기</a>
			</span>
		</form>
	</div>
</div>

<!-- <section id="login-form-section"> -->
<!-- 	<div id="login-form-wrap"> -->
<!-- 		<form id="login-form"> -->
<!-- 			<p> -->
<!-- 				<input type="text" id="id" name="id" placeholder="id" required><i class="validation"><span></span><span></span></i> -->
<!-- 			</p> -->
<!-- 			<p> -->
<!-- 				<input type="password" id="pass" name="pass" placeholder="password" required><i class="validation"><span></span><span></span></i> -->
<!-- 			</p> -->
<!-- 			<p> -->
<!-- 				<input type="submit" id="login" value="Login"> -->
<!-- 			</p> -->
<!-- 			<input type="button" id="join" value="Join"><br> -->
<!-- 			<span> -->
<!-- 				<a href="#">아이디찾기 |</a> -->
<!-- 				<a href="#"> 비밀번호찾기</a> -->
<!-- 			</span> -->
<!-- 		</form> -->
<!-- 	</div>login-form-wrap -->
<!-- </section> -->
<!-- //body -->

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