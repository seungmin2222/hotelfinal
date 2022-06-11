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
			<form action="" method="get" class="roomWriteForm" enctype="multipart/form-data">
				<!-- 객실 게시판 글쓰기 테이블  -->
	            <table class="roomWriteTable">
	            	<tr>
	            		<th>게시물 번호</th>
	            		<td>
	            			<input type="text" name="room_idx" value="${roomDTO.room_idx }" id="room_idx">
	            		</td>
	            	</tr>
	            	<tr>
	            		<th>객실 사진</th>
	            		<td>
	            			<input type="text" value="${roomDTO.room_file }" readonly="readonly">
	            		</td>
	            	</tr>
	            	<tr>
	            		<th>객실 이름</th>
	            		<td>
	            			<input type="text" value="${roomDTO.room_name }" readonly="readonly">
	            		</td>
	            	</tr>
	            	<tr>
	            		<th>객실 가격</th>
	            		<td>
	            			<input type="text" value="${roomDTO.room_price }" readonly="readonly">
	            		</td>
	            	</tr>
	            	<tr>
	            		<th>투숙가능한인원</th>
	            		<td>
	            			<input type="text" value="${roomDTO.room_guest }" readonly="readonly">
	            		</td>
	            	</tr>
	            	<tr>
	            		<th>방크기</th>
	            		<td>
	            			<input type="text" value="${roomDTO.room_size }" readonly="readonly">
	            		</td>
	            	</tr>
	            	<tr>
	            		<th>침대타입</th>
	            		<td>
	            			<input type="text" value="${roomDTO.room_bedType }" readonly="readonly">
	            		</td>
	            	</tr>
	            	<tr>
	            		<th>전망</th>
	            		<td>
	            			<input type="text" value="${roomDTO.room_view }" readonly="readonly">
	            		</td>
	            	</tr>
	            	<tr>
	            		<th>구성</th>
	            		<td>
	            			<input type="text" value="${roomDTO.room_type }" readonly="readonly">
	            		</td>
	            	</tr>
	            	<tr>
	            		<th>체크인/체크아웃</th>
	            		<td>
	            			<input type="text" value="${roomDTO.room_checkinout_time }" readonly="readonly">
	            		</td>
	            	</tr>
	            	<tr>
	            		<th>객실 소개</th>
	            		<td>
	            			<textarea readonly=" ">${roomDTO.room_infotext }</textarea>
	            		</td>
	            	</tr>
	            </table>
	            <!-- 객실 게시판 글쓰기 테이블 종료 -->
	            <!-- 게시판 하단 버튼영역 -->
	           	<div class="roomManagementBtnSpace">
	           		<input type="button" value="글수정" class="ManagementBtn" onclick="location.href='${pageContext.request.contextPath}/admin/adminRoomUpdate?room_idx=${roomDTO.room_idx }'">
	           		<input type="button" value="글삭제" class="ManagementBtn" onclick="location.href='${pageContext.request.contextPath}/admin/adminRoomDeletePro?room_idx=${roomDTO.room_idx }'">
	           		<input type="button" value="글목록" class="ManagementBtn" onclick="location.href='${pageContext.request.contextPath}/admin/adminRoom'">
	           	</div>
	           	<!-- 게시판 하단 버튼영역 종료 -->
			</form>      
            <!-- 객실 등록하기 폼 종료 -->      
    	</main>
    </div>
</body>

</html>