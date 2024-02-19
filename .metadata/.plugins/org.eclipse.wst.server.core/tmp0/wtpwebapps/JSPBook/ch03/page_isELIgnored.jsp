<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page isELIgnored = "true" %>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<body>

	<%
	request.setAttribute("RequestAttribute", "request 내장 객체");
	%>
	${requestScope.RequestAttribute}

</body>
</html>