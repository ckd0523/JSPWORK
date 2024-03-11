<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch18.com.model.LoginBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC</title>
</head>
<body>
	<p>로그인 성공했습니다.
	<p><%
		LoginBean bean = (LoginBean) request.getAttribute("bean");
		out.print("아이디 : "+bean.getId()+"<br>");
		out.print("비밀번호 : "+bean.getPassword());
	%>
</body>
</html>