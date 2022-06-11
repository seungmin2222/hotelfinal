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
<script type="text/javascript">
function recheckBtn(){
	if(confirm("삭제하시겠습니까?")){
		document.faqContentForm.submit();
		alert("삭제완료되었습니다.");
	} else {
		alert("취소되었습니다.");
		window.close.faqContentForm();
	}
}
</script>
</head>

<body>
	<!-- admin 왼쪽 메뉴바 -->
	<jsp:include page="../inc/admin_element.jsp"></jsp:include>
	<!-- admin 왼쪽 메뉴바 종료 -->
	<div class="main-content">
		<main>
			<h1 class="boardTitle">
				자주묻는질문 컨텐츠
			</h1>
			<form action="" name="faqContentForm" onsubmit="return false;" class="boardFaqContentForm" method="get">
				<table class="boardFaqContentTable">
					<tr class="boardFaqContentTop">
						<th class="faqContentIdx">
							글번호
						</th>
						<th class="faqContentCategory">
							카테고리
						</th>
						<th class="faqContentsubject">
							제목
						</th>
					</tr>
					<tr class="boardFaqContentTitle">
						<th class="faqContentIdx">
							${boardFaqDTO.faq_idx }
						</th>
						<th class="faqContentCategory">
							${boardFaqDTO.faq_category }
						</th>
						<th class="faqContentsubject">
							${boardFaqDTO.faq_subject }
						</th>
					</tr>
					<tr class="boardFaqContentBox">
						<td colspan="2" class="faqContentTt">
							내용
						</td>
						<td class="faqContentContent">
							${boardFaqDTO.faq_content }
						</td>
					</tr>
				</table>
				<div class="boardBtnBox">
					<input type="button" class="boardbtn" value="수정하기" onclick="location.href='${pageContext.request.contextPath}/admin/adminFaqUpdate?faq_idx=${boardFaqDTO.faq_idx }'">
					<input type="button" class="boardbtn" value="삭제하기" onclick="recheckBtn(); location.href='${pageContext.request.contextPath}/admin/adminFaqDeletePro?faq_idx=${boardFaqDTO.faq_idx }'">
					<input type="button" class="boardbtn" value="목록으로" onclick="location.href='${pageContext.request.contextPath}/admin/adminBoardFaq'">
				</div>
			</form>
		</main>
	</div>

</body>

</html>