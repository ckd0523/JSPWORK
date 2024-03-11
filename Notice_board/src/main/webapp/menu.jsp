<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="./resources/css/bootstrap.css" />
<%
	String sessionId = (String) session.getAttribute("sessionId");
	String sessionName = (String) session.getAttribute("sessionName");
%>

<div align="center">
<nav class="navbar navbar-expand" style="background-color: #e3f2fd;">
	<div class = "container">
		<div class = "navbar-header">
			<a class = "navbar-brand" href="./home.jsp"><i class="bi bi-house-door"></i> Home</a>
		</div>
	
	<div>
		<ul class="navbar-nav mr-auto">
			<c:choose>
					<c:when test="${empty sessionId}">
						<li class="nav-item"><a class="nav-link" href="<c:url value="./loginMember.jsp"/>">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="./addMember.jsp"/>'>회원가입</a>
					</c:when>
					<c:otherwise>
						<li style="padding-top: 7px; color: black">[ <%=sessionName%>(<%=sessionId%>)님 ]</li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="./logoutMember.jsp"/>">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="./updateMember.jsp"/>'>회원수정</a>
					</c:otherwise>
				</c:choose>
                        <li class="nav-item"><a class="nav-link" href="<c:url value="./BoardListAction.do?pageNum=1"/>">게시판</a></li>	
		</ul>
		</div>
		</div>
</nav>
</div>