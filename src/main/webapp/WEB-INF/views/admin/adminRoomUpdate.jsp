<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-sclale=1">
    <title>Home Page</title>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminStyle.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>



<body>
	<!-- admin 왼쪽 메뉴바 -->
	<jsp:include page="../inc/admin_element.jsp"></jsp:include>
    <!-- admin 왼쪽 메뉴바 종료 -->
    <div class="main-content">
    	<main>
			<!-- 상단 박스 -->
    		<jsp:include page="../inc/admin_topBox.jsp"></jsp:include>
    		<!-- 상단 박스종료 -->
    		
            <!-- 객실 등록하기 폼 시작 -->
			<form action="${pageContext.request.contextPath}/admin/adminRoomUpdatePro" method="post" class="roomWriteForm" enctype="multipart/form-data">
				<!-- 객실 게시판 글쓰기 테이블  -->
	            <table class="roomWriteTable">
	            	<tr>
	            		<th>게시물 번호</th>
	            		<td>
	            			<input type="text" name="room_idx" value="${roomDTO.room_idx }" id="room_idx" readonly="readonly">
	            		</td>
	            	</tr>
	            	<tr>
	            		<th>객실 사진</th>
	            		<td>
	            			<input type="file" name="room_file" value="${roomDTO.room_file }" id="room_file" class="room_file_inputBox">
	            		</td>
	            	</tr>
	            	<tr>
	            		<th>객실 이름</th>
	            		<td>
	            			<input type="text" name="room_name" value="${roomDTO.room_name }" id="room_name">
	            		</td>
	            	</tr>
	            	<tr>
	            		<th>객실 가격</th>
	            		<td>
	            			<input type="text" name="room_price" value="${roomDTO.room_price }" id="room_price">
	            		</td>
	            	</tr>

	            	<tr>
	            		<th>투숙가능한인원</th>
	            		<td>
	            			<select name="room_guest" id="room_guest">
	            				<option value="">선택해주세요.</option>
	            				<option value="2"
	            					<c:if test="${roomDTO.room_guest =='2'}">selected</c:if>
	            				>2</option>
	            				<option value="3"
	            					<c:if test="${roomDTO.room_guest =='3'}">selected</c:if>
	            				>3</option>
	            				<option value="4"
	            					<c:if test="${roomDTO.room_guest =='4'}">selected</c:if>
	            				>4</option>
	            			</select>
	            		</td>
	            	</tr>
	            	<tr>
	            		<th>방크기</th>
	            		<td>
	            			<select name="room_size" id="room_size">
	            				<option value="">선택해주세요.</option>
	            				<option value="26"
	            					<c:if test="${roomDTO.room_size =='26'}">selected</c:if>
	            				>26㎡</option>
	            				<option value="33"
            						<c:if test="${roomDTO.room_size =='33'}">selected</c:if>
	            				>33㎡</option>
	            				<option value="36"
	            					<c:if test="${roomDTO.room_size =='36'}">selected</c:if>
	            				>36㎡</option>
	            				<option value="40"
	            					<c:if test="${roomDTO.room_size =='40'}">selected</c:if>
	            				>40㎡</option>
	            				<option value="53"
	            					<c:if test="${roomDTO.room_size =='53'}">selected</c:if>
	            				>53㎡</option>
	            				<option value="63"
	            					<c:if test="${roomDTO.room_size =='63'}">selected</c:if>
	            				>63㎡</option>
	            				<option value="66"
	            					<c:if test="${roomDTO.room_size =='66'}">selected</c:if>
	            				>66㎡</option>
	            				<option value="79"
	            					<c:if test="${roomDTO.room_size =='79'}">selected</c:if>
	            				>79㎡</option>
	            			</select>
	            		</td>
	            	</tr>
	            	<tr>
	            		<th>침대타입</th>
	            		<td>
	            			<select name="room_bedType" id="room_bedType">
	            				<option value="">선택해주세요</option>
	            				<option value="싱글"
	            					<c:if test="${roomDTO.room_bedType =='싱글'}">selected</c:if>
	            				>싱글</option>
	            				<option value="더블"
	            					<c:if test="${roomDTO.room_bedType =='더블'}">selected</c:if>
	            				>더블</option>
	            				<option value="킹"
	            					<c:if test="${roomDTO.room_bedType =='킹'}">selected</c:if>
	            				>킹</option>
	            			</select>
	            		</td>
	            	</tr>
	            	<tr>
	            		<th>전망</th>
	            		<td>
	            			<select name="room_view" id="room_view">
	            				<option value="">선택해주세요.</option>
	            				<option value="시티뷰"
	            					<c:if test="${roomDTO.room_view =='시티뷰'}">selected</c:if>
	            				>시티뷰</option>
	            				<option value="오션뷰"
	            					<c:if test="${roomDTO.room_view =='오션뷰'}">selected</c:if>
	            				>오션뷰</option>
	            				<option value="마운틴뷰"
	            					<c:if test="${roomDTO.room_view =='마운틴뷰'}">selected</c:if>
	            				>마운틴뷰</option>
	            			</select>
	            		</td>
	            	</tr>
	            	<tr>
	            		<th>구성</th>
	            		<td>
	            			<select name="room_type" id="room_type">
	            				<option value="">선택해주세요.</option>
	            				<option value="방1, 화장실1"
	            					<c:if test="${roomDTO.room_type =='방1, 화장실1'}">selected</c:if>
	            				>방1, 화장실1</option>
	            				<option value="방2, 화장실1"
	            					<c:if test="${roomDTO.room_type =='방2, 화장실1'}">selected</c:if>
	            				>방2, 화장실1</option>
	            				<option value="방3, 화장실2"
	            					<c:if test="${roomDTO.room_type =='방3, 화장실2'}">selected</c:if>
	            				>방3, 화장실2</option>
	            			</select>
	            		</td>
	            	</tr>
	            	<tr>
	            		<th>체크인/체크아웃</th>
	            		<td>
	            			<select name="room_checkinout_time" id="room_checkinout_time">
	            				<option value="">선택해주세요.</option>
	            				<option value="15:00 / 11:00"
	            					<c:if test="${roomDTO.room_checkinout_time =='15:00 / 11:00'}">selected</c:if>
	            				>체크인:15:00, 체크아웃:11:00</option>
	            			</select>
	            		</td>
	            	</tr>
	            	<tr>
	            		<th>객실 소개</th>
	            		<td>
	            			<textarea rows="" cols="" name="room_infotext" id="room_infotext">${roomDTO.room_infotext }</textarea>
	            		</td>
	            	</tr>
	            </table>
	            <!-- 객실 게시판 글쓰기 테이블 종료 -->
	            <!-- 게시판 하단 버튼영역 -->
	           	<div class="roomManagementBtnSpace">
	           		<input type="submit" value="수정완료" class="ManagementBtn">
	           		<input type="button" value="목록으로" class="ManagementBtn" onclick="location.href='${pageContext.request.contextPath}/admin/adminRoom'">
	           	</div>
	           	<!-- 게시판 하단 버튼영역 종료 -->
			</form>      
            <!-- 객실 등록하기 폼 종료 -->      
    	</main>
    </div>
</body>

</html>