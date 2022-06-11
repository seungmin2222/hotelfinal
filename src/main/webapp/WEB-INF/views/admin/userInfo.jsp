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
<h1>예약자 정보</h1>
예약번호 : ${reservationDTO.book_number}<br>
이름: ${memberDTO.member_name}<br>
아이디: ${memberDTO.member_id}<br>
등급: ${memberDTO.member_grade}<br>
휴대전화: ${memberDTO.member_phone}<br><br>

예약 객실명 : ${reservationDTO.book_room_name}<br>
객실 수 : ${reservationDTO.book_rooms}<br>
체크인  : ${reservationDTO.book_checkin}<br>
체크아웃 : ${reservationDTO.book_checkout}<br>
기타사항 : ${reservationDTO.book_reqmatter}<br>
<br>
<br>

<form action="${pageContext.request.contextPath}/admin/userInfoPro">
    <label for="room">객실 배정</label><br>
    <select name="assigned_room_name" id="assigned_room_name" required="required" onchange="roomNumber(this)">
       <option >배정할 객실을 선택하세요</option>
       <option value="스탠다드 트윈">스탠다드 트윈</option>
       <option value="디럭스 더블">디럭스 더블</option>
       <option value="디럭스 트윈">디럭스 트윈</option>
       <option value="디럭스 온돌">디럭스 온돌</option>
       <option value="슈퍼 디럭스 테라스">슈퍼 디럭스 테라스</option>
    </select>
    
    <br><select name="assigned_room_number" id="assigned_room_number">
    <option>배정할 호실을 선택하세요</option>
    </select>
    
    <br>
    <textarea name="etc"></textarea><br>
    <input type="hidden" name="book_number" value="${reservationDTO.book_number}">
    <input type="submit" value="배정하기">
    
</form>

<script type="text/javascript">
function roomNumber(name){
	var a = 
		[<c:forEach items="${selectRoom}" var="num">
		<c:if test="${num.room_name.toString() eq '스탠다드 트윈'}">
		'${num.room_number}',
		</c:if>
		</c:forEach>]
	
	var b =
		[<c:forEach items="${selectRoom}" var="num">
		<c:if test="${num.room_name.toString() eq '디럭스 더블'}">
		'${num.room_number}',
		</c:if>
		</c:forEach>]
	
	var c =
		[<c:forEach items="${selectRoom}" var="num">
		<c:if test="${num.room_name.toString() eq '디럭스 트윈'}">
		'${num.room_number}',
		</c:if>
		</c:forEach>]
	
	var d = 
		[<c:forEach items="${selectRoom}" var="num">
		<c:if test="${num.room_name.toString() eq '디럭스 온돌'}">
		'${num.room_number}',
		</c:if>
		</c:forEach>]
	
	var e = 
		[<c:forEach items="${selectRoom}" var="num">
		<c:if test="${num.room_name.toString() eq '슈퍼 디럭스 테라스'}">
		'${num.room_number}',
		</c:if>
		</c:forEach>]
	
	var target = document.getElementById("assigned_room_number")
	
	if(name.value == "스탠다드 트윈") var f = a;
	else if(name.value == "디럭스 더블") var f = b;
	else if(name.value == "디럭스 트윈") var f = c;
	else if(name.value == "디럭스 온돌") var f = d;
	else if(name.value == "슈퍼 디럭스 테라스") var f = e;
	
	target.options.length = 1;
	
	for (x in f) {
		var opt = document.createElement("option");
		opt.value = f[x];
		opt.innerHTML = f[x];
		target.appendChild(opt);
	}
}

</script>
<!--  
1. 스크립트 내에서 JSTL을 이용하여 forEach와 if 코드를 작성하고 변수를 지정해줌.
2. room_name에 따라서 변수가 달라지게 되며, 변수가 달라짐에 따라 var f의 값도 달라짐.
3. var f 값에 따라 생성되는 id=assigned_room_number인 select 태그의 옵션값들이 달라지게 됨.-->
</body>
</html>