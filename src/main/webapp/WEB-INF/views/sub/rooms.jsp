<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700,900|Rubik:300,400,700"
	rel="stylesheet">

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
	<section class="site-hero overlay" data-stellar-background-ratio="0.5"
		style="background-image: url(${pageContext.request.contextPath}/resources/images/sub_banner.jpg);">
		<div class="container">
			<div
				class="row align-items-center site-hero-inner justify-content-center">
				<div class="col-md-12 text-center">
					<div class="mb-5 element-animate">
						<h1>Rooms</h1>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- //sub_banner -->

	<!-- body -->
	<section class="site-section">
		<div class="container">
			<div class="row">
				<!-- 객실 box 시작 -->
				<c:forEach var="roomDTO" items="${roomList }">
					<div class="col-md-4 mb-4">
						<div class="media d-block room mb-0">
							<figure>
								<img src="${pageContext.request.contextPath}/resources/upload/${roomDTO.room_file}" alt="Generic placeholder image"	class="img-fluid">
								<div class="overlap-text">
									<span>${roomDTO.room_name }</span>
								</div>
							</figure>
							<div class="media-body">
								<h3 class="mt-0">
									<a href="${pageContext.request.contextPath}/sub/roomDetail?room_idx=${roomDTO.room_idx }">
										${roomDTO.room_name }
									</a>
								</h3>
								<ul class="room-specs">
									<li>
										<span class="ion-ios-people-outline"></span>
										${roomDTO.room_guest }명 명
									</li>
									<li>
										<span class="ion-ios-crop"></span>
										${roomDTO.room_size } m <sup>2</sup>
									</li>
								</ul>
								<p>
									${roomDTO.room_infotext }
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- //객실 box 종료 -->
				
				
				<!-- 객실 box 시작 -->
<!-- 				<div class="col-md-4 mb-4"> -->
<!-- 					<div class="media d-block room mb-0"> -->
<!-- 						<figure> -->
<%-- 							<img src="${pageContext.request.contextPath}/resources/images/room_deluxeDouble.jpg" alt="Generic placeholder image"	class="img-fluid"> --%>
<!-- 							<div class="overlap-text"> -->
<!-- 								<span>Deluxe Double</span> -->
<!-- 							</div> -->
<!-- 						</figure> -->
<!-- 						<div class="media-body"> -->
<!-- 							<h3 class="mt-0"> -->
<%-- 								<a href="${pageContext.request.contextPath}/sub/roomDetail">Deluxe Double</a> --%>
<!-- 							</h3> -->
<!-- 							<ul class="room-specs"> -->
<!-- 								<li> -->
<!-- 									<span class="ion-ios-people-outline"></span> -->
<!-- 									2 명 -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<span class="ion-ios-crop"></span> -->
<!-- 									22 m <sup>2</sup> -->
<!-- 								</li> -->
<!-- 							</ul> -->
<!-- 							<p> -->
<!-- 								바다가 보이는 테라스에 모던한 디자인과 따뜻함이<br> -->
<!-- 								공존하는 인테리어 오륙도와 광안대교를 넘나드는<br> -->
<!-- 								아이티윌호텔만의 해안선 광경은 다른 어느곳에서도<br> -->
<!-- 								찾을 수 없는 감동을 드립니다. -->
<!-- 							</p> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<!-- //객실 box 종료 -->
				
				
			</div>
		</div>
	</section>
	<!-- //body -->

	<!-- footer -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	<!-- //footer -->

	<!-- loader -->
	<div id="loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
		<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
		<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#f4b214" />
	</svg>
	</div>
	<!-- //loader -->

</body>
</html>