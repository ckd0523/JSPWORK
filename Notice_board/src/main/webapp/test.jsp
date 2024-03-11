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
    	<div class="col">
    		<div class="row">
        		<h1 class="display-3">회원가입</h1>
    		</div>
    		<div class="row">
    		
    		</div>
		</div>  
	</div>

<jsp:include page="/footer.jsp" />

</body>
</html>