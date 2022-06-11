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
				자주묻는질문
			</h1>
			<form action="" class="boardFaqForm" method="get">
				<table class="boardFaqTable">
					<tr>
						<th class="faq_idx">
							번호
						</th>
						<th class="faq_category">
							카테고리
						</th>
						<th class="faq_subject">
							제목
						</th>
					</tr>
					<!-- FAQ 게시물 1개 영역 -->
					<c:forEach var="boardFaqDTO" items="${boardFaqList }">
						<tr class="boardFaqList" onclick="location.href='${pageContext.request.contextPath}/admin/adminFaqContent?faq_idx=${boardFaqDTO.faq_idx }'">
							<td class="faq_idx">
								${boardFaqDTO.faq_idx }
							</td>
							<td class="faq_category">
								${boardFaqDTO.faq_category }
							</td>
							<td class="faq_subject2">
								${boardFaqDTO.faq_subject }
							</td>
						</tr>
					</c:forEach>
					<!-- FAQ 게시물 1개 영역 종료 -->
				</table>
				<div class="boardBtnBox">
					<input type="button" class="boardbtn" value="자주묻는질문 작성" onclick="location.href='${pageContext.request.contextPath}/admin/adminFaqWrite'">
				</div>
				
				<div class="page_control" id="page_control">
					<c:if test="${ pageDTO.startPage > pageDTO.pageBlock }">
						<a href="${pageContext.request.contextPath}/admin/adminBoardFaq?pageNum=${pageDTO.startPage - pageDTO.pageBlock }">이전</a>
					</c:if>
					<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
						<a href="${pageContext.request.contextPath}/admin/adminBoardFaq?pageNum=${i }">${i }</a>
					</c:forEach>
					<c:if test="${ pageDTO.endPage < pageDTO.pageCount }">
						<a href="${pageContext.request.contextPath}/admin/adminBoardFaq?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">다음</a>
					</c:if>
				</div>
			</form>
		</main>
	</div>

</body>

</html>