<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Scripting Tag</title>
</head>
<body>

<!-- HTML 주석 -->

<% //주석이 된다
	int a = 2;
	int b = 3;
	int sum = a + b;
	out.println("2 + 3 = "+sum);
%>

</body>
</html>