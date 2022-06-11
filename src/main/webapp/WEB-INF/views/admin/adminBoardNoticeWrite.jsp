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
	if(confirm("등록하시겠습니까?")){
		document.noticeWriteForm.submit();
		alert("등록완료되었습니다.");
		return true;
	} else {
		alert("취소되었습니다.");
		return false;
	}
}
function recheckBtn2(){
	if(confirm("취소하시면 작성한 내용이 삭제됩니다. 삭제하시겠습니까?")){
		document.noticeWriteForm.submit();
		alert("삭제완료되었습니다.");
	} else {
		alert("그대로 유지됩니다.");
		window.close.noticeUpdateForm();
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
				공지사항 글쓰기
			</h1>
			<form action="${pageContext.request.contextPath}/admin/adminNoticeWritePro" name="noticeWriteForm" onsubmit="return false;" class="boardNoticeWriteForm" method="post" enctype="multipart/form-data">
				<table class="boardNoticeWriteTable">
					<tr>
						<th>
							제목
						</th>
						<td>
							<input type="text" name="notice_subject" placeholder="제목을 입력해주세요.">
						</td>
					</tr>
					<tr>
						<th>
							첨부파일
						</th>
						<td>
							<input type="file" name="notice_file"  class="boardNoticeFile">
						</td>
					</tr>
					<tr>
						<th>
							내용
						</th>
						<td>
							<textarea name="notice_content" placeholder="내용을 작성해주세요"></textarea>
						</td>
					</tr>
				</table>
				<div class="boardBtnBox">
					<input type="submit" class="boardbtn" value="작성완료" onclick="recheckBtn(); return false;">
					<input type="button" class="boardbtn" value="취소" onclick="recheckBtn2(); location.href='${pageContext.request.contextPath}/admin/adminBoardNotice'">
				</div>
			</form>
		</main>
	</div>

</body>

</html>