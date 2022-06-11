<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<!-- 객실 가격 계산 script -->
<script type="text/javascript">
$(function (){
   document.getElementById('book_checkin').min = new Date().toISOString().substring(0, 10);
   document.getElementById('book_checkout').min = new Date().toISOString().substring(0, 10);
   
   $('#book_checkin').change(function(){
      $('#book_room_name').val("");
      $('#book_breakfast_adult').val("");
      $('#book_breakfast_children').val("");
      $('#book_adult').val("");
      $('#book_children').val("");
      $('#book_bed').val("0");
      $('#book_rooms').val("");
      if($('#book_checkout').val() != ""){
         if($('#book_checkout').val() <= $('#book_checkin').val()){
            alert("체크아웃 날짜를 확인해 주세요!");
            $('#book_checkin').focus();
            $('#book_checkin').val("");
         }
      }
   });
   $('#book_checkout').change(function(){
      $('#book_room_name').val("");
      $('#book_breakfast_adult').val("");
      $('#book_breakfast_children').val("");
      $('#book_adult').val("");
      $('#book_children').val("");
      $('#book_bed').val("0");
      $('#book_rooms').val("");
         if($('#book_checkin').val() == ""){
            alert("체크인,아웃 날짜를 먼저 선택해 주세요!");
            $('#book_checkin').focus();
            $('#book_checkout').val("");
         } else if($('#book_checkout').val() <= $('#book_checkin').val()){
            alert("체크아웃 날짜를 확인해 주세요!");
            $('#book_checkout').focus();
            $('#book_checkout').val("");
         }
   });

   //객실가격 보여주기
   $("#book_room_name").on("change", function () {
      var value = $(this).val(); //객실명
      var price = $(this).find("option:selected").data("price"); // 객실가격
      var stayPrice = price * (Date.parse($('#book_checkout').val()) - Date.parse($('#book_checkin').val())) / 1000 / 60 / 60 / 24;
      document.getElementById('room_price_result').innerText = stayPrice; //객실가격보여주기
      document.getElementById('room_totalPrice_result').innerText = stayPrice; //총가격보여주기
      
      //객실가격 * 객실수량 계산
      $("#book_rooms").on("change", function () {
         var rooms = $(this).find("option:selected").val();
         var roomsPrice = (stayPrice * parseInt(rooms));
         document.getElementById('room_price_result').innerText = roomsPrice;
         document.getElementById('room_totalPrice_result').innerText = roomsPrice;
         
         //성인조식 data-price값이 널이 아닌경우
         //해당 첫 if문에서 객실가격 + 성인수*조식가격 나오도록 출력
         if($("#book_breakfast_adult").data("price") != ""){
            $("#book_breakfast_adult").on("change", function () {
               var value1 = $(this).val();
               var price1 = $(this).find("option:selected").data("price");
               document.getElementById('room_totalPrice_result').innerText = roomsPrice + price1;
            
            
               //만약 아동조식 data-price값이 널이 아닌경우
               //해당 if문에서 객실가격 + (성인수*조식가격) + (아동수*조식가격)
               if($("#book_breakfast_children").data("price") != ""){
                  $("#book_breakfast_children").on("change", function () {
                	  var value = $("#book_room_name").val(); //객실명
                      var price = $("#book_room_name").find("option:selected").data("price"); // 객실가격
                      var rooms = $("#book_rooms").find("option:selected").val();
                      var stayPrice = price * (Date.parse($('#book_checkout').val()) - Date.parse($('#book_checkin').val())) / 1000 / 60 / 60 / 24;
                      var roomsPrice = (stayPrice * parseInt(rooms));
                      var value1 = $("#book_breakfast_adult").val();
                      var price1 = $("#book_breakfast_adult").find("option:selected").data("price");
                      var value2 = $("#book_breakfast_children").val();
                      var price2 = $("#book_breakfast_children").find("option:selected").data("price");
                      var value3 = $("#book_adult").val();
                      var price3 = $("#book_adult").find("option:selected").data("price");
                      var value4 = $("#book_children").val();
                      var price4 = $("#book_children").find("option:selected").data("price");
                      document.getElementById('room_totalPrice_result').innerText = roomsPrice + price1 + price2 + price3 + price4;
                  });
               }
            });
         }
         
         //만약 아동조식 data-price값이 널이 아닌경우
         //해당 if문에서 객실가격 + 객실가격 + (아동수*조식가격)
         if($("#book_breakfast_children").data("price") != ""){
            $("#book_breakfast_children").on("change", function () {
               var value1 = $(this).val();
               var price1 = $(this).find("option:selected").data("price");
               document.getElementById('room_totalPrice_result').innerText = roomsPrice + price1;
               
               
               //성인조식 data-price값이 널이 아닌경우
               //해당 첫 if문에서 객실가격 + 객실가격 + 성인수*조식가격 나오도록 출력
               if($("#book_breakfast_adult").data("price") != ""){
                  $("#book_breakfast_adult").on("change", function () {
                	  var value = $("#book_room_name").val(); //객실명
                      var price = $("#book_room_name").find("option:selected").data("price"); // 객실가격
                      var rooms = $("#book_rooms").find("option:selected").val();
                      var stayPrice = price * (Date.parse($('#book_checkout').val()) - Date.parse($('#book_checkin').val())) / 1000 / 60 / 60 / 24;
                      var roomsPrice = (stayPrice * parseInt(rooms));
                      var value1 = $("#book_breakfast_adult").val();
                      var price1 = $("#book_breakfast_adult").find("option:selected").data("price");
                      var value2 = $("#book_breakfast_children").val();
                      var price2 = $("#book_breakfast_children").find("option:selected").data("price");
                      var value3 = $("#book_adult").val();
                      var price3 = $("#book_adult").find("option:selected").data("price");
                      var value4 = $("#book_children").val();
                      var price4 = $("#book_children").find("option:selected").data("price");
                      document.getElementById('room_totalPrice_result').innerText = roomsPrice + price1 + price2 + price3 + price4;
                  });
               }
               
            });
         }
         //해당 첫 if문에서 객실가격 + 객실가격 + 성인수*조식가격 나오도록 출력
        
         // 객실 선택시 리셋
         if($("#book_room_name").data("price") != ""){
            $("#book_room_name").on("change", function () {
               $('#book_breakfast_adult').val("");
               $('#book_breakfast_children').val("");
               $('#book_adult').val("");
               $('#book_children').val("");
               $('#book_bed').val("0");
               $('#book_rooms').val("");
               $('#book_room_name').focus();
               var price2 = $(this).find("option:selected").data("price");
            });
         }
         
         // 방 선택시 리셋
         if($("#book_rooms").data("price") != ""){
            $("#book_rooms").on("change", function () {
               $('#book_breakfast_adult').val("");
               $('#book_breakfast_children').val("");
               $('#book_adult').val("");
               $('#book_children').val("");
               $('#book_bed').val("0");
               $('#book_rooms').focus();
               var price2 = $(this).find("option:selected").data("price");
            });
         }
      
          
         
      });
          
   });
});

