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
					<h1>Complete</h1>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- //sub_banner -->

<!-- body -->
<div class="content">
	<div class="sub_wrapper">
		<div class="complete_form">
			<h1>예약완료</h1>
			<p>
				${sessionScope.member_id} 님의 예약이 완료되었습니다.
			</p>
			<div class="complete_table">
				<div class="com_table_box1">
					<div class="c_t_b_inner">
						<div class="c_t_b_i_title">
							예약번호
							
						</div>
						<div class="c_t_b_i_txt">
							${sessionScope.code}
						</div>
					</div>
				</div>
				<div class="com_table_box2">
					<div class="c_t_b_inner">
						<div class="c_t_b_i_title">
							체크인
						</div>
						<div class="c_t_b_i_txt">
							${sessionScope.book_checkin}
						</div>
					</div>
					<div class="c_t_b_inner">
						<div class="c_t_b_i_title">
							체크아웃
						</div>
						<div class="c_t_b_i_txt">
							${sessionScope.book_checkout}
						</div>
					</div> 
					<div class="c_t_b_inner">
						<div class="c_t_b_i_title">
							객실타입
						</div>
						<div class="c_t_b_i_txt">
							${sessionScope.book_room_name}
						</div>
					</div>
				</div>
				<div class="com_table_box1">
					<div class="c_t_b_inner">
						<div class="c_t_b_i_title">
							총 금액
						</div>
						<div class="c_t_b_i_txt">
							${sessionScope.totalPrice}
						</div>
					</div>
<!-- 					<div class="c_t_b_inner"> -->
<!-- 						<div class="c_t_b_i_title"> -->
<!-- 							결제방법 -->
<!-- 						</div> -->
<!-- 						<div class="c_t_b_i_txt"> -->
<%-- 							${sessionScope.pay} --%>
<!-- 						</div> -->
<!-- 					</div> -->
				</div>
			</div>
			<input class="complete_btn" type="button" value="예약내역 확인" onclick="location.href='${pageContext.request.contextPath}/member/myReservation'">
		</div>
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