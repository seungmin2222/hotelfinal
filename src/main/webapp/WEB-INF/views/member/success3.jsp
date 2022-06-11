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
	alert("회원가입에 성공했습니다!");
	location.href="${pageContext.request.contextPath}/member/login";
</script>
</body>
</html>