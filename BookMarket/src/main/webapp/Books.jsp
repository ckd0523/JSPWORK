<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>도서 목록</title>
</head>
<body>

<jsp:include page="menu.jsp"/>
	<div class = "jumbotron">
	
		<%
		//BookRepository dao = BookRepository.getInstance();
		//ArrayList<Book> listOfBooks = dao.getAllBooks(); 
	%>
	
	<div class = "container">
	<h1 class = "display-3">도서 목록</h1>
	</div>
	</div>
	<%
		//ArrayList<Book> listOfBooks = bookDAO.getAllBooks();
	%>
	<div class="container">
	<div class="row" align="left">
	<%@ include file = "dbconn.jsp" %>
	<%
	//	for(int i=0; i<listOfBooks.size(); i++){
	//		Book book = listOfBooks.get(i);
	//./resources/images/
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from book";
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
	
	</div>
	<div class="mt-5" >
	<div class="col" align="center">
	<a href="./Book.jsp?id=<%=rs.getString("b_id")%>" 
		class="btn btn-secondary" role="button">상세 정보 &raquo;></a>
	</div>
	</div>
	<%
		}
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
		conn.close();
	%>
	
	<div class="col-md-12">
	<hr>
	</div>

	</div>
	</div>

	<jsp:include page="footer.jsp"/>

</body>
</html>