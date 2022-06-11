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
	if(confirm("수정하시겠습니까?")){
		document.faqUpdateForm.submit();
		alert("수정완료되었습니다.");
		return true;
	} else {
		alert("취소되었습니다.");
		return false;
	}
}
function recheckBtn2(){
	if(confirm("수정한 내용이 있다면 삭제됩니다. 취소하시겠습니까?")){
		document.faqUpdateForm.submit();
		alert("자주묻는질문페이지로 이동합니다.");
	} else {
		window.close.faqUpdateForm();
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
				자주묻는질문 게시물 수정하기
			</h1>
			<form action="${pageContext.request.contextPath}/admin/adminFaqUpdatePro" name="faqUpdateForm" class="boardFaqWriteForm" method="post" onsubmit="return recheckBtn2();">
				<table class="boardFaqWriteTable">
					<tr>
						<th>
							글번호
						</th>
						<td>
							<input type="text" name="faq_idx" value="${boardFaqDTO.faq_idx }" readonly="readonly">
						</td>
					</tr>
					<tr>
						<th>
							카테고리
						</th>
						<td>
							<select name="faq_category">
								<option value="">선택해주세요.</option>
								<option value="예약"
									<c:if test="${boardFaqDTO.faq_category == '예약' }">selected</c:if>
								>예약</option>
								<option value="객실"
									<c:if test="${boardFaqDTO.faq_category == '객실' }">selected</c:if>
								>객실</option>
								<option value="회원"
									<c:if test="${boardFaqDTO.faq_category == '회원' }">selected</c:if>
								>회원</option>
								<option value="기타"
									<c:if test="${boardFaqDTO.faq_category == '기타' }">selected</c:if>
								>기타</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>
							제목
						</th>
						<td>
							<input type="text" name="faq_subject" value="${boardFaqDTO.faq_subject }" placeholder="제목을 입력해주세요.">
						</td>
					</tr>
					<tr>
						<th>
							내용
						</th>
						<td>
							<textarea name="faq_content" placeholder="내용을 입력해주세요.">${boardFaqDTO.faq_content }</textarea>
						</td>
					</tr>
				</table>
				<div class="boardBtnBox">
					<input type="submit" class="boardbtn" value="수정완료" onclick="recheckBtn(); return false;">
					<input type="button" class="boardbtn" value="취소" onclick="recheckBtn2(); location.href='${pageContext.request.contextPath}/admin/adminBoardFaq'">
				</div>
			</form>
		</main>
	</div>

</body>

</html>