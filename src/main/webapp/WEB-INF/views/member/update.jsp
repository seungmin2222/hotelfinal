<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<script type="text/javascript">
var phoneCheck2 = true;
function phone_check(){
    var phoneCheck =/^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
    if(!(phoneCheck.test($(".phone").val() )) ){
    	 alert(" - 없이 숫자(10 ~ 11자리)만 정확히 입력해 주세요!");
         $('.phone').focus();
         phoneCheck2 = false;
      } else {
   	   phoneCheck2 = true;
      }
 }
function email_check(){
	  var mailCheck = /^[A-Za-z0-9]+$/;
	  if(!(mailCheck.test($(".email1").val() )) ){
        alert("이메일 ID를 확인해 주세요!");
        $('.email1').val("");
        $('.email1').focus();
     }
}
function checkForm() {
    if (phoneCheck2 == true) {
       return true; 
    } else {
       alert("수정 조건을 확인해 주세요!");
       return false;
    } 
 }
</script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
            
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<!-- 주소줄 스크립트 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
					<h1>MY<br>Info</h1>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- //sub_banner -->
		

<!-- body -->
<div class="content">
	<div class="member_wrapper">
		<!-- left menu -->
		<div class="left_menu">
			<div class="left_menu_myName">
				${sessionScope.member_id } 님
			</div>
			<div class="left_menu_myGrade">
				<p>나의등급</p>
				<p>${memberDTO.member_grade }</p>
			</div>
			<ul class="left_menu_list">
				<li class="left_m_l_li"><a href="${pageContext.request.contextPath}/member/myInfo">myInfo</a></li>
				<li class="left_m_l_li"><a href="${pageContext.request.contextPath}/member/myReservation">나의예약 현황</a></li>
				<li class="left_m_l_li"><a href="${pageContext.request.contextPath}/member/update">회원정보 수정</a></li>
				<li class="left_m_l_li"><a href="${pageContext.request.contextPath}/member/delete">회원탈퇴</a></li>
			</ul>
		</div>
		<!-- left menu 종료 -->
		<h1 class="member_page_title">회원정보</h1>
		<form action="${pageContext.request.contextPath}/member/updatePro" id="join-form" class="join_form" method="post" onsubmit="return checkForm()">
			<div class="j_f_box">
				<span class="j_f_b_title">아이디</span>
				<input type="text" id="member_id" name="member_id" class="id j_f_b_input" required="required" value="${memberDTO.member_id }" readonly>
			</div>
			<div class="j_f_b_title">
				<span class="j_f_b_title">비밀번호</span>
				<input type="password" id="member_pass" name="member_pass" class="j_f_b_input" onkeyup="checkPasswd(this.value)" placeholder="비밀번호를 입력해주세요" required>
				<span id = "checkPasswdResult" ></span>
			</div>
			<div class="j_f_box">
				<span class="j_f_b_title">이름</span>
				<input type="text" id="member_name" name="member_name" class="j_f_b_input" value="${memberDTO.member_name }" required readonly>
			</div>
			<div class="j_f_box">
				<span class="j_f_b_title">이메일 주소</span>
				<c:set var="email" value="${fn:split(memberDTO.member_mail,'@')}"></c:set>
				<input type="text" id="email1" name="email1" class="email1 j_f_b_email" placeholder="이메일" onchange="email_check()" value="${email[0]}" required>
				<input id="hi" class="j_f_b_email_at"type="text" placeholder="@" disabled>  
				<input type="text" id="email2" name="email2" class="j_f_b_email" placeholder="도메인 주소" value="${email[1]}" required>
			</div>
			<div class="j_f_box">
				<c:set var="address" value="${fn:split(memberDTO.member_address,',')}"></c:set>
				<span class="j_f_b_title">주소</span>
				<input type="text" id="sample4_postcode"  class="j_f_b_input2" name = "address1" placeholder="우편번호" value="${address[0]}" readonly required>
				<input type="button" onclick="sample4_execDaumPostcode()" class="j_f_b_input2_btn" name="address1" value="우편번호 찾기" >
				<input type="text" id="sample4_roadAddress" name = "address2" class="j_f_b_input j_f_b_i_space" placeholder="도로명주소" value="${address[1]}" readonly required>
				<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" readonly  name = "address2">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample4_detailAddress" name = "address3" class="j_f_b_input j_f_b_i_space" placeholder="상세주소" value="${address[2]}" required>
				<input type="hidden" id="sample4_extraAddress"  placeholder="참고항목">
			</div>
			<div class="j_f_box">
				<span class="j_f_b_title">휴대폰 번호</span>
				<input type="text" id="member_phone" name="member_phone" class="phone j_f_b_input" onchange="phone_check()" placeholder="휴대폰 번호를 입력해주세요" value="${memberDTO.member_phone }" required>
			</div>
			<input type="submit" id="join" class="join_btn" value="수정하기">
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