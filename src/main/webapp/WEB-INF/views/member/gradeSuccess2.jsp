<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WEB-INF/views/member/success3.jsp</title>
</head>
<body>
<script type="text/javascript">
	alert("회원 등급이 변경되었습니다!");
	location.href="${pageContext.request.contextPath}/member/myReservation";
</script>
</body>
</html>