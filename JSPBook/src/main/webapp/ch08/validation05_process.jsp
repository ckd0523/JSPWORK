<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<h3>입력에 성공했습니다.</h3>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	
	<p> 아이디 : <%=request.getParameter("id")%>
	<p> 아이디 : <%=request.getParameter("passwd")%>
	<p> 아이디 : <%=request.getParameter("name")%>
	<p> 아이디 : <%=request.getParameter("phone1")%>-<%=request.getParameter("phone2")%>-<%=request.getParameter("phone3")%>
	<p> 아이디 : <%=request.getParameter("email")%>
	

</body>
</html>