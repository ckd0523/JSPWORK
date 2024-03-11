<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>Home</title>
</head>
<body class="mx-auto" style="width: 75%;">

	<jsp:include page="/menu.jsp" />
	
		<div class="bg-warning-subtle text-black text-center" style="min-height: 400px;">
		   <div class="col">
		   <div class="row d-flex justify-content-center align-items-center" style="min-height: 300px;">
		   <h1 class="display-1">게시판에 오신것을 환영합니다.</h1> 
		   </div>
		   <div class="row" style="min-height: 50px;">
		    <h3>Welcome to Notice Board!</h3>
		   </div>
		   <div class="row" style="min-height: 50px;">
		    <%
					
				//response.setIntHeader("Refresh", 5);
					
				Date day = new java.util.Date();
				String am_pm;
					
				int hour = day.getHours();
				int minute = day.getMinutes();
				int second = day.getSeconds();
					
				if(hour/12 == 0){
					am_pm="AM";
				}else{
					am_pm="PM";
					hour = hour-12;
				}
					
				String CT = hour + ":" +minute+":"+second+" "+am_pm;
				//out.println("현재 접속 시간 : "+CT+"\n");
					
			%>
				<p>현재 접속 시간 : <%=CT%> <i class="bi-alarm"></i>
		    </div>
		</div>
		</div>

	
	<jsp:include page="/footer.jsp" />

</body>
</html>