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

<script type="text/javascript">
$(document).ready(function(){
    $('#qnaWriteOk').click(function(){
    	if($('.qna_category').val()==""){
            alert("카테고리 선택해 주세요!");
            $('.qna_category').focus();
            return;
         }
    	 else if($('.qna_pass').val()==""){
            alert("패스워드 입력해 주세요!");
            $('.qna_pass').focus();
            return;
         }
    	 else if($('.qna_subject').val()==""){
            alert("제목 입력해 주세요!");
            $('.qna_subject').focus();
            return;
         }
    	 else if($('.qna_content').val()==""){
            alert("내용 입력해 주세요!");
            $('.qna_content').focus();
            return;
         }
    	 else { 
			if(confirm("등록하시겠습니까?")){
				if($('.qna_pass') != null ){
				document.qnaWriteForm.submit();
				alert("등록완료되었습니다.");
				return true;
				} 
			} else {
				alert("취소되었습니다.");
				return false;
			}
    					
   		} 
	});
});

// function recheckBtn(){
// 	if(confirm("등록하시겠습니까?")){
// 		if($('.qna_pass') != null ){
// 		document.qnaWriteForm.submit();
// 		alert("등록완료되었습니다.");
// 		return true;
// 		} else {
// 			alert("내용을 입력해 주세요.");
// 			return false;
// 		}
// 	} else {
// 		alert("취소되었습니다.");
// 		return false;
// 	}
		
//  } 
function recheckBtn2(){
	if(confirm("취소하시면 작성한 내용이 삭제됩니다. 삭제하시겠습니까?")){
		document.qnaWriteForm.submit();
		alert("삭제완료되었습니다.");
	} else {
		window.close.qnaWriteForm();
	}
}
</script>
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
					<h1>Q&A</h1>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- //sub_banner -->

<!-- body -->
<div class="content">
	<div class="board_wrapper">
		<form action="${pageContext.request.contextPath}/board/qnaWritePro" name="qnaWriteForm" onsubmit="return false" class="boardQnaWriteForm" method="post">
			<table class="boardQnaWriteTable">
				<tr>
					<th>
						카테고리
					</th>
					<td>
					<select name="qna_category" class="qna_category" required >
							<option value="">선택해주세요</option>
							<option value="객실">객실</option>
							<option value="예약">예약</option>
							<option value="부가시설">부가시설</option>
							<option value="기타">기타</option>
						</select>
<!-- 						<select id="qna_category" name="qna_category" class="qna_category"  required > -->
<!-- 							<option value="">선택해주세요</option> -->
<!-- 							<option value="객실">객실</option> -->
<!-- 							<option value="예약">예약</option> -->
<!-- 							<option value="부가시설">부가시설</option> -->
<!-- 							<option value="기타">기타</option> -->
<!-- 						</select> -->
					</td>
				</tr>
				<tr>
					<th>
						비밀번호
					</th>
					<td>
						<input type="password" id="qna_pass" name="qna_pass" class="qna_pass" placeholder="비밀번호를 작성해주세요." required>
					</td>
				</tr>
				<tr>
					<th>
						제목
					</th>
					<td>
						<input type="text"  id="qna_subject" name="qna_subject" class="qna_subject" placeholder="제목을 입력해주세요." required>
					</td>
				</tr>
				<tr>
					<th>
						내용
					</th>
					<td>
						<textarea id = "qna_content" name="qna_content" class="qna_content" placeholder="내용을 작성해주세요." required></textarea>
					</td>
				</tr>
			</table>
			<div class="boardBtnBox">
<!-- 				<input type="submit" class="boardbtn" value="작성완료" onclick="recheckBtn(); return false;"> -->
				<input type="submit" class="boardbtn" id="qnaWriteOk" value="작성완료" onclick="recheckBtn();">
				<input type="button" class="boardbtn" value="취소" onclick="recheckBtn2(); location.href='${pageContext.request.contextPath}/board/qna'">
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