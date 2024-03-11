<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>상품 목록</title>
</head>
<body>

<jsp:include page="menu.jsp"/>
	<div class = "jumbotron">
	
	<%
		//ProductRepository dao = ProductRepository.getInstance();
		//ArrayList<Product> listOfProducts = dao.getAllProducts(); 
	%>
	
		<div class = "container">
			<h1 class = "display-3">상품 목록</h1>
		</div>
	</div>

	<%
		//ArrayList<Product> listOfProducts = productDAO.getAllProducts();
	%>
	<div class="container">
		<div class="row" align="center">
			<%@ include file = "dbconn.jsp" %>
	<%
		//for(int i=0; i<listOfProducts.size(); i++){
		//	Product product = listOfProducts.get(i);
		//./resources/images/
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from product";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
		
	%>
	<div class="col-md-4">
		
		<img src="/upload/<%=rs.getString("p_fileName")%>" style="width: 100%">
		<h3><%= rs.getString("p_name") %></h3>
		<p><%= rs.getString("p_description") %> </p>
		<p><%= rs.getString("p_UnitPrice") %>원 </p>
		<P><a href="./product.jsp?id=<%=rs.getString("p_id") %>" 
		class="btn btn-secondary" role="button">상세 정보 &raquo;></a>
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
	</div>
	<hr>
	</div>
	<jsp:include page="footer.jsp"/>

</body>
</html>