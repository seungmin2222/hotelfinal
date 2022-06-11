<%@page import="com.itwillbs.dao.MemberDAOImpl"%>
<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@page import="com.itwillbs.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// jQuery/idCheck2.jsp
//  'id':$('#id').val()
//  http://localhost:8080/FunWeb/jQuery/idCheck2.jsp?id=kim
//  http://localhost:8080/FunWeb/jQuery/idCheck2.jsp?id=kim123
// id 파라미터 값 가져오기
String member_id=request.getParameter("member_id");
//MemberDAO 객체 생성 
MemberDAOImpl memberDAO=new MemberDAOImpl();
//리턴할형 MemberDTO  getMember(String id) 메서드 호출
MemberDTO memberDTO=memberDAO.getMember(member_id);

if(memberDTO==null){
	//아이디 같은게 없음, 아이디 중복 아님, 아이디 사용가능
	%><script>$("#dupdiv").css("color","blue")
// 	alert("아이디 사용가능!");
	</script>
	아이디 사용가능!<%
}else{
	// 아이디 같은게 있음 , 아이디 중복
	
	%><script>$("#dupdiv").css("color","#ff0000")
// 	alert("아이디 중복!");
	</script>
	아이디 중복!<%
}
%>