<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    		
            <!-- 객실 게시판 폼 -->
            <div class="roomManagementForm">
            	<!-- 객실 게시물 1개영역 -->
            	<c:forEach var="roomDTO" items="${roomList }">
	            	<div class="roomPostBox" onclick="location.href='${pageContext.request.contextPath}/admin/adminRoomContent?room_idx=${roomDTO.room_idx }'">
	            		<div class="roomImage">
	            			<img alt="객실 사진" src="${pageContext.request.contextPath}/resources/upload/${roomDTO.room_file}">
	            		</div>
	            		<div class="roomTextBox">
	            			<h1 class="roomName">
	            				${roomDTO.room_name }
	            			</h1>
	            			<ul class="roomInfo">
	            				<li>
	            					<span class="ion-ios-people-outline"></span>
	            					${roomDTO.room_guest }명
	            				</li>
	            				<li>
									<span class="ion-ios-crop"></span>
									${roomDTO.room_size } m <sup>2</sup>
								</li>
	            			</ul>
	            			<p class="roomInfoText">
	            				${roomDTO.room_infotext }
	            			</p>
	            		</div>
	            	</div>
            	</c:forEach>
            	<!-- 객실 게시물 1개영역 종료 -->
            		
            	
            	<!-- 게시판 하단 버튼영역 -->
            	<div class="roomManagementBtnSpace">
            		<input type="button" value="객실등록" class="ManagementBtn" onclick="location.href='${pageContext.request.contextPath}/admin/adminRoomWrite'">
            	</div>
            	<!-- 게시판 하단 버튼영역 종료 -->
            	
            	
            	<!-- 페이징영역 -->
<!--             	<div class="pageControl"> -->
<%--             		<c:if test="${pageDTO.startPage > pageDTO.pageBlock }"> --%>
<%--             			<a href="${pageContext.request.contextPath }/admin/adminRoom?pageNum=${pageDTO.startPage - pageDTO.pageBlock }">이전</a> --%>
<%--             		</c:if> --%>
<%--             		<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1"> --%>
<%-- 	            		<a href="${pageContext.request.contextPath }/admin/adminRoom?pageNum=${i}">${i}</a> --%>
<%--             		</c:forEach> --%>
<%--              		<c:if test="${pageDTO.startPage < pageDTO.pageBlock }"> --%>
<%--              			<a href="${pageContext.request.contextPath }/admin/adminRoom?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">다음</a> --%>
<%--              		</c:if> --%>
<!--             	</div> -->
            	<!-- 페이징영역 종료 -->
            </div>
            <!-- 객실 게시판 폼 종료 -->
    	</main>
    </div>
</body>

</html>