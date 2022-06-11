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
		document.noticeContentForm.submit();
		alert("삭제완료되었습니다.");
	} else {
		alert("취소되었습니다.");
		window.close.noticeContentForm();
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
				공지사항 컨텐츠
			</h1>
			<form action="" name="noticeContentForm" onsubmit="return false;" class="boardNoticeContentForm" method="get">
				<table class="boardNoticeContentTable">
					<tr>
						<th>
							${boardNoticeDTO.notice_idx }
						</th>
					</tr>
					<tr class="boardNoticeContentTop">
						<th class="noticeContentTt">
							${boardNoticeDTO.notice_subject }
						</th>
						<th class="noticeContentDate">
							<fmt:formatDate value="${boardNoticeDTO.notice_date }" pattern="yyyy.MM.dd"/>
						</th>
					</tr>
					<tr class="noticeContentBox">
						<td colspan="2">
							${boardNoticeDTO.notice_content }
						</td>
					</tr>
				</table>
				<div class="boardBtnBox">
					<input type="button" class="boardbtn" value="수정하기" onclick="location.href='${pageContext.request.contextPath}/admin/adminNoticeUpdate?notice_idx=${boardNoticeDTO.notice_idx }'">
					<input type="button" class="boardbtn" value="삭제하기" onclick="recheckBtn(); location.href='${pageContext.request.contextPath}/admin/adminNoticeDeletePro?notice_idx=${boardNoticeDTO.notice_idx }'">
					<input type="button" class="boardbtn" value="목록으로" onclick="location.href='${pageContext.request.contextPath}/admin/adminBoardNotice'">
				</div>
			</form>
		</main>
	</div>

</body>

</html>