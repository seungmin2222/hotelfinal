<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실 상세보기</title>
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
<script>
 function openCloseToc() {
   if(document.getElementById('toc-content').style.display === 'block') {
     document.getElementById('toc-content').style.display = 'none';
     document.getElementById('toc-toggle').textContent = '∨\u00a0\u00a0\u00a0\u00a0\u00a0';
   } else {
     document.getElementById('toc-content').style.display = 'block';
     document.getElementById('toc-toggle').textContent = '∧\u00a0\u00a0\u00a0\u00a0\u00a0';
   }
 }
   
  function openCloseToc2() {
      if(document.getElementById('toc-content2').style.display === 'block') {
        document.getElementById('toc-content2').style.display = 'none';
        document.getElementById('toc-toggle2').textContent = '∨\u00a0\u00a0\u00a0\u00a0\u00a0';
      } else {
        document.getElementById('toc-content2').style.display = 'block'; 
        document.getElementById('toc-toggle2').textContent = '∧\u00a0\u00a0\u00a0\u00a0\u00a0';
      }
 }
</script>
<style type="text/css">
    #d_warn.tr {border-top: 1px solid #dcdcdc;}
    #div_warn { width: 700px; height:500px; margin: 0px auto; background-color: #f2f2f2;}
    #detail { width: 1110px; height:auto; margin: 0px auto;}
    #d_info { width: 1110px; height:800px; margin: 0px auto; font-size: 20px; color: black; font-family: 'Nanum Gothic', sans-serif; background-color:;  }
    #d_warn { width: 1110px; height:auto; margin: 0px auto; font-size: 20px; color: black; font-family: 'Nanum Gothic', sans-serif; background-color:rgb(248,248,248);  }
    #d_img { width: 1110px; height:800px; margin: 0px auto; background-image: url("비치오브클라우드.jpg"); background-size: cover;}
	#warn_add{ width: 375px; margin: 0px auto; font-size: 25px; color: black; vertical-align:middle; }
 	#warn_addr{ text-align: right; width: 375px; margin: 0px auto; font-size: 20px; color: black;}
 	#enddiv{ width :544px; height:750px; background-color: rgb(242,242,242); float:left; }
 	#enddiv li {font-size: 14px; color: #333; line-height: 30px;}
 	#tocul{width:1060px; margin: auto; float:left;}
	.a{color:black;}

  #toc-content { display: none; }
  #toc-toggle { cursor: pointer; color: black; font-size: 25px;  vertical-align: middle;}
  #toc-toggle:hover { text-decoration: none; }
  
  #toc-content2 { display: none;}
  #toc-toggle2 { cursor: pointer; color: black; font-size: 25px; vertical-align: middle; }
  #toc-toggle2:hover { text-decoration: none;}