// 객실 미선택시 조식선택하면 alert창 뛰
$(document).ready(function(){
   
   $('#book_room_name').change(function(){
     
      if($('#book_checkin').val()=="" || $('#book_checkout').val()==""){
            alert("체크인, 아웃 날짜를 먼저 선택해 주세요.");
            $('#book_room_name').val("");
            document.getElementsByName("#book_checkin").focus();
         }  
   });
   
   $('#book_rooms').change(function(){
      if($('#book_checkin').val()=="" || $('#book_checkout').val()=="" ||  $('#book_room_name').val()==""){
            alert("체크인, 아웃 날짜를 먼저 선택해 주세요.");
            $('#book_room_name').val("");
            document.getElementsByName("#book_checkin").focus();
         }  
   });
   
   $('#book_children').change(function(){
      $('#book_breakfast_children').val("");
      if($('#book_room_name').val()=="" || $('#book_rooms').val()==""){
         alert("객실 선택후 인원 설정이 가능합니다.");
         $('#book_children').val("");
         document.getElementsByName("#book_room_name")[0].focus();
      }  
      if(Number($('#book_children').val()) + Number($('#book_adult').val()) >= 5){
         alert("총 인원은 4인을 초과할 수 없습니다.");
         $('#book_children').val("");
      }
      var value = $("#book_room_name").val(); //객실명
      var price = $("#book_room_name").find("option:selected").data("price"); // 객실가격
     var rooms = $("#book_rooms").find("option:selected").val();
      var stayPrice = price * (Date.parse($('#book_checkout').val()) - Date.parse($('#book_checkin').val())) / 1000 / 60 / 60 / 24;
      var roomsPrice = (stayPrice * parseInt(rooms));
      var value1 = $("#book_breakfast_adult").val();
      var price1 = $("#book_breakfast_adult").find("option:selected").data("price");
      var value2 = $("#book_breakfast_children").val();
      var price2 = $("#book_breakfast_children").find("option:selected").data("price");
      var value3 = $("#book_adult").val();
      var price3 = $("#book_adult").find("option:selected").data("price");
      var value4 = $("#book_children").val();
      var price4 = $("#book_children").find("option:selected").data("price");
      document.getElementById('room_totalPrice_result').innerText = roomsPrice + price1 + price2 + price3 + price4;
   });
  
   $('#book_adult').change(function(){
	   $('#book_breakfast_adult').val("");
      if($('#book_room_name').val()=="" || $('#book_rooms').val()==""){
         alert("객실 선택후 인원 설정이 가능합니다.");
         $('#book_adult').val("");
         document.getElementsByName("#book_room_name")[0].focus();
      } 
      if(Number($('#book_adult').val()) + Number($('#book_children').val()) >= 5){
         alert("총 인원은 4인을 초과할 수 없습니다.");
         $('#book_adult').val("");
      }
      var value = $("#book_room_name").val(); //객실명
      var price = $("#book_room_name").find("option:selected").data("price"); // 객실가격
      var rooms = $("#book_rooms").find("option:selected").val();
      var stayPrice = price * (Date.parse($('#book_checkout').val()) - Date.parse($('#book_checkin').val())) / 1000 / 60 / 60 / 24;
      var roomsPrice = (stayPrice * parseInt(rooms));
      var value1 = $("#book_breakfast_adult").val();
      var price1 = $("#book_breakfast_adult").find("option:selected").data("price");
      var value2 = $("#book_breakfast_children").val();
      var price2 = $("#book_breakfast_children").find("option:selected").data("price");
      var value3 = $("#book_adult").val();
      var price3 = $("#book_adult").find("option:selected").data("price");
      var value4 = $("#book_children").val();
      var price4 = $("#book_children").find("option:selected").data("price");
      document.getElementById('room_totalPrice_result').innerText = roomsPrice + price1 + price2 + price3 + price4;
   });
   
   $('#book_breakfast_adult').change(function(){

      if($('#book_room_name').val()=="" || $('#book_rooms').val()==""){
         alert("객실 선택후 조식 추가가능합니다.");
         $('#book_breakfast_adult').val("");
         document.getElementsByName("#book_room_name")[0].focus();
      }  else if($('#book_adult').val() < $('#book_breakfast_adult').val()){
         alert("조식신청은 인원수를 초과할 수 없습니다.");
         $('#book_breakfast_adult').val("");
      }
   });
   
   $('#book_breakfast_children').change(function(){
      if($('#book_room_name').val()=="" || $('#book_rooms').val()==""){
         alert("객실 선택후 조식 추가가능합니다.");
         $('#book_breakfast_children').val("");
         document.getElementsByName("#book_room_name")[0].focus();
      } else if($('#book_children').val() < $('#book_breakfast_children').val()){
         alert("조식신청은 인원수를 초과할 수 없습니다.");
         $('#book_breakfast_children').val("");
      }
   });
   
   $('#book_bed').change(function(){
      if($('#book_room_name').val()=="" || $('#book_rooms').val()==""){
         alert("객실 선택후 베드 추가가 가능합니다.");
         $('#book_bed').val("0");
         document.getElementsByName("#book_room_name")[0].focus();
      }
   });
   
   
});

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
               <h1>Reservation</h1>
            </div>
         </div>
      </div>
   </div>
