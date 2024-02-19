<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<body>

<%!
	int pageCount = 0;
	void addCount(){
		pageCount++;
	}
%>

<%
	addCount();
%>
<p>
	이 사이트 방문은 <%=pageCount%>번째 입니다.
</p>

</body>
</html>