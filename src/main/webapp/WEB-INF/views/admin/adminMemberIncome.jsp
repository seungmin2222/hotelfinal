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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>



<body>
     <jsp:include page="../inc/admin_element.jsp"></jsp:include>
    <div class="main-content" >
        <main>
            <div class="cards">
                <div class="card-signle" style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/admin/adminMember'">
                    <div>
                        <h1>55 여기 멤버</h1>
                        <span>Customers</span>
                    </div>
                    <div>
                        <span><i class="far fa-users"></i></span>
                    </div>
                </div>
                <div class="card-signle" style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/admin/adminMemberProject'">
                    <div>
                        <h1>76</h1>
                        <span>Project</span>
                    </div>
                    <div>
                        <span><i class="far fa-clipboard"></i></span>
                    </div>
                </div>
                <div class="card-signle" style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/admin/adminMemberOrders'">
                    <div>
                        <h1>123</h1>
                        <span>Orders</span>
                    </div>
                    <div>
                        <span><i class="far fa-bags-shopping"></i></span>
                    </div>
                </div>
                <div class="card-signle" style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/admin/adminMemberIncome'">
                    <div>
                        <h1>$7k+</h1>
                        <span>Income</span>
                    </div>
                    <div>
                        <span><i class="fas fa-wallet"></i></span>
                    </div>
                </div>
            </div>
            <div class="recent-grid">
                <div class="project">
                    <div class="card">
                        <div class="card-header">
                            <h3>Member List</h3>
                        </div>
                        <div class="card-body">
   <!--리스트가 그려질 부분-->
  								 	<table class="board_table">
   										<tr>
   											<th>회원아이디</th>
   											<th style="width: 65%; text-align: center; padding:0px;">회원이름</th>
   											<th>회원등급</th>
   										</tr>
   										
 
   									</table>
						</div>
                        </div>
                    </div>
                </div>
                
  	      </main>
            </div>
</body>

</html>