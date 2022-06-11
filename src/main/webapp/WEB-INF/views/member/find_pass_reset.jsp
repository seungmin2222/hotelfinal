<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- 비밀번호1, 비밀번호2 일치여부 스크립트 -->
<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<script type="text/javascript">
 var isPasswdCheck = false; 
 var isConfirmPasswdCheck = false;
  
  function checkPasswd(passwd) {
      // 8 ~ 16자리 영문자, 숫자, 특수문자(!@#$%) 검증(주의! 패턴 작성 시 문자열 지정 금지)
      var lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/;
      var engUpperRegex = /[A-Z]/;
      var engLowerRegex = /[a-z]/;
      var digitRegex = /[0-9]/;
      var specRegex = /[!@#$%]/;
      
      // 자바스크립트를 통한 정규표현식 체크 문법 
      // 정규표현식패턴객체.exec(검증할문자열) => boolean 타입 결과 리턴
//      alert(typeof(lengthRegex));
      
      var element = document.getElementById("checkPasswdResult");
      
      if(lengthRegex.exec(passwd)) { // 전체 길이 판별 통과 시
         // 대문자, 소문자, 숫자, 특수문자를 각각 판별하여
         // 해당 항목이 존재할 경우 카운트 변수값을 1씩 증가시킨 후
         // 4점 : "안전" - 초록색
         // 3점 : "보통" - 주황색
         // 2점 : "위험" - 빨간색
         // 0점, 1점 : "사용불가" - 검정색
         var count = 0; // 정수값을 저장하여 요소별 체크마다 1씩 증가시킴
         
         if(engUpperRegex.exec(passwd)) count++; // 영문 대문자 판별
         if(engLowerRegex.exec(passwd)) count++; // 영문 소문자 판별
         if(digitRegex.exec(passwd)) count++; // 숫자 판별
         if(specRegex.exec(passwd)) count++; // 특수문자(!@#$%) 판별
         
          switch(count) { // count 변수 값에 따른 결과 출력
               case 4 : 
                  element.innerHTML = '안전';
                  element.style.color = 'green';
                  isPasswdCheck = true; // 패스워드 양식 확인용 변수값을 true 로 변경
                  break;
               case 3 : 
                  element.innerHTML = '보통';
                  element.style.color = 'blue';
                  isPasswdCheck = true;
                  break;
               case 2 : 
                  element.innerHTML = '위험';
                  element.style.color = 'orange';
                  isPasswdCheck = true;
                  break;
               default :
                  element.innerHTML = '사용불가';
                  element.style.color = 'red';
                  isPasswdCheck = false;
            }
         } else {
            element.innerHTML = "사용불가";
            element.style.color = 'red';
            isPasswdCheck = false;
         }
      }
  
  
        function check_pw(){
           
                 if($('#pass').val()==""){
                    alert("비밀번호를 먼저 입력해 주세요");
                    $('#passCh').val("");
                    document.getElementsByName("#pass").focus();
                 } 
                 
            if(document.getElementById('pass').value !='' && document.getElementById('passCh').value!=''){
                if(document.getElementById('pass').value==document.getElementById('passCh').value){
                    document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                    isConfirmPasswdCheck = true; 
                    document.getElementById('check').style.color='blue';
                }
                else{
                    document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                    isConfirmPasswdCheck = false;
                    document.getElementById('check').style.color='red';
                }
            }
        }
        
        function checkForm() {
            if(document.getElementById('pass').value !='' && document.getElementById('passCh').value!=''){
                 if(document.getElementById('pass').value==document.getElementById('passCh').value){
                     document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                     isConfirmPasswdCheck = true; 
                     document.getElementById('check').style.color='blue';
                 }
                 else{
                     document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                     document.getElementById('pass').value='';
                     document.getElementById('passCh').value='';
                     isConfirmPasswdCheck = false;
                     document.getElementById('check').style.color='red';
                 }
             }
            if (isPasswdCheck && isConfirmPasswdCheck == true) {
               return true; 
            } else {
               alert("비밀번호 조건을 확인해 주세요!");
               return false;
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
					<h1>Find Pass</h1>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- //sub_banner -->

<!-- body -->
<div class="content">
	<div class="member_wrapper">
		<h1 class="member_page_title">비밀번호 찾기</h1>
		<p class="member_page_subTitle">
			변경하실 새로운 비밀번호를 입력해주세요.
		</p>
		<form action="${pageContext.request.contextPath}/member/findPassResetPro" class="find_form" onsubmit="return checkForm()" method="post">
			<div class="j_f_box">
				<span class="j_f_b_title">아이디</span>
				<input type="text" id="member_id" name="member_id" class="id j_f_b_input" required="required" value="${memberDTO.member_id }" readonly>
			</div>
         <div class="j_f_b_title">
            <span class="j_f_b_title">새 비밀번호</span>
            <input type="password" id="pass" name="member_pass" class="j_f_b_input" onkeyup="checkPasswd(this.value)" placeholder="비밀번호를 입력해주세요" required>
            <span id = "checkPasswdResult" ></span>
         </div>
         <div class="j_f_box">
            <span class="j_f_b_title">새 비밀번호 확인</span>
            <input type="password" id="passCh" name="member_passCh" class="j_f_b_input" onchange="check_pw()" placeholder="비밀번호를 한 번 더 입력해주세요" required>
            <span id = "check" ></span>
         </div>
			<input type="submit" id="find" class="find_btn" value="비밀번호 변경하기" >
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