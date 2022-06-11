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
				Q&A
			</h1>
			<form action="" class="boardQnaForm" method="get">
				<div class="boardNoticeSearch">
					<select class="boardNoticeSearchSelect">
						<option>전체</option>
						<option>제목</option>
						<option>내용</option>
						<option>글쓴이</option>
					</select>
					<input type="text" name="search" class="boardNoticeSearchTextBox" placeholder="검색어를 입력하세요."><i class="fas fa-search"></i>
				</div>
				<table class="boardQnaTable">
					<tr>
						<th class="qna_idx">
							번호
						</th>
						<th class="qna_category">
							카테고리
						</th>
						<th class="qna_subject">
							제목
						</th>
						<th class="qna_member_id">
							글쓴이
						</th>
						<th class="qna_date">
							작성일
						</th>
					</tr>
					
					<tr class="boardQnaList" onclick="location.href='${pageContext.request.contextPath}/admin/adminQnaContent?qna_idx=${boardQnaDTO.qna_idx }'">
						<td class="qna_idx">
							1
						</td>
						<td class="qna_category">
							예약
						</td>
						<td class="qna_subject2">
							내용이들어감
						</td>
						<td class="qna_member_id">
							아이디들어감
						</td>
						<td class="qna_date">
							2022.01.09
						</td>
					</tr>
					
					<!-- Q&A 게시물 1개 영역 -->
					<c:forEach var="boardQnaDTO" items="${boardQnaList }">
						<tr class="boardQnaList" onclick="location.href='${pageContext.request.contextPath}/admin/adminQnaContent?qna_idx=${boardQnaDTO.qna_idx }'">
							<td class="qna_idx">
								${boardQnaDTO.qna_idx }
							</td>
							<td class="qna_category">
								${boardQnaDTO.qna_category }
							</td>
							<td class="qna_subject2">
								${boardQnaDTO.qna_subject }
							</td>
							<td class="qna_member_id">
								${memberDTO.member_id }
							</td>
							<td class="qna_date">
								<fmt:formatDate value="${boardQnaDTO.qna_date }" pattern="yyyy.MM.dd"/>
							</td>
						</tr>
					</c:forEach>
					<!-- Q&A 게시물 1개 영역종료 -->
				</table>
				
				<div class="page_control" id="page_control">
					<c:if test="${ pageDTO.startPage > pageDTO.pageBlock }">
						<a href="${pageContext.request.contextPath}/admin/adminBoardQna?pageNum=${pageDTO.startPage - pageDTO.pageBlock }">이전</a>
					</c:if>
					<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
						<a href="${pageContext.request.contextPath}/admin/adminBoardQna?pageNum=${i }">${i }</a>
					</c:forEach>
					<c:if test="${ pageDTO.endPage < pageDTO.pageCount }">
						<a href="${pageContext.request.contextPath}/admin/adminBoardQna?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">다음</a>
					</c:if>
				</div>
			</form>
		</main>
	</div>

</body>

</html>