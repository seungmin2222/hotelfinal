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
		<c:if test="${sessionScope.member_id eq 'admin' }">
			<a href="${pageContext.request.contextPath}/sub/noticeWrite" class="btn btn-primary btn-outline-primary btn-sm" style="margin-bottom:10px; float:right; ">write</a>
		</c:if>
			<table class="board_table">
				<tr class="board_table tr">
					<th>번호</th>
					<th style="width: 65%; text-align: center; padding: 0px;">제목</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>

				<c:forEach var="noticeBoardDTO" items="${noticeList }">
					<tr>
						<td class="board_table tr td"><a
							href="${pageContext.request.contextPath}/sub/noticeContent?notice_idx=${noticeBoardDTO.notice_idx }">
								${noticeBoardDTO.notice_idx } </a></td>
						<td class="board_table tr td"><a
							href="${pageContext.request.contextPath}/sub/noticeContent?notice_idx=${noticeBoardDTO.notice_idx }">
								${noticeBoardDTO.notice_subject }</a></td>
						<td class="board_table tr td:nth-child(2)" ><a
							href="${pageContext.request.contextPath}/sub/noticeContent?notice_idx=${noticeBoardDTO.notice_idx }">
								<fmt:formatDate value="${noticeBoardDTO.notice_date}" pattern="yyyy.MM.dd"/></a></td>
						<td class="board_table tr td:nth-child(2)"><a
							href="${pageContext.request.contextPath}/sub/noticeContent?notice_idx=${noticeBoardDTO.notice_idx }">
								${noticeBoardDTO.notice_readcount }</a></td>
					</tr>
				</c:forEach>

			</table>
			<div class="pageBlock"
				style="width: 400px; height: 300px; margin: auto; text-align: center; font-size: 25px; margin-top: 30px;">
				<c:if test="${ pageDTO.startPage > pageDTO.pageBlock }">
					<a
						href="${pageContext.request.contextPath}/sub/notice?pageNum=${pageDTO.startPage - pageDTO.pageBlock }"
						style="padding: 0px 10px;">Prev</a>
				</c:if>

				<c:forEach var="i" begin="${pageDTO.startPage}"
					end="${pageDTO.endPage }" step="1">
					<a href="${pageContext.request.contextPath}/sub/notice?pageNum=${i }"
						style="padding: 0px 10px;">${i }</a>
				</c:forEach>

				<c:if test="${ pageDTO.endPage < pageDTO.pageCount }">
					<a
						href="${pageContext.request.contextPath}/sub/notice?pageNum=${pageDTO.startPage + pageDTO.pageBlock }"
						style="padding: 0px 10px;">Next</a>
				</c:if>
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