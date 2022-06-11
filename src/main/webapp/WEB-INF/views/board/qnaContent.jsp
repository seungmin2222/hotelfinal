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
function recheckBtn(){
		var pass = $('#qna_pass').val();
		var pass2 = "${boardQnaDTO.qna_pass}";
	if(pass == "") {
		alert("비밀번호를 입력하세요.");
	} else if(pass != "") {
		if(confirm("삭제하시겠습니까?") == true) {
			if(pass == pass2 ) {
				alert("삭제완료되었습니다.");
				location.href='${pageContext.request.contextPath}/board/qnaDeletePro?qna_idx=${boardQnaDTO.qna_idx }'
			} else {
				alert("비밀번호가 일치하지 않습니다.");
				
			}
		} 
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
		<form action="" name="qnaContentForm" onsubmit="return false;" class="boardQnaContentForm" method="get">
			<table class="boardQnaContentTable">
				<tr class="qnaContentTitleBox">
					<th class="qnaContentTitle">
						<div class="qnaConTt">
							${boardQnaDTO.qna_subject }
						</div>
						<div class="qnaConSubTt">
							<span>
								작성자 : ${boardQnaDTO.member_id } |  
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
				<c:if test="${sessionScope.member_id  ==  boardQnaDTO.member_id}">
					<tr class="qnaContentPassBox">
						<td class="qnaContentPass">
							비밀번호 : 
							<input type="password" id="qna_pass" name="qna_pass" placeholder="삭제시 비밀번호를 입력해주세요" required>
						</td>
					</tr>
				</c:if>
				<tr class="qnaContentBox">
					<td class="qnaContent">
						${boardQnaDTO.qna_content }
					</td>
				</tr>
			</table>
			<div class="boardBtnBox">
			<c:if test="${sessionScope.member_id  ==  boardQnaDTO.member_id}">
				<input type="button" class="boardbtn" value="수정하기" onclick="location.href='${pageContext.request.contextPath}/board/qnaUpdate?qna_idx=${boardQnaDTO.qna_idx }'">
				<input type="button" class="boardbtn" value="삭제하기" onclick= "recheckBtn(); ">
			</c:if>
				<input type="button" class="boardbtn" value="목록으로" onclick="location.href='${pageContext.request.contextPath}/board/qna'">
			<c:if test="${sessionScope.member_id  == 'admin'}">
				<input type="button" class="boardbtn" value="답글쓰기" onclick="location.href='${pageContext.request.contextPath}/board/qnaReply?qna_idx=${boardQnaDTO.qna_idx }'">
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