</section>
<!-- //sub_banner -->

<!-- body -->
<div class="content">
   <div class="sub_wrapper">
      <div class="reservation_box">
         <form name="reservationForm" class="reserv_l_box" action="${pageContext.request.contextPath}/sub/reservationPro" method="post">
            <h3 class="reserv_tt">Reservation Form</h3>
            <div class="reserv_ip_2">
               <div class="r_ip_box">
                  <label for="">체크인</label>
                  <div style="position: relative;">
<!--                      <span class="fa fa-calendar icon" style="position: absolute; right: 10px; top: 16px;"></span> -->
                     <input type='date' class="form-control" id='book_checkin' name="book_checkin" required="required" placeholder="체크인"/>
                  </div>
               </div>
               <div class="r_ip_box">
                  <label for="">체크아웃</label>
                  <div style="position: relative;">
<!--                      <span class="fa fa-calendar icon" style="position: absolute; right: 10px; top: 16px;"></span> -->
                     <input type='date' class="form-control" id='book_checkout' name="book_checkout" required="required" placeholder="체크아웃"/>
                  </div>
               </div>
            </div>
            <div class="reserv_ip_1">
               <div class="r_ip_box">
                  <label for="room">객실선택</label>
                  <select name="book_room_name" id="book_room_name" class="form-control" required="required">
                     <option value="" data-price="0">객실을 선택해주세요</option>
                     <option value="스탠다드 트윈" data-price="100000">스탠다드 트윈</option>
                     <option value="디럭스 더블" data-price="110000">디럭스 더블</option>
                     <option value="디럭스 트윈" data-price="120000">디럭스 트윈</option>
                     <option value="디럭스 온돌" data-price="130000">디럭스 온돌</option>
                     <option value="슈퍼 디럭스 테라스" data-price="140000">슈퍼 디럭스 테라스</option>
                  </select>
