<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>           
<script type="text/javascript">
var checkInCNT = 0;
var checkOutCNT = 0;
function getFormatDate(date){
      var year = date.getFullYear();
      var month = (1+date.getMonth());
      month = month >= 10 ? month : '0' + month;
      var day = date.getDate();
      day = day >= 10 ? day : '0' + day;
      return year + "-" + month + "-" + day;
   }
// 오늘 날짜 기준 예약확인
 var date = getFormatDate(new Date()); 
    $(document).ready(function(){
         $.ajax({
            url: '${pageContext.request.contextPath}/admin/adminPageControl',
            dataType:'json',
            success:function(rdata){
               $.each(rdata,function(index, item){
                  // 오늘날짜와 체크인날짜와 같을 때
                  if(date === item.book_checkin){
                     
                     checkInCNT += $("#checkin_count").length;
                  }
               // 오늘날짜와 체크아웃날짜와 같을 때
                  if(date === item.book_checkout){
                     checkOutCNT += $("#checkout_count").length;
                  }
               });
               // 체크인,아웃 갯수 id 값에 집어 넣기
                  $('#checkin_count').append(checkInCNT+'팀');
                  $('#checkout_count').append(checkOutCNT+'팀');
            }
         });
    // 오늘 매출 구하기
    var today_Sales=0;
    $.ajax({
        url: '${pageContext.request.contextPath}/admin/adminPageControl',
        dataType:'json',
        async: false, 
        success:function(rdata){
             $.each(rdata,function(index, item){
                //오늘날짜와 datebase 체크인 날짜 비교
                  if(date === item.book_checkin){
                    // 갑 합치기
                   today_Sales = today_Sales + parseInt(item.book_totalPrice);
                }
              });
             // id 값이 today_Sales인 곳에다가 값 뿌려주기
             $('#today_Sales').append(today_Sales+'원');
           }
         });     
               $(this).unbind();
    });
    
</script>
         

<div class="cards">
   <div class="card-signle">
      <div>
         <h1 >금일 입실자 </h1>
      </div>
      <div>
         <span style = "font-size:1.5em;font-weight:bold" id="checkin_count"></span>
         <span><i class="far fa-users"></i></span>
      </div>
   </div>
   <div class="card-signle">
       <div>
         <h1>금일 퇴실자</h1>
       </div>
       <div>
         <span style = "font-size:1.5em;font-weight:bold" id="checkout_count"></span>
         <span><i class="far fa-clipboard"></i></span>
       </div>
   </div>
   <div class="card-signle">
       <div>
         <h1>금일 예약자</h1>
         <span>Orders</span>
       </div>
       <div>
         <span><i class="far fa-bags-shopping"></i></span>
       </div>
   </div>
   <div class="card-signle">
       <div>
         <h1>일 매출현황</h1>
         <span style = "font-size:1.5em;" id="today_Sales" ></span>
       </div>
       <div>
         <span><i class="fas fa-wallet"></i></span>
       </div>
   </div>
</div>