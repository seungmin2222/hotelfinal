<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-sclale=1">
    <title>Home Page</title>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminStyle.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>

<body>
	<!-- admin 왼쪽 메뉴바 -->
	<jsp:include page="../inc/admin_element.jsp"></jsp:include>
	<!-- admin 왼쪽 메뉴바 종료 -->
	<div class="main-content">
		<main>
			<h1 class="boardTitle">
				공지사항
			</h1>
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
						<tr class="boardNoticeList" onclick="location.href='${pageContext.request.contextPath}/admin/adminNoticeContent?notice_idx=${boardNoticeDTO.notice_idx }'">
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
				<div class="boardBtnBox">
					<input type="button" class="boardbtn" value="공지사항 작성" onclick="location.href='${pageContext.request.contextPath}/admin/adminNoticeWrite'">
				</div>
				
				<div class="page_control" id="page_control">
					<c:if test="${ pageDTO.startPage > pageDTO.pageBlock }">
						<a href="${pageContext.request.contextPath}/admin/adminBoardNotice?pageNum=${pageDTO.startPage - pageDTO.pageBlock }">이전</a>
					</c:if>
					<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
						<a href="${pageContext.request.contextPath}/admin/adminBoardNotice?pageNum=${i }">${i }</a>
					</c:forEach>
					<c:if test="${ pageDTO.endPage < pageDTO.pageCount }">
						<a href="${pageContext.request.contextPath}/admin/adminBoardNotice?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">다음</a>
					</c:if>
				</div>
			</form>
		</main>
	</div>

</body>

</html>