<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Scripting Tag</title>
</head>
<body>
	<h2>Scripting Tag</h2>
	
<!-- 선언문 : 변수 메서드 정의 -->
	<%! int count = 3;
		String makeItLower(String data){
			return data.toLowerCase();
		}
	%>
	
<!-- 스크립틀릿 : 자바 로직 코드 작성 -->
	<% 
		for( int i =1; i<=count; i++){
			out.println("Java Server Pages"+i+".<br>");
		}
	%>

<!-- 	표현문 : 결과를 문자열형태로 출력 -->
	<%=makeItLower("Hello World")%>
	
</body>
</html>