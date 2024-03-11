<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.css" />
<meta charset="UTF-8">
<title>Login</title>
</head>
<body class="mx-auto" style="width: 75%;">

<jsp:include page="/menu.jsp" />

<div class="bg-warning-subtle text-black text-center d-flex justify-content-center align-items-center" style="min-height: 800px;">
    <div class="col">
        <div class="row">
            <h1 class="display-3">로그인</h1>
        </div>
        <div class="row">
            <div class="container" align="center">
                <div class="col-md-4 col-md-offset-4">
                    <h3 class="form-signin-heading mb-3">Please sign in</h3>
                    <%
                        String error = request.getParameter("error");
                        if (error != null) {
                            out.println("<div class='alert alert-danger'>");
                            out.println("아이디와 비밀번호를 확인해 주세요");
                            out.println("</div>");
                        }
                    %>
                
                    <form class="form-signin" action="processLogin.jsp" method="post">
                    
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="ID" name='id' required autofocus>
                            <label for="floatingInput">ID</label>
                        </div>
                        
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name='password' required>
                            <label for="floatingPassword">Password</label>
                        </div>
                        
                        <button class="btn btn-outline-secondary mb-3" type="submit">로그인</button>
                        
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

	

<jsp:include page="/footer.jsp" />

</body>
</html>