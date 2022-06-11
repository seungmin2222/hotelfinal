<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
	<div class="content">
	<div class="sub_wrapper">
		<h2 style="color: #9F8562; font-size: 40px; text-align: center; margin: 40px 0px 60px 0px;">Notice Content</h2>
		<div style="margin: auto;">
			<table  class="board_table">
				<tr>
					<td>공지번호 : </td><td>${noticeBoardDTO.notice_idx } </td><td>공지날짜 : </td><td><fmt:formatDate value="${noticeBoardDTO.notice_date}" pattern="yyyy.MM.dd"/></td>
				</tr>
				<tr>
					<td>공지제목 : </td><td colspan="1">${noticeBoardDTO.notice_subject } </td><td>공지조회수 : </td><td>${noticeBoardDTO.notice_readcount } </td>
				</tr>				
				<tr>
					<td width="200px">공지내용 : </td><td colspan="3" height="350px"><textarea name="qna_content" rows="8" cols="110" readonly="readonly" style="margin: 20px 0px 20px 0px; border: none;">${noticeBoardDTO.notice_content } </textarea></td>
				</tr>
						<tr>
							<td>공지파일 : </td>
								<td><a href="${pageContext.request.contextPath}/resources/upload/${noticeBoardDTO.notice_file}" download>${noticeBoardDTO.notice_file}</a></td>
						</tr>
			</table>
		</div>

				<div class="button-wrapper" style="margin-top:30px; display: flex; justify-content: right;" ><br>
					<c:if test="${sessionScope.member_id eq 'admin' }">
					 <input type="button" value="update" class="btn btn-primary btn-outline-primary btn-sm"
					style="color: black;" onClick="location.href='${pageContext.request.contextPath}/sub/noticeUpdate?notice_idx=${noticeBoardDTO.notice_idx }'">
					<input type="button" value="delete" class="btn btn-primary btn-outline-primary btn-sm"
					style="color: black; margin-left: 20px; " onClick="location.href='${pageContext.request.contextPath}/sub/noticeDelete?notice_idx=${noticeBoardDTO.notice_idx }'">
					</c:if>
					<input type="button" value="list" class="btn btn-primary btn-outline-primary btn-sm"
					style="color: black; margin-left: 20px; " onClick="location.href='${pageContext.request.contextPath}/sub/notice'">
					<br>
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