<!--                   <label for="room">객실금액</label> -->
<!--                   <div id="room_price_result"></div> -->
               </div>
            </div>
            <div class="reserv_ip_1">
               <div class="r_ip_box">
                  <label for="room">객실금액</label>
                  <div id="room_price_result" class="room_price_result">0</div>
               </div>
            </div>
            <div class="reserv_ip_3">
               <div class="r_ip_box">
                  <label for="room">객실</label>
                  <select name="book_rooms" id="book_rooms" class="form-control" required="required">
                     <option value="">선택해주세요</option>
                     <option value="1">1</option>
                     <option value="2">2</option>
                     <option value="3">3</option>
                     <option value="4">4</option>
                     <option value="5">5</option>
                  </select>
               </div>
               <div class="r_ip_box">
                  <label for="room">성인</label>
                  <select name="book_adult" id="book_adult" class="form-control" required="required">
                     <option value="" data-price="0">선택해주세요</option>
                     <option value="0" data-price="0">0</option>
                     <option value="1" data-price="0">1</option>
                     <option value="2" data-price="0">2</option>
                     <option value="3" data-price="0">3</option>
                     <option value="4" data-price="0">4</option>
                  </select>
               </div>
               <div class="r_ip_box">
                  <label for="room">아동</label>
                  <select name="book_children" id="book_children" class="form-control" required="required">
                     <option value="" data-price="0">선택해 주세요</option>
                     <option value="0" data-price="0">0</option>
                     <option value="1" data-price="0">1</option>
                     <option value="2" data-price="0">2</option>
                     <option value="3" data-price="0">3</option>
                     <option value="4" data-price="0">4</option>
                  </select>
               </div>
            </div>
            <div class="reserv_ip_3">
               <div class="r_ip_box">
                  <label for="room">베드추가</label>
                  <select name="book_bed" id="book_bed" class="form-control">
                     <option value="0">0</option>
                     <option value="1">1</option>
                     <option value="2">2</option>
                  </select>
               </div>
               <div class="r_ip_box">
                  <label for="room">성인조식</label>
                  <select name="book_breakfast_adult" id="book_breakfast_adult" class="form-control" required="required">
                     <option value="" data-price="0">선택해 주세요</option>
                     <option value="0" data-price="0">0</option>
                     <option value="1" data-price="30000">1</option>
                     <option value="2" data-price="60000">2</option>
                     <option value="3" data-price="90000">3</option>
                     <option value="4" data-price="120000">4</option>
                  </select>
               </div>
               <div class="r_ip_box">
                  <label for="room">아동조식</label>
                  <select name="book_breakfast_children" id="book_breakfast_children" class="form-control" required="required">
                     <option value="" data-price="0">선택해 주세요</option>
                     <option value="0" data-price="0">0</option>
                     <option value="1" data-price="20000">1</option>
                     <option value="2" data-price="40000">2</option>
                     <option value="3" data-price="60000">3</option>
                     <option value="4" data-price="80000">4</option>
                  </select>
               </div>
            </div>
            <div class="reserv_ip_1">
               <div class="r_ip_box">
                  <label for="room">총 결제금액</label>
                  <div id="room_totalPrice_result" class="room_totalPrice_result">0</div>
               </div>
            </div>
            <div class="reserv_ip_1">
               <div class="r_ip_box">
                  <label for="message">문의사항</label>
                      <textarea name="book_reqmatter" id="book_reqmatter" class="form-control " cols="30" rows="8" placeholder="호텔 이용 시 문의하실 사항이 있으시면 입력해 주세요."></textarea>
               </div>
            </div>
            <input type="submit" value="RESERVE NOW" class="btn btn-primary">
         </form>
         <div class="reserv_r_box">
            <h3 class="reserv_tt">Featured Room</h3>
            <div class="reserv_img">
               <img alt="객실사진" src="${pageContext.request.contextPath}/resources/upload/${roomDTO.room_file}">
            </div>
            <div class="reserv_info_txt">
               <h4>${roomDTO.room_name }</h4>
               <ul>
                  <li><span class="ion-ios-people-outline"></span>${roomDTO.room_guest }명</li>
                  <li><span class="ion-ios-crop"></span>${roomDTO.room_size }m<sup>2</sup></li>
               </ul>
               <p>
               	  ${roomDTO.room_infotext }
               </p>
               <input type="button" value="ROOM VIEW" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/sub/roomDetail?room_idx=${roomDTO.room_idx }'">
            </div>
         </div>
      </div>
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
<script>
// $('#book_checkin, #book_checkout').datepicker({

// });
</script>

</body>
</html>