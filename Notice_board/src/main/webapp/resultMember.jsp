<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.css" />
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body class="mx-auto" style="width: 75%;">

<jsp:include page="/menu.jsp" />

<div class="bg-warning-subtle text-black text-center d-flex justify-content-center align-items-center" style="min-height: 800px;">
    <div class="col">
    	<div class="row">
        	<h1 class="display-3">회원정보</h1>
    	</div>
    <div class="row">
    	<div class="container" align="center">
        	<%
            	String msg = request.getParameter("msg");

            	if (msg != null) {
            	    if (msg.equals("0"))
               	     out.println(" <h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
           	     	else if (msg.equals("1"))
              	     out.println(" <h2 class='alert alert-danger'>회원가입을 축하드립니다.</h2>");
              		else if (msg.equals("2")) {
                   	 String loginId = (String) session.getAttribute("sessionId");
                  	 out.println(" <h2 class='alert alert-danger'>" + loginId + "님 환영합니다</h2>");
               	 	}               
           		} else {
                	out.println("<br><h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
            	}
        	%>
    	</div>
    </div>
    </div>  
</div>

<jsp:include page="/footer.jsp" />


</body>
</html>