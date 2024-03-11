<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<%@ page import="mvc.model.RepleDTO"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	List repleList = (List) request.getAttribute("replelist");
	BoardDTO notice = (BoardDTO) request.getAttribute("board");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="mx-auto" style="height: 100%; width: 75%;">
	
	<div class="bg-warning-subtle text-black text-center d-flex justify-content-center align-items-center" style="min-height: 90vh;">
	
		<div class="row mb-3">
			<div class="container">
				<table>
					<th>게시글 번호</th>
					<th>아이디</th>
					<th>댓글</th>
					<th>댓글 시간</th>
					<%
					for (int j = 0; j < repleList.size(); j++) {
						RepleDTO notice1 = (RepleDTO) repleList.get(j);
					%>
					<tr>
						<td><%=notice1.getReplenum()%></td>
						<td><%=notice1.getId()%></td>
						<td><%=notice1.getReple()%></td>
						<td><%=notice1.getRegist_day()%></td>
					</tr>
					<%
					}
					%>
				</table>
			</div>
		</div>
			<div class="row mb-3">
				<div class="container">
					<form name="repleWrite" action="./BoardRepleWriteAction.do?num=<%=notice.getNum()%>" class="form-horizontal" method="post">
						<input name="reple" type="text" class="form-control" placeholder="댓글">
						<input type="submit" class="btn btn-primary " value="등록">
					</form>
				</div>
			</div>
	
	</div>
</body>
</html>