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
					<h1>My<br>Reservation</h1>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- //sub_banner -->

<!-- left menu -->
<div class="left_menu">
	<div class="left_menu_myName">
		${sessionScope.member_id } 님
	</div>
	<div class="left_menu_myGrade">
		<p>나의등급</p>
		<p>${memberDTO.member_grade }</p>
	</div>
	<ul class="left_menu_list">
		<li class="left_m_l_li"><a href="${pageContext.request.contextPath}/member/myReservation">나의예약 현황</a></li>
		<li class="left_m_l_li"><a href="${pageContext.request.contextPath}/member/update">회원정보 수정</a></li>
		<li class="left_m_l_li"><a href="${pageContext.request.contextPath}/member/delete">회원탈퇴</a></li>
	</ul>
</div>
<!-- //left menu -->

<!-- body -->
<div class="content">
	<div class="member_wrapper">
		<h1 class="member_page_title">예약확인서</h1>
		<form action="${pageContext.request.contextPath}/member/myReservationCancle" class="my_reservDetailForm" method="post">
			<div class="my_reservDetailForm_Box1">
				<div class="m_reservDetailBox_top">
					<dl>
						<dt>예약번호</dt>
						<dd>${code}</dd>
					</dl>
					<span class="r_complete_spanbox">예약완료</span>
				</div>
				<div class="m_reservDetailBox_bottom">
					<dl>
						<dt>체크인</dt>
						<dd>${checkin}</dd>
					</dl>
					<dl>
						<dt>체크아웃</dt>
						<dd>${checkout}</dd>
					</dl>
					<dl>
						<dt>객실명</dt>
						<dd>${roomName}</dd>
					</dl>
					<dl>
						<dt>객실수</dt>
						<dd>${rooms} 개</dd>
					</dl>
					<dl>
						<dt>투숙인원</dt>
						<dd>성인 ${adult}명, 아동 ${children}명</dd>
					</dl>
					<dl>
						<dt>추가옵션</dt>
						<dd>베드추가 ${bed}개, 성인조식 ${breakfastAdult}명, 아동조식 ${breakfastChildren}명</dd>
					</dl>
					<dl>
						<dt>총 결제금액</dt>
						<dd>${price}원</dd>
					</dl>
				</div>
			</div>
			<div class="my_reservDetailForm_Box2">
				<h3>예약자 정보</h3>
				<div class="my_reservInfoBox">
					<div class="my_reserv_info">
						<span>이름</span>
						<input type="text" name="member_name" class="" value="${memberDTO.member_name }" required readonly="readonly" placeholder="">
					</div>
					<div class="my_reserv_info">
						<span>휴대폰 번호</span>
						<input type="text" name="member_phone" class="" value="${memberDTO.member_phone }" required readonly="readonly" placeholder="">
					</div>
				</div>
			</div>
			<div class="my_reservDetailForm_Box3">
				<input type="submit" value="예약취소" class="my_reserv_cancleBtn">
				<input type="button" value="목록으로" class="my_reserv_listBtn" onclick="location.href='${pageContext.request.contextPath}/member/myReservation'">
			</div>
		</form>
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