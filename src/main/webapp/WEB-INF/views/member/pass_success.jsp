<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WEB-INF/views/member/success.jsp</title>
</head>
<body>
<script type="text/javascript">
	alert("비밀번호가 수정되었습니다!");
	location.href="${pageContext.request.contextPath}/member/login";
</script>
</body>
</html>