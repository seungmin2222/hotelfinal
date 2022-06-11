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

<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/animate.css">
<link rel="stylesheet" href="../css/owl.carousel.min.css">

<link rel="stylesheet" href="../fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="../fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/magnific-popup.css">

<!-- Style css -->
<link rel="stylesheet" href="../css/style.css">

<!-- script -->
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/jquery-migrate-3.0.0.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/owl.carousel.min.js"></script>
<script src="../js/jquery.waypoints.min.js"></script>
<script src="../js/jquery.stellar.min.js"></script>

<script src="../js/jquery.magnific-popup.min.js"></script>
<script src="../js/magnific-popup-options.js"></script>

<script src="../js/main.js"></script>
</head>
<body>
<!-- header -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- //header -->

<!-- sub_banner -->
<section class="site-hero overlay" data-stellar-background-ratio="0.5" style="background-image: url(../images/sub_banner.jpg);">
	<div class="container">
		<div class="row align-items-center site-hero-inner justify-content-center">
			<div class="col-md-12 text-center">
				<div class="mb-5 element-animate">
					<h1>회원탈퇴</h1>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- //sub_banner -->


		
<!-- body -->
<div class="content">
	<!-- left menu -->
		<div class="left_menu">
			<div class="left_menu_myName">
				아이티윌님
			</div>
			<ul class="left_menu_list">
				<li class="left_m_l_li"><a href="<%=request.getContextPath() %>/member/myReservation.jsp">나의예약 현황</a></li>
				<li class="left_m_l_li"><a href="<%=request.getContextPath() %>/member/myInfo.jsp">회원정보 수정</a></li>
				<li class="left_m_l_li"><a href="<%=request.getContextPath() %>/member/withdrawal.jsp">회원탈퇴</a></li>
			</ul>
		</div>
	<!-- //left menu -->
	<div class="member_wrapper">
		<!-- 여기서 작업하시면 됩니다. -->
		여기서 작업하시면 됩니다.
		
	</div>
</div>
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