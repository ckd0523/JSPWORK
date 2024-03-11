<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.css" />	
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://192.168.111.200:3306/WebMarketDB"
	driver="com.mysql.cj.jdbc.Driver" user="root" password="1234" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM MEMBER WHERE ID=?
   <sql:param value="<%=sessionId%>" />
</sql:query>

<script type="text/javascript">
	function init() {
		setComboMailValue("${mail2}");
		setComboBirthValue("${month}");
	}

	function setComboMailValue(val) {
		var selectMail = document.getElementById('mail2');
		for (i = 0, j = selectMail.length; i < j; i++) {
			if (selectMail.options[i].value == val) {
				selectMail.options[i].selected = true; 
				break;
			}
		}
	}
	function setComboBirthValue(val) {
		var selectBirth = document.getElementById('birthmm'); 
		for (i = 0, j = selectBirth.length; i < j; i++){
			if (selectBirth.options[i].value == val){
				selectBirth.options[i].selected = true; 
				break;
			}
		}
	}
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

<title>회원수정</title>
</head>
<body class="mx-auto" style="width: 75%;" onload="init()">

<jsp:include page="/menu.jsp" />

	<div class="bg-warning-subtle text-black text-center d-flex justify-content-center align-items-center" style="min-height: 800px;">
    <div class="col-sm-8">
        <div class="row mb-3">
            <h1 class="display-3">회원수정</h1>
        </div>
        <c:forEach var="row" items="${resultSet.rows}">
        <div class="container" align="center">
            <form name="newMember" class="form-signin"  action="processUpdateMember.jsp" method="post" onsubmit="return checkForm()">
                
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingID" placeholder="ID" name='id' value="<c:out value='${row.id}'/>" required autofocus>
                    <label for="floatingID">아이디</label>
                </div>
                
                <div class="form-floating mb-3">
                    <input name="password" type="text" class="form-control" id="floatingPasswd" placeholder="password" value="<c:out value='${row.password}'/>" required>
                    <label for="floatingPasswd">비밀번호</label>
                </div>
                
                <div class="form-floating mb-3">
                    <input name="password_confirm" type="text" class="form-control" placeholder="password confirm" id="floatingPasswdC" required>
                    <label for="floatingPasswdC">비밀번호 확인</label>
                </div>
                
                <div class="form-floating mb-3">
                    <input name="name" type="text" class="form-control" placeholder="name confirm" id="floatingName" value="<c:out value='${row.name}'/>" required>
                    <label for="floatingName">이름</label>
                </div>
                
                <div class="form-floating mb-3">
                    <input name="phone" type="text" class="form-control" placeholder="phone" id="floatingPhone" value="<c:out value='${row.phone}'/>" required>
                    <label for="floatingPhone">전화번호</label>
                </div>
                
                <div class="form-floating mb-3">
                    <input name="address" type="text" class="form-control" placeholder="address" id="floatingAdd" value="<c:out value='${row.address}'/>">
                    <label for="floatingAdd">주소</label>
                </div>
                
                <div class="row">
                    <div class="col-sm-offset-2 col-sm-12 mb-3">
                        <input type="submit" class="btn btn-outline-secondary mb-3" value="회원수정" >
                        <a href="deleteMember.jsp" class="btn btn-outline-danger mb-3">회원탈퇴</a>
                    </div>
                </div>
            </form>
        </div>
    </c:forEach>
    </div>
</div>
		
	


<jsp:include page="/footer.jsp" />

</body>
</html>