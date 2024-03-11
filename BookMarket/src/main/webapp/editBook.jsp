<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>도서 편집</title>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 도서을 삭제합니다!!") == true)
			location.href = "./deleteBook.jsp?id=" + id;
		else
			return;
	}
</script>
</head>
<%
	String edit = request.getParameter("edit");
%>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class = "jumbotron">
		<div class="container">
			<h1 class="display-3">도서 편집</h1>
		</div>
	</div>
	<div class = "container">
		<div class="row" align="center">
			<%@ include file = "dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select*from book";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
			%>
			<div class="col-md-4" align="center" style="padding-top 20px">
			<img src="/upload/<%=rs.getString("b_fileName")%>" style="width: 50%">
	
			</div>
			<div class="col-md-6">
		
			<p><h5><b>[<%= rs.getString("b_category") %>]<%=rs.getString("b_name")%></b></h5>
			<p style="padding-top 20px"><%=rs.getString("b_description")%> 
			<p>| <%=rs.getString("b_author")%> | <%=rs.getString("b_publisher")%> | <%=rs.getString("b_unitPrice")%>원 | </p>
	
				<p><%
					if(edit.equals("update")){
				%>
				<a href="./updateBook.jsp?id=<%=rs.getString("b_id")%>" class="btn btn-success" role="button">수정 &raquo;></a>
			<%
					} else if (edit.equals("delete")) {
			%>
			<a href="#" onclick="deleteConfirm('<%=rs.getString("b_id")%>')" class="btn btn-danger" role="button">삭제 &raquo;></a>
			<%
					}
			%>
			</div>
			<%
				}
				if(rs != null){
					rs.close();
				}
				if(pstmt != null){
					pstmt.close();
				}
				if(conn != null){
					conn.close();
				}
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>