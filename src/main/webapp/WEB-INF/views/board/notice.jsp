<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/b0f29e9bfe.js" crossorigin="anonymous"></script>
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
	<div class="board_wrapper">
		<form action="" class="boardNoticeForm" method="get">
			<div class="boardNoticeSearch">
				<select class="boardNoticeSearchSelect">
					<option>전체</option>
					<option>제목</option>
					<option>내용</option>
				</select>
				<input type="text" name="search" class="boardNoticeSearchTextBox" placeholder="검색어를 입력하세요."><i class="fas fa-search"></i>
			</div>
			<table class="boardNoticeTable">
				<tr>
					<th class="notice_idx">
						번호
					</th>
					<th class="notice_subject">
						제목
					</th>
					<th class="notice_file">
						첨부파일
					</th>
					<th class="notice_date">
						작성일
					</th>
					<th class="notice_readcount">
						조회수
					</th>
				</tr>
				<!-- 공지사항 게시물 1개영역 -->
				<c:forEach var="boardNoticeDTO" items="${boardNoticeList }">
					<tr class="boardNoticeList" onclick="location.href='${pageContext.request.contextPath}/board/noticeContent?notice_idx=${boardNoticeDTO.notice_idx }'">
						<td class="notice_idx">
							${boardNoticeDTO.notice_idx }
						</td>
						<td class="notice_subject2">
							${boardNoticeDTO.notice_subject }
						</td>
						<td class="notice_file">
							<c:set var="notice_file" value="${boardNoticeDTO.notice_file }"/>
							<c:choose>
								<c:when test="${!empty notice_file}">
									<i class="fas fa-paperclip"></i>
								</c:when>
								
								<c:when test="${empty notice_file}">
									x
								</c:when>
							</c:choose>
						</td>
						<td class="notice_date">
							<fmt:formatDate value="${boardNoticeDTO.notice_date }" pattern="yyyy.MM.dd"/>
						</td>
						<td class="notice_readcount">
							${boardNoticeDTO.notice_readcount }
						</td>
					</tr>
				</c:forEach>
				<!-- 공지사항 게시물 1개영역 종료 -->
			</table>
			
			<div class="page_control" id="page_control">
				<c:if test="${ pageDTO.startPage > pageDTO.pageBlock }">
					<a href="${pageContext.request.contextPath}/board/notice?pageNum=${pageDTO.startPage - pageDTO.pageBlock }">이전</a>
				</c:if>
				<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
					<a href="${pageContext.request.contextPath}/board/notice?pageNum=${i }">${i }</a>
				</c:forEach>
				<c:if test="${ pageDTO.endPage < pageDTO.pageCount }">
					<a href="${pageContext.request.contextPath}/board/notice?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">다음</a>
				</c:if>
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