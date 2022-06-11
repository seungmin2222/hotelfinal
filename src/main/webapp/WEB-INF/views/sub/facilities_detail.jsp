<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부대시설 상세보기</title>
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


<style type="text/css">
    
    
/*  직접만든거 시작*/
	li { font:18px; #dcdcdc; color:gray; vertical-align:top; margin:10px;}
	span { font-size: 15px; vertical-align:top; line-height: 300%; }
    th { width:300px; height:200px;  font-size: 25px; font-family: 'Nanum Gothic', sans-serif; vertical-align:top; color: black; }
	td { font-size: 18px; font-family: 'Nanum Gothic', sans-serif; text-align: left; vertical-align:middle;}
    tr {  border-top: 1px solid #dcdcdc;}
	ul { font-family: 'Nanum Gothic', sans-serif; color:black; font-size:16px; line-height: 200%;  vertical-align:top;}
    #detail { width: 1500px; height:auto; margin: 0px auto;}
    #d_info { width: 1500px; height:auto; margin: auto; font-size: 20px; color: black; font-family: 'Nanum Gothic', sans-serif; background-color:;
    			vertical-align: middle; text-align: left;  }
    #d_img { width: 1500px; height:800px; margin: 0px auto; background-size: cover;}
	#noborder { width: 1050px; ; border-top: none; font-size: 18px; color: gray; }
/*  직접만든거 끝 */   
    </style>
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
					<h1>부대시설이름 디비넣기</h1>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- //sub_banner -->

<!-- body -->
<div class="content">
	<div class="sub_wrapper">
		<div class="sub_rf_detail" >
			<div class="sub_rf_main_img">
				<img alt="room_image" src="../images/facilities_bar.jpg">
			</div>
			<h2>ROOM FEATURE</h2>
			<div class="sub_rf_info">
				<dl class="sub_rf_dl">
					<dt>기본정보</dt>
					<dd>
						<span>· 수용인원</span> 
						100명
					</dd>
					<dd>
						<span>· 크기 </span>
						230m<sup>2</sup>
					</dd>
					<dd>
						<span>· 위치 </span>
						1F
					</dd>
					<dd>
						<span>· 전화 </span>
						051-123-1234
					</dd>
				</dl>
				<dl class="sub_rf_i_dl">
					<dt>
						추가정보
					</dt>
					<dd>
						한 층에 독립적인 공간으로 사용할 수 있으며, 하우스 웨딩, 파티 등 다양한 행사를 기획한 의도대로 연출 할 수 있습니다.
					</dd>
					<dd>
						행사와 식사가 동시에 제공되어 복잡한 동선 문제를 해결할 수 있으며, 최첨단 조명 음향 시스템, 스크린 등 완비되어 있어 보다 나은 행사를 성공적으로 누릴 수 있습니다.
					</dd>
				</dl>
			</div>
		</div>
		<div class="sun_btn"><a href="<%=request.getContextPath() %>/sub/facilities.jsp">LIST</a></div>
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