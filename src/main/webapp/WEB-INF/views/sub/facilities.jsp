<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부대시설</title>
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
					<h1>facilities</h1>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- //sub_banner -->

<!-- body -->
<section class="site-section bg-light">
	<div class="container">		
		<div class="row mb-5">
			<!-- 부대시설(미팅) 1개 시작 -->
			<div class="col-md-4">
				<div class="post-entry">
					<a href="${pageContext.request.contextPath}/sub/meeting"><img src="${pageContext.request.contextPath}/resources/images/facilities_meeting.jpg" alt="Image placeholder" class="img-fluid"></a>
					<div class="body-text">
						<div class="category">Facilities</div>
						<h3 class="mb-3"><a href="${pageContext.request.contextPath}/sub/meeting">Meeting</a></h3>
						<p class="mb-4 f_txt">
							비즈니스 미팅에 적합한 형태로, 소규모 세미나 및 연회, 가족모임 등 수월한 행사 진행이 가능합니다.
						</p>
						<p><a href="${pageContext.request.contextPath}/sub/meeting" class="btn btn-primary btn-outline-primary btn-sm">VIEW MORE</a></p>
					</div>
				</div>
			</div>
			<!-- //부대시설 1개 종료 -->
			<!-- 부대시설(웨딩) 1개 시작 -->
			<div class="col-md-4">
				<div class="post-entry">
					<a href="${pageContext.request.contextPath}/sub/wedding"><img src="${pageContext.request.contextPath}/resources/images/facilities_wedding.jpg" alt="Image placeholder" class="img-fluid"></a>
					<div class="body-text">
						<div class="category">Facilities</div>
						<h3 class="mb-3"><a href="${pageContext.request.contextPath}/sub/wedding">Wedding</a></h3>
						<p class="mb-4 f_txt">
							일생의 한 번 뿐인 웨딩을 소중한 사람들과 함께 특별한 순간,
							오랫동안 기억에 남는 결혼식으로 선사해드립니다.
						</p>
						<p><a href="${pageContext.request.contextPath}/sub/wedding" class="btn btn-primary btn-outline-primary btn-sm">VIEW MORE</a></p>
					</div>
				</div>
			</div>
			<!-- //부대시설 1개 종료 -->
			<!-- 부대시설(플라워샵) 1개 시작 -->
			<div class="col-md-4">
				<div class="post-entry">
					<a href="${pageContext.request.contextPath}/sub/flowerShop"><img src="${pageContext.request.contextPath}/resources/images/facilities_flowershop.jpg" alt="Image placeholder" class="img-fluid"></a>
					<div class="body-text">
						<div class="category">Facilities</div>
						<h3 class="mb-3"><a href="${pageContext.request.contextPath}/sub/flowerShop">Flower Shop</a></h3>
						<p class="mb-4 f_txt">
							다양한 플라워 디자인으로 고급스러운 품격을 전해드립니다.
							정성으로 골라 담은 꽃으로 이쁜 마음을 선물해 보세요.
						</p>
						<p><a href="${pageContext.request.contextPath}/sub/flowerShop" class="btn btn-primary btn-outline-primary btn-sm">VIEW MORE</a></p>
					</div>
				</div>
			</div>
			<!-- //부대시설 1개 종료 -->
			<!-- 부대시설(비즈니스) 1개 시작 -->
			<div class="col-md-4">
				<div class="post-entry">
					<a href="${pageContext.request.contextPath}/sub/business"><img src="${pageContext.request.contextPath}/resources/images/facilities_business.jpg" alt="Image placeholder" class="img-fluid"></a>
					<div class="body-text">
						<div class="category">Facilities</div>
						<h3 class="mb-3"><a href="${pageContext.request.contextPath}/sub/business">Business</a></h3>
						<p class="mb-4 f_txt">
							컴퓨터, 프린터 등 24시간 제공하고 있습니다.
							필요한 업무 시 신속하고 편리하게 이용하실 수 있습니다.
						</p>
						<p><a href="${pageContext.request.contextPath}/sub/business" class="btn btn-primary btn-outline-primary btn-sm">VIEW MORE</a></p>
					</div>
				</div>
			</div>
			<!-- //부대시설 1개 종료 -->
			<!-- 부대시설(바) 1개 시작 -->
			<div class="col-md-4">
				<div class="post-entry">
					<a href="${pageContext.request.contextPath}/sub/bar"><img src="${pageContext.request.contextPath}/resources/images/facilities_bar.jpg" alt="Image placeholder" class="img-fluid"></a>
					<div class="body-text">
						<div class="category">Facilities</div>
						<h3 class="mb-3"><a href="${pageContext.request.contextPath}/sub/bar">Bar</a></h3>
						<p class="mb-4 f_txt">
							최고의 야경을 자랑하며 다양한 주류와 음료를 맛볼 수 있는 와인 &amp; 위스키 바
						</p>
						<p><a href="${pageContext.request.contextPath}/sub/bar" class="btn btn-primary btn-outline-primary btn-sm">VIEW MORE</a></p>
					</div>
				</div>
			</div>
			<!-- //부대시설 1개 종료 -->
			<!-- 부대시설(브런치카페) 1개 시작 -->
			<div class="col-md-4">
				<div class="post-entry">
					<a href="${pageContext.request.contextPath}/sub/brunchCafe"><img src="${pageContext.request.contextPath}/resources/images/facilities_brunchCafe.jpg" alt="Image placeholder" class="img-fluid"></a>
					<div class="body-text">
						<div class="category">Facilities</div>
						<h3 class="mb-3"><a href="${pageContext.request.contextPath}/sub/brunchCafe">Brunch Cafe</a></h3>
						<p class="mb-4 f_txt">
							아름다운 해운대 해변이 한 눈에 보이는 브런치 카페 &amp; 베이커리
						</p>
						<p><a href="${pageContext.request.contextPath}/sub/brunchCafe" class="btn btn-primary btn-outline-primary btn-sm">VIEW MORE</a></p>
					</div>
				</div>
			</div>
			<!-- //부대시설 1개 종료 -->
			
		</div>
		
		<div class="row">
			<div class="col-md-12 text-center">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#">Previous</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
				</nav>
			</div>
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
		<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
		<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#f4b214"/>
	</svg>
</div>
<!-- //loader -->

</body>
</html>