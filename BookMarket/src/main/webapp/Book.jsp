<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%@ page import="java.sql.*" %>
<%@ include file = "dbconn.jsp" %>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>도서 상세 정보</title>
<script type="text/javascript">
	function addToCart(){
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		}else{
			document.addForm.reset();
		}
	}
</script>
</head>
<body>

<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">도서 정보</h1>
	</div>
	</div>
	
	<%
	
	//String id = request.getParameter("id");
	//BookRepository dao = BookRepository.getInstance();
	//Book book = dao.getBookById(id);
	//Book book = bookDAO.getBookById(id);
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id = request.getParameter("id");
		String sql = "select * from product where b_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()){
	
	//./resources/images/
	%>
		<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="/upload/<%=rs.getString("b_fileName")%>" style="height: 100%">
			</div>
			<div class="col-md-6">
				<h3>[<%= rs.getString("b_category")%>]<%=rs.getString("b_name") %></h3>
				<p><%= rs.getString("b_description") %></p>
				<p> <b>도서 코드 : </b><span class="badge badge-danger">
					<%= rs.getString("b_name") %></span>
				<p> <b>출판사</b> : <%=rs.getString("b_publisher") %>
				<p> <b>저자</b> : <%=rs.getString("b_author") %>
				<p> <b>재고 수</b> : <%=rs.getString("b_unitInStock") %>
				<p> <b>총 페이지 수</b> : <%=rs.getString("b_totalPages") %>
				<p> <b>출판일</b> : <%=rs.getString("b_releaseDate") %>
				<h4><%=rs.getString("b_unitPrice") %>원</h4>
				<P> <form name="addForm" action="./addCart.jsp?id=<%=rs.getString("b_id")%>" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()"> 도서 주문 &raquo;</a>
					<a href="./cart.jsp" class="btn btn-warning"> 장바구니 &raquo;</a>
					<a href="./Books.jsp" class="btn btn-secondary">도서목록 &raquo;</a>
					</form>
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
		</div>
		<hr>
	</div>
	
	<jsp:include page="footer.jsp"/>

</body>
</html>