<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/adminStyle.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
<style>
#inUse {
	width: 150px;
	height: 75px;
	margin: 5px;
	background-color: green;
}

#empty {
	width: 150px;
	height: 75px;
	margin: 5px;
}

#user0 {
	width: 75px;
	height: 20px;
	margin: 5px;
	background-color: orange;
}

#user1 {
	width: 75px;
	height: 20px;
	margin: 5px;
	background-color: rgb(13, 126, 126);
}

#dbSetting {
	width: 20px;
	height: 20px;
	margin: 5px;
}
</style>

<body>
	<jsp:include page="../inc/admin_element.jsp"></jsp:include>

	<div class="main-content">
		<main>

			<c:forEach items="${roominfoDTOList}" var="room">
				<c:if test="${room.room_user ne null}">
					<button id="inUse" onclick="popup(this.value)"
						value="${room.room_number}">
						${room.room_number}<br>${room.room_user}님 입실<br>${room.room_name}</button>
				</c:if>
				<c:if test="${room.room_user eq null}">
					<button id="empty" onclick="popup(this.value)"
						value="${room.room_number}">
						${room.room_number}<br>
						<br>${room.room_name}</button>
				</c:if>

			</c:forEach>
			<!-- 
			1. forEach(반복문) 코드에서 model 객체로 받아온 "roomInfoDTOList"를 "room"으로 변수 선언.
			2. 이 반복문을 통하여 "roomInfoDTOList"의 모든 list를 하나씩 뽑아서 나열하게 됨.
			3. if 문을 통하여 roomInfo DB의 한 행에서 room_user 값이 있는 경우와 없는 경우를 나눠서 button의 색을 나눠줌.
			4. 색은 style에서 id값을 줘서 지정 해줬음.
			5. onclick 뒤에 popup(this.value)는 선택된 value 값을 파라미터로 가져가서 popup이라는 함수를 실행한다는 말임.   -->

			<br>

			<script>
				function popup(room_number) {
					// 				alert(room_number); //잘되는것 확인함
					var options = 'width=800px,height=1200px,scrollbars=yes';
					var num = room_number;
					window.open(
							'${pageContext.request.contextPath}/admin/RoomUsageInfo?num='
									+ num + '', "호실사용정보", options);
				}
			</script>
			<%-- <c:forEach var='todayUser' items='${todayCheckInUser}'> <button id="user1" onclick="window.open('${pageContext.request.contextPath}/admin/userInfo?member_id=${todayUser.book_user}+&code=${todayUser.book_number}','입실자 정보', 'width=600px,height=800px,scrollbars=yes')" >${todayUser.book_user}</button> </c:forEach>			 --%>
			<br>금일 입실 예약 인원 :
			<c:forEach var='todayUser' items='${AllCheckinUser}'>${todayUser.book_user_name}, </c:forEach>

			<br>방 배정 미완료 :
			<c:forEach var='state0' items='${checkinUser0}'>
				<button id="user0"
					onclick="window.open('${pageContext.request.contextPath}/admin/userInfo?code=${state0.book_number}+&member_id=${state0.book_user_id}','예약정보','width=800px,height=1200px,scrollbars=yes')">${state0.book_user_name}</button>
			</c:forEach>
			<br>방 배정 완료 :
			<c:forEach var='state1' items='${checkinUser1}'>
				<button id="user1"
					onclick="window.open('${pageContext.request.contextPath}/admin/userInfo_checkin?code=${state1.book_number}+&member_id=${state1.book_user_id}','예약정보','width=800px,height=1200px,scrollbars=yes')">${state1.book_user_name}</button>
			</c:forEach>


		</main>

	</div>
</body>

</html>