</style>
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
					<h1>${roomDTO.room_name }</h1>
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
				<img alt="room_image" src="${pageContext.request.contextPath}/resources/upload/${roomDTO.room_file}">
			</div>
			<div class="sun_btn"><a href="${pageContext.request.contextPath}/sub/reservation?room_idx=${roomDTO.room_idx }">RESERVATION</a></div>
			<h2>ROOM FEATURE</h2>
			<div class="sub_rf_info">
				<dl class="sub_r_dl">
					<dt>객실개요</dt>
					<dd>
						<span>침대타입</span> 
						<p>${roomDTO.room_bedType }</p>
					</dd>
					<dd>
						<span>투숙인원</span> 
						<p>${roomDTO.room_guest }명</p>
					</dd>
					<dd>
						<span>전망</span> 
						<p>${roomDTO.room_view }</p>
					</dd>
					<dd>
						<span>구성</span>
						<p>${roomDTO.room_type }</p>
					</dd>
					<dd>
						<span>객실면적</span>
						<p>${roomDTO.room_size }m<sup>2</sup></p>
					</dd>
					<dd>
						<span>체크인/아웃</span>
						<p>${roomDTO.room_checkinout_time }</p>
					</dd>
				</dl>
				<dl class="sub_rf_dl">
					<dt>
						편의시설
					</dt>
					<dd>
						· 해운대 경관을 조망할 수 있는 오션뷰
					</dd>
					<dd>
						· 최상의 숙면을 위한 침대 및 침구류
					</dd>
					<dd>
						· 전 객실 초고속 무료 인터넷(유선, 와이파이)
					</dd>
					<dd>
						· 비즈니스 코너 인터넷 무료 이용
					</dd>
					<dd>
						· 투숙 기간 내 무료 주차 가능
					</dd>
				</dl>
				<dl class="sub_r_dl">
					<dt>어메니티</dt>
					<dd>
						<span>침대타입</span> 
						<p>TV</p>
						<p>미니바/티포트</p>
						<p>사무용 데스크</p>
						<p>전화기</p>
					</dd>
					<dd>
						<span>투숙인원</span> 
						<p>세면대</p>
						<p>슬리퍼 / 욕실용품</p>
						<p>가운 / 헤어드라이어</p>
						<p>1회용 칫솔 및 치약</p>
					</dd>
					<dd>
						<span>전망</span> 
						<p>케이블 위성 TV 채널</p>
						<p>무료 생수(1일 2병)</p>
						<p>커피, 티</p>
						<p>옷솔</p>
					</dd>
				</dl>
			</div>
		</div>
		<div id="d_warn">
			<table>
				<tr style="border:none;">
					<td colspan="2" style="font-size: 30px; line-height: 150%;">
						<br><br>조용하고 프라이빗한 공간에서<br> 
						언제나 최상의 컨디션을 제공합니다.<br><br>
					</td>
				</tr>
				<tr style="border:none;">
					<td colspan="2">
						(call)12345-67890 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						(email)shghdrl1234@naver.com<br><br>
					</td>
				</tr>
			</table>
			<table>
				<tr style="border-top: 1px solid black;" height="100px;">
					<th id="warn_add">추가정보</th><th id="warn_addr"></th>
					<th id="warn_add">예약변경 및 취소</th>
					<th id="warn_addr"><span id="toc-toggle" onclick="openCloseToc()">∨&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></th>
				</tr>
			</table>	
			<table style="width:1500px;" id="toc-content" id="tocul" >
				<tr>
					<td  id="ul2">
						<div id="enddiv"> 
							<ul >
								&nbsp;&nbsp;
								<li>체크인 오후 3시 이후, 체크아웃 오전 11시</li>
								<li>모든 요금은 TAX 포함가 입니다.</li>
								<li>전 객실은 금연입니다.</li>
								<li>호텔내 반려동물 동반 입장은 불가합니다.</li>
								<li>화재의 위험이 있는 양초류의 사용은 불가합니다.</li>
								<li>객실 내 장식물 부착은 불가합니다.</li>
								<li>객실 훼손 및 파손 시 전액 또는 일정 금액을 청구할 수 있습니다.</li>
							</ul>
						</div>
					</td>
					<td style="width:20px "></td>
					<td  id="ul3">
						<div id="enddiv" >
							<ul >
								<br><b>성수기(5,7,8,9,10월,12/24,12/34)</b>
								<li>숙박예정일 7일 전까지는 위약금 없이 취소 가능</li>
								<li>숙박일 5일 전 변경할 경우 : 최소 1박 숙박요금의 20% 부과</li>
								<li>숙박일 4일 전 변경할 경우 : 최소 1박 숙박요금의 50% 부과</li>
								<li>숙박일 3일 이내로부터 변경할 경우 : 전체 숙박요금의 100% 부과</li>
								<li>숙박 예정일 5일 전~2일 전 18시까지 취소 및 변경 시 위 규정에 따른 요금 부과</li>
								<br><b>비수기(성수기 외 기간)</b>
								<li>숙박 예정일 4일전 18시까지는 위약금 없이 취소가능 : 위약금 없이 취소 가능</li>
								<li>숙박일 3일 전 변경할 경우 : 최소 1박 숙박요금의 20% 부과</li>
								<li>숙박일 2일 전 변경할 경우 : 최소 1박 숙박요금의 50% 부과</li>
								<li>숙박일 1일 전 또는 숙박 당일 변경할 경우 : 최소 1박 숙박요금의 100% 부과</li>
								<li>위 기간 이후 취소(NO SHOW포함)또는 변경 시 최초 1박 요금의 100% 부과</li>
							</ul>
						</div>
					</td>
				</tr>
			
			</table>
		</div>
		<div class="sun_btn" style="margin-top: 50px;"><a href="${pageContext.request.contextPath}/sub/rooms">LIST</a></div>
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