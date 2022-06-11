<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <header role="banner">
      <nav class="navbar navbar-expand-md navbar-dark bg-light">
         <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/main">ITWILL HOTEL</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample05" aria-controls="navbarsExample05" aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
            </button>
         
            <div class="collapse navbar-collapse navbar-light" id="navbarsExample05">
               <ul class="navbar-nav ml-auto pl-lg-5 pl-0">
                  <li class="nav-item">
                     <a class="nav-link active" href="${pageContext.request.contextPath}/sub/rooms">Rooms</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="${pageContext.request.contextPath}/sub/facilities">Facilities</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="${pageContext.request.contextPath}/board/notice">Notice</a>
                  </li>
                   <li class="nav-item dropdown">
                     <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/board/faq" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Community</a>
                     <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/board/faq">FAQ</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/board/qna">Q&A</a>
                     </div>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="${pageContext.request.contextPath}/sub/location">location</a>
                  </li>
<!--                   <li class="nav-item dropdown"> -->
<!--                      <a class="nav-link dropdown-toggle" href="rooms.html" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Admin</a> -->
<!--                      <div class="dropdown-menu" aria-labelledby="dropdown04"> -->
<!--                         <a class="dropdown-item" href="rooms.html">Room Videos</a> -->
<!--                         <a class="dropdown-item" href="rooms.html">Presidential Room</a> -->
<!--                         <a class="dropdown-item" href="rooms.html">Luxury Room</a> -->
<!--                         <a class="dropdown-item" href="rooms.html">Deluxe Room</a> -->
<!--                      </div> -->
<!--                   </li> -->
               </ul>
               <c:if test="${empty sessionScope.member_id}">
               <ul class="navbar-nav ml-auto pl-lg-5 pl-0">
                  
                   <li class="nav-item">
                     <a class="nav-link" href="${pageContext.request.contextPath}/member/login">로그인</a>
                   </li> 
                  <li class="nav-item">
                     <a class="nav-link" href="${pageContext.request.contextPath}/member/insert">회원가입</a>
                   </li>
                   <li class="nav-item">
                     <a class="nav-link" href="${pageContext.request.contextPath}/member/login2">예약조회</a>
                   </li>
                   <li class="nav-item">
                     <a class="nav-link" href="${pageContext.request.contextPath}/member/login3">예약</a>
                   </li>
                        
<!--                    <li class="nav-item"> -->
<%--                      <a class="nav-link" href="${pageContext.request.contextPath}/admin/adminPage">관리자페이지</a> --%>
<!--                    </li> -->

               </ul>
               </c:if>

               <c:if test="${!empty sessionScope.member_id}">
                     <ul class="navbar-nav ml-auto pl-lg-5 pl-0">
                  <c:choose>
               
                     <c:when test="${sessionScope.member_id  ==  'admin'}" >
                        <li class="nav-item">
                          <a class="nav-link" href="${pageContext.request.contextPath}/admin/adminPage">관리자페이지</a>   
                         </li>
                     </c:when >
                  
                     <c:otherwise >
                        <li class="nav-item">
                          <a class="nav-link">${sessionScope.member_id}님</a>  
                          </li>
                     </c:otherwise>
                  </c:choose>
                     
                   <li class="nav-item">
                     <a class="nav-link" href="${pageContext.request.contextPath}/member/logout">로그아웃</a><br>
                     
                   </li>
                  <li class="nav-item">
                     <a  class="nav-link" href="${pageContext.request.contextPath}/member/myInfo">마이페이지</a><br>
                   </li>
                   
                   <li class="nav-item">
                     <a class="nav-link" href="${pageContext.request.contextPath}/member/myReservation">예약조회</a>
                   </li>
                   
                   <li class="nav-item">
                     <a class="nav-link" href="${pageContext.request.contextPath}/sub/reservation2">예약</a>
                   </li>
                 
               </ul>
                  </c:if>
            </div>
         </div>
      </nav>
    </header>