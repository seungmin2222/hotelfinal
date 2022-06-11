<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, maximum-sclale=1">
<title>Home Page</title>
<link rel="stylesheet"
   href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
   integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
   crossorigin="anonymous" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminStyle.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>           
<script type="text/javascript">

function getFormatDate(date){
   var year = date.getFullYear();
   var month = (1+date.getMonth());
   month = month >= 10 ? month : '0' + month;
   var day = date.getDate();
   day = day >= 10 ? day : '0' + day;
   return year + "-" + month + "-" + day;
}
        // 입실자 관리
        var date = getFormatDate(new Date()); 
       $(document).ready(function(){
         $("#checkin_member").click(function(){
            $.ajax({
               url: '${pageContext.request.contextPath}/admin/adminPageControl',
               dataType:'json',
               success:function(rdata){
                  $.each(rdata,function(index, item){
                     if(date === item.book_checkin){
                        $('#checkin_table').append('<tr><td>'+item.book_user+'</td><td>'+item.book_number+'</td><td>'+item.book_room_name+'</td><td>'+item.book_checkin+'</td><td>'+item.book_checkout+'</td><td>'+item.book_adult+'</td><td>'+item.book_children+'</td></tr>');
                     }
                  });
               }
            });
                  $(this).unbind();
         });
       });
        
       
       $(document).ready(function(){
           $("#member2").click(function(){
             $('#member_check').html("<tr><td>예약자</td><td>예약번호</td><td>방</td><td>체크인</td><td>체크아웃</td><td>어른</td><td>어린이</td></tr>");
              $.ajax({
                 url: '${pageContext.request.contextPath}/admin/adminPageControl',
                 dataType:'json',
                 success:function(rdata){
                    $.each(rdata,function(index, item){
                           if(  item.book_user === $('#id').val() ){
                          $('#member_check').append('<tr><td>'+item.book_user+'</td><td>'+item.book_number+'</td><td>'+item.book_room_name+'</td><td>'+item.book_checkin+'</td><td>'+item.book_checkout+'</td><td>'+item.book_adult+'</td><td>'+item.book_children+'</td></tr>');
                       }
//                        }
                    });
                 }
//               $(this).unbind();
              });
           });
        
       $("#id").keydown(function(e) {
           if (e.keyCode == 13) {
//               
            $("#member2").click();
              // Do Something
              // 검색 버튼 클릭 효과라던지..
               //$("#btnSearch").trigger('click');
           }
      });
       
   });       
       
</script>

</head>



<body>
	<div class="main-content">
		<main>
			<!-- 상단 박스 -->
	   		<jsp:include page="../inc/admin_topBox.jsp"></jsp:include>
	   		<!-- 상단 박스종료 -->
         
<!--       --------------------------------------------------------------------------------- -->

<div class="adminBook_wrapper">
	<div class = "adminBookLeftBox">
		<h2 class="member_page_title">금일 입실자</h2>
		<button type="button" class="adminBookBtn" id="checkin_member" value="금일 입실자" >check in</button>
		<table border = "1" class="checkin_table" id="checkin_table">
			<tr>
				<td>예약자</td>
				<td>예약번호</td>
				<td>방</td>
				<td>체크인</td>
				<td>체크아웃</td>
				<td>어른</td>
				<td>어린이</td>
			</tr>
		</table>
	</div> 
	<div class="adminBookRightBox">
		<form id="login-form" class="adminBookMemberFrom" onsubmit="return false">
			<h2 class="member_page_title">회원검색</h2>
			<input type="text" class="adminBookSearch"id="id" name="member_id" placeholder="아이디를 입력해 주세요" required><i class="validation"><span></span><span></span></i>
			<button type="button" class="adminBookBtn2" id="member2"  name="member2" >회원 예약 검색</button>
			<table border = "1" class="adminBookmemberTable" id="member_check">
				<tr>
					<td>예약자</td>
					<td>예약번호</td>
					<td>방</td>
					<td>체크인</td>
					<td>체크아웃</td>
					<td>어른</td>
					<td>어린이</td>
				</tr>
			</table>
		</form>
	</div>
</div>
      
      </main>
   </div>
 

   <jsp:include page="../inc/admin_element.jsp"></jsp:include>



</body>

</html>