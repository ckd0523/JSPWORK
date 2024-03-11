<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.css" />
<script type="text/javascript">
	function checkForm() {
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
</script>			
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body class="mx-auto" style="width: 75%;">

<jsp:include page="/menu.jsp" />

<div class="bg-warning-subtle text-black text-center d-flex justify-content-center align-items-center" style="min-height: 800px;">
    <div class="col-sm-8">
        <div class="row mb-3">
            <h1 class="display-3">회원가입</h1>
        </div>
        <div class="container" align="center">
            <form name="newMember" class="form-signin"  action="processAddMember.jsp" method="post" onsubmit="return checkForm()">
                
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingID" placeholder="ID" name='id' required autofocus>
                    <label for="floatingID">아이디</label>
                </div>
                
                <div class="form-floating mb-3">
                    <input name="password" type="text" class="form-control" id="floatingPasswd" placeholder="password" required>
                    <label for="floatingPasswd">비밀번호</label>
                </div>
                
                <div class="form-floating mb-3">
                    <input name="password_confirm" type="text" class="form-control" placeholder="password confirm" id="floatingPasswdC" required>
                    <label for="floatingPasswdC">비밀번호 확인</label>
                </div>
                
                <div class="form-floating mb-3">
                    <input name="name" type="text" class="form-control" placeholder="name confirm" id="floatingName" required>
                    <label for="floatingName">이름</label>
                </div>
                
                <div class="form-floating mb-3">
                    <input name="phone" type="text" class="form-control" placeholder="phone" id="floatingPhone" required>
                    <label for="floatingPhone">전화번호</label>
                </div>
                
                <div class="form-floating mb-3">
                    <input name="address" type="text" class="form-control" placeholder="address" id="floatingAdd">
                    <label for="floatingAdd">주소</label>
                </div>
                
                <div class="row">
                    <div class="col-sm-offset-2 col-sm-12 mb-3">
                        <input type="submit" class="btn btn-outline-secondary" value="등록" >
                        <input type="button" class="btn btn-outline-secondary" value="취소" onclick="location.href='./home.jsp'" >
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="/footer.jsp" />

</body>
</html>