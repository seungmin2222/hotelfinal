<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>객실 정보 </h1>
객실 번호: ${roomInfo.room_number}<br>
객실 종류: ${roomInfo.room_name}<br>

<c:choose>
<c:when test="${roomInfo.room_user eq null }">
배정 가능한 객실입니다.

	<form action="${pageContext.request.contextPath}/admin/RoomUsageInfoPro" method="get">
    <input name="room_number" type="hidden" value="${roomInfo.room_number}">
    <input name="room_name" type="hidden" value="${roomInfo.room_name}">
	
	<select name="book_number" required="required">
	<c:forEach var='state0' items='${checkinUser0}'>
	<option value="${state0.book_number}"> 예약 고객 : ${state0.book_user_name}, 예약 객실 : ${state0.book_room_name}, 예약 코드 : ${state0.book_number }</option>
	
	</c:forEach>
	</select>
	<br>
	<textarea name="etc"></textarea>
	
    <input type="submit" value="배정하기">
    </form>


</c:when>
<c:otherwise>
사용 중인 객실입니다.<br>
회원 이름 : ${roomInfo.room_user}<br>
체크인 : ${roomInfo.room_checkin}<br>
체크아웃 : ${roomInfo.room_checkout}<br>
기타 사항 : ${roomInfo.room_etc}

<form action="${pageContext.request.contextPath}/admin/roomChange" method="get">
<input name="room_number" type="hidden" value="${roomInfo.room_number}">

<input type="submit" value="방 변경(퇴실)">
</form>

</c:otherwise>
</c:choose>
<br>

</body>
</html>