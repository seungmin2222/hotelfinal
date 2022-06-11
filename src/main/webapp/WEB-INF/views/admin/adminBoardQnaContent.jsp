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
				Q&A 컨텐츠
			</h1>
			<form action="${pageContext.request.contextPath}/admin/adminBoardQna" class="boardQnaContentForm" method="get">
				<table class="boardQnaContentTable">
					<tr class="qnaContentTitleBox">
						<th class="qnaContentTitle">
							<div class="qnaConTt">
								제목이 들어가는 공간입니다아
								${boardQnaDTO.qna_subject }
							</div>
							<div class="qnaConSubTt">
								<span>
									작성자 : ${memberDTO.member_id } |  
								</span>
								<span>
									작성일 : ${boardQnaDTO.qna_date } |  
								</span>
								<span>
									카테고리 : ${boardQnaDTO.qna_category } |  
								</span>
								<span>
									글번호 : ${boardQnaDTO.qna_idx }
								</span>
							</div>
						</th>
					</tr>
					<tr class="qnaContentBox">
						<td class="qnaContent">
							글내용이 들어가는 공간이야아아아아아아아악
							${boardQnaDTO.qna_content }
						</td>
					</tr>
				</table>
				<div class="boardBtnBox">
					<input type="submit" class="boardbtn" value="목록으로">
				</div>
			</form>
		</main>
	</div>

</body>

</html>