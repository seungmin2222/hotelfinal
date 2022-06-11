<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faq</title>
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
</head>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
   <c:if test="${empty sessionScope.member_id }">
   		<script type="text/javascript">
   			location.href = "${pageContext.request.contextPath}/member/login";
   		</script>
   </c:if>
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
					<h1>QnA Update</h1>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- //sub_banner -->
 
<!-- body -->
<div class="content">
		<h2 style="color: #9F8562; font-size: 40px; text-align: center; margin: 40px 0px 60px 0px;">Update FAQ</h2>
<!-- 	<div class="sub_wrapper"> -->
		<div class="writeForm" style="width: 1000px; height:650px; margin: auto;" >
		<form action="${pageContext.request.contextPath}/sub/qnaUpdatePro" method="post" style="margin-top: 20px">
			<input type="hidden" name="qna_idx" value="${qnaBoardDTO.qna_idx}">
			<table>
			<tr style="margin : auto;"><td></td><td><input type="text" name="qna_subject" value="${qnaBoardDTO.qna_subject }" placeholder="제목" style="width: 500px; height:40px; margin-bottom: 20px; border: 1px solid #9F8562; ">
			<c:set var="category" value="${qnaBoardDTO.qna_category }" />
			<c:choose>
				<c:when test="${category eq '객실' }">
					<select name="qna_category" style="margin-left: 30px; height: 40px;">
						<option value="객실" selected="selected">객실</option>
						<option value="부대시설">부대시설</option>
						<option value="등급">등급</option>
						<option value="기타">기타</option>
					</select>
				</c:when>
				<c:when test="${category eq '부대시설' }">
					<select name="qna_category" style="margin-left: 30px; height: 40px;">
						<option value="객실">객실</option>
						<option value="부대시설" selected="selected">부대시설</option>
						<option value="등급">등급</option>
						<option value="기타">기타</option>
					</select>
				</c:when>
				<c:when test="${category eq '등급' }">
					<select name="qna_category" style="margin-left: 30px; height: 40px;">
						<option value="객실">객실</option>
						<option value="부대시설">부대시설</option>
						<option value="등급" selected="selected">등급</option>
						<option value="기타">기타</option>
					</select>
				</c:when>
				<c:when test="${category eq '기타' }">
					<select name="qna_category" style="margin-left: 30px; height: 40px;">
						<option value="객실">객실</option>
						<option value="부대시설">부대시설</option>
						<option value="등급">등급</option>
						<option value="기타" selected="selected">기타</option>
					</select>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${sessionScope.member_id eq 'admin' }">
					<input type="password" name="qna_pass" value="1234" style="margin-left: 20px; border: 1px solid #9F8562;" hidden="">
				</c:when>
				<c:otherwise>
					<input type="password" name="qna_pass" placeholder="비밀번호" style="margin-left: 20px; border: 1px solid #9F8562;">
				</c:otherwise>
			</c:choose>
			</td></tr>
			<tr style="margin : auto;"><td></td><td><textarea name="qna_content"  rows="15" cols="120" style="resize: both; border:1px solid #9F8562; ">${qnaBoardDTO.qna_content}</textarea></td></tr>
			</table>
			<input type="submit" value="update" class="btn btn-primary btn-outline-primary btn-sm">
		</form>
		</div>
<!-- 	</div> -->
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