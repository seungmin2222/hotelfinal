<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html>
<head>
<meta charset="UTF-8">
<title>예약</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700,900|Rubik:300,400,700" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">

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
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<style type="text/css">
#pay{width:800px; height:auto; margin:auto; text-align:center; vertical-align: middle;  }
#everything{width:750px; height:auto; margin:50px;  text-align: left; border: solid 1px #ddd;}
#subject{width:700px; padding-bottom:15px; margin:25px; border-bottom: solid 1px #ddd;; font: 20px bold;}
#subject2{width:700px; margin:25px; border-top: solid 1px #ddd; font: 20px bold; align-content: center; text-align: center;  }
#context{width:850px; margin:25px; padding:10px;}

#roomInfo{width:680px; height: auto;  border: solid 1px #ddd; font: 15px bold; text-align: center; }
#roomInfo td {width:100px; background-color: white;}
#payInfo{width:680px; height: auto;  border: solid 1px #ddd; font: 15px bold; text-align: right;}
#roomInfo li {text-align:left; line-height: 25px; list-style: disc;}

tr{height: 30px;}
th{text-align: left; width:150px; border-bottom: solid 1px #ddd ;}
td{border-bottom: solid 1px #ddd ;}

dt{float : left;}
label{font: 15px bold;}
ul {list-style-type:none;}
 
input{width:400px; height:40px; border: 1px solid #A67841; position:relative; bottom:7px;
        vertical-align: 10px; }
#sub {border:1px solid #A67841; background-color: #A67841; color: white; width:150px; height: 40px;}

        
 #img{background-image: url('${pageContext.request.contextPath}/resources/images/room_deluxeDouble.jpg'); 
         width:300px; height:166px; background-size: cover; }
</style>
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
               <h1>Reservation</h1>
            </div>
         </div>
      </div>
   </div>
</section>
<!-- //sub_banner -->

<!-- body -->
<section id="pay">
<form onsubmit="requestPay()">

<div id="everything">

<div id="subject">
예약자 정보
</div>

   <div id="context">
   <dl>
   <dt><label>이름&emsp;&emsp; :&emsp;</label></dt> <dd><input type="text" id="id" name="member_name" required value="${memberDTO.member_name}"></dd> 
   <dt><label>휴대전화 :&emsp;</label></dt> <dd><input type="text" id="id" name="member_phone" required value="${memberDTO.member_phone}"></dd> 
   <dt><label>이메일&emsp; :&emsp;</label></dt> <dd><input type="text" id="id" name="member_email" required value="${memberDTO.member_mail}"></dd> 
<!--    <dt><label>주소&emsp;&emsp; :&emsp;</label></dt> <dd><input type="text" name="member_address" value=""></dd>  -->
   </dl>
   </div>
   
<div id="subject">객실정보</div>

<div id="context">
   <table id="roomInfo">
   <tr><td>객실 [${book_room_name}]</td><td colspan="3">예약 기간</td><td colspan="3"> ${book_checkin} ~ ${book_checkout}</td></tr>
   <tr><th rowspan="2" id="img"></th>
   
<!--    <td>객실 수</td><td>성인 수</td><td>아동 수</td><td>추가 베드</td><td>성인 조식</td><td>아동 조식</td></tr> -->
<%--    <tr><td>${book_rooms}</td><td>${book_adult}</td><td>${book_children}</td><td>${book_bed}</td><td>${book_breakfast_adult}</td><td>${book_breakfast_children}</td></tr> --%>
<!--    </table> -->
   
   
   <td rowspan="2" colspan="3">
   <ul>
   <li>객실의 수&emsp;:&emsp;${book_rooms}</li>
   <li>성인 인원&emsp;:&emsp;${book_adult}</li>
   <li>아동 인원&emsp;:&emsp;${book_children}</li>
   </ul></td>
   
   <td colspan="3" rowspan="2">
   <ul>
   <li>추가 베드&emsp;:&emsp;${book_bed}</li>
   <li>성인 조식&emsp;:&emsp;${book_breakfast_adult}</li>
   <li>아동 조식&emsp;:&emsp;${book_breakfast_children}</li>
   </ul></td>
   
   </tr>
   </table>
   
   </div>
   
<div id="subject">
결제 정보
</div>
   <div id="context">
   <table id="payInfo">
   <tr><th>객실 [${book_room_name}]</th><td>
   
   <!-- 객실 가격에 대한 변수 book_room_price 선언  -->
   <c:set var="book_room_price" value=""/>

   <!-- c:choose, c:when 문을 통한    else if 구문 작성 -->
   <c:choose> 
      <c:when test="${book_room_name == '스탠다드 트윈'}">
      <c:set var="book_room_price" value="100000"/>
      <c:set var="merchant_code" value="room_001"/> ${book_room_price}</c:when>
      
      <c:when test="${book_room_name == '디럭스 더블'}">
      <c:set var="book_room_price" value="110000"/>
      <c:set var="merchant_code" value="room_002"/> ${book_room_price}</c:when>
      
      <c:when test="${book_room_name == '디럭스 트윈'}">
      <c:set var="book_room_price" value="120000"/>
      <c:set var="merchant_code" value="room_003"/> ${book_room_price}</c:when>
      
      <c:when test="${book_room_name == '디럭스 온돌'}">
      <c:set var="book_room_price" value="130000"/>
      <c:set var="merchant_code" value="room_004"/> ${book_room_price} </c:when>
      
      <c:otherwise>
      <c:set var="book_room_price" value="140000"/>
      <c:set var="merchant_code" value="room_005"/> ${book_room_price} </c:otherwise>
      </c:choose>

   <!--String으로 저장된 날짜를 time 날짜 형식으로 변환 -->
   <fmt:parseDate value="${book_checkin}" var="checkin" pattern="yyyy-MM-dd"/>
   <fmt:parseNumber value="${checkin.time/(1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
   
   <fmt:parseDate value="${book_checkout}" var="checkout" pattern="yyyy-MM-dd"/>
   <fmt:parseNumber value="${checkout.time/(1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
   
   <!-- 날짜로 변형된 데이터를 이용하여 숙박 기간을 나타내는 day 변수 선언 -->
   <c:set var="day" value="${endDate - strDate}"/>
      
      </td><td>객실 수 (${book_rooms})</td><td>숙박 기간(${day})</td><td>
   
   
         
      


   <!-- 객실의 수와, 숙박 기간에 대한 객실 금액을 나타내는 room_price 변수 선언 -->
   <c:set var="rooms_price" value="${book_room_price*book_rooms*day}" />      
         
   ${rooms_price}</td></tr>
      
   <!--  성인 및 아동 조식 금액 변수 선언 -->
   <c:set var="book_blackfast_adult_price" value="30000"/>
   <c:set var="book_blackfast_children_price" value="20000"/>
   
   <!--  성인 및 아동의 인원 수에 따른 조식 금액 변수 선언 -->
   <c:set var="book_blackfast_adult_total" value="${book_blackfast_adult_price*book_breakfast_adult}"/>
   <c:set var="book_blackfast_children_total" value="${book_blackfast_children_price*book_breakfast_children }"/>
   
   <!--  전체 조식 가격과 객실 가격의 합 -->
   <c:choose> 
      <c:when test="${memberDTO.member_grade == '5th_bronze'}">
      <c:set var="discount" value="1"/> 
      <c:set var="discountPercent" value="0%"/></c:when>
      
      <c:when test="${memberDTO.member_grade == '4th_silver'}">
      <c:set var="discount" value="0.97"/>
      <c:set var="discountPercent" value="3%"/></c:when>
      
      <c:when test="${memberDTO.member_grade == '3rd_gold'}">
      <c:set var="discount" value="0.95"/>
      <c:set var="discountPercent" value="5%"/></c:when>
      
      <c:when test="${memberDTO.member_grade == '2nd_platinum'}">
      <c:set var="discount" value="0.93"/>
      <c:set var="discountPercent" value="7%"/></c:when>
      
      <c:when test="${memberDTO.member_grade == '1st_dia'}">
      <c:set var="discount" value="0.9"/>
      <c:set var="discountPercent" value="10%"/></c:when>
      </c:choose>
      <fmt:parseNumber var="book_total_price" value="${(rooms_price+book_blackfast_adult_total+book_blackfast_children_total)*discount}" integerOnly="true"/>
<%--       <c:set var="book_total_price"  value="${(rooms_price+book_blackfast_adult_total+book_blackfast_children_total)*discount}"/> --%>
   
   
  <tr><th>성인 조식</th><td>${book_blackfast_adult_price}</td><td>인원 수 (${book_breakfast_adult})</td><td></td><td>${book_blackfast_adult_total}</td></tr>
   
   <tr><th>아동 조식</th><td>${book_blackfast_children_price}</td><td>인원 수 (${book_breakfast_children})</td><td></td><td>${book_blackfast_children_total }</td></tr>
   
   <tr><th>회원 등급</th><td>${memberDTO.member_grade}</td><td></td><td></td><td></td></tr>
   
   <tr><th>할인</th><td>${discountPercent}</td><td>총 금액</td><td></td><td>${(rooms_price+book_blackfast_adult_total+book_blackfast_children_total)}</td></tr>

   
   <tr><th></th><td></td><td> </td><td>결제 금액 :</td><td>${book_total_price}</td></tr>
   </table>
   
<%--    <input type="hidden" value="${memberDTO.member_phone}" name="phone"> --%>
<%--    <input type="hidden" value="${memberDTO.member_mail}" name="mail"> --%>
<%--    <input type="hidden" value="${memberDTO.member_name}" name="name"> --%>
<%--    <input type="hidden" value="${book_room_name}" name="room"> --%>
<%--    <input type="hidden" value="${book_total_price}" name="total"> --%>
   </div>
   
   
<!-- <div id="subject"> -->
<!-- 결제 수단 -->
<!-- </div> -->

<!--    <div id="context"> -->
<!--    <h2>실질적인 내용</h2> -->
<!--    </div> -->
   
<div id="subject2"><br>

<%--    <input type="submit" id="join" value="정보 확인" onclick="location.href='${pageContext.request.contextPath}/sub/payPro'"> --%>
<!--    <input type="submit" id="join" value="정보 확인"> -->
   <button type="button" id="sub" onclick="requestPay()">결제하기 </button>

</div>


</div> 



</form>

</section>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

 <script>
 var IMP = window.IMP; // 생략 가능
 IMP.init("imp56698025"); // 예: imp00000000
 
    function requestPay() {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: "${merchant_code}",
          name: "${book_room_name}", // 상품명
          amount: "${book_total_price}", // 가격
          buyer_email: "${memberDTO.member_mail}",
          buyer_name: "${memberDTO.member_name}",
          buyer_tel: "${memberDTO.member_phone}",
          buyer_addr: "서울특별시 강남구 신사동",
          buyer_postcode: "01181"
      }, function (rsp) { // callback
          if (rsp.success) {
//              location.href="${pageContext.request.contextPath}/sub/reservation_completePro?totalPrice=${book_total_price}+&book_room_name=${book_room_name}+&book_rooms=${book_rooms}+&book_adult=${book_adult}+&book_children=${book_children}+&book_bed=${book_bed}+&book_breakfast_adult=${book_breakfast_adult}+&book_breakfast_children=${book_breakfast_children}"";
              // 결제 성공 시 로직, 주소줄로 데이터 값을 가져감. => 컨트롤러에서 리퀘스트로 가져올 수 있음.
             
          } else {
             location.href="${pageContext.request.contextPath}/sub/reservation_completePro?totalPrice=${book_total_price}+&book_room_name=${book_room_name}+&book_rooms=${book_rooms}+&book_adult=${book_adult}+&book_children=${book_children}+&book_bed=${book_bed}+&book_breakfast_adult=${book_breakfast_adult}+&book_breakfast_children=${book_breakfast_children}+&book_reqmatter=${book_reqmatter}";
         // 테스트용으로 취소시, 결제 완료되게 해놓음.
             
             // location.href="${pageContext.request.contextPath}/sub/payFail";
              // 결제 실패 시 로직,
          }
      });
    }
  </script>
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