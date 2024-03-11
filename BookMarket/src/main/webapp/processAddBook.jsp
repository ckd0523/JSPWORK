<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록 처리 페이지</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	String filename = "";
	String realFolder="/upload";
	//String realFolder="/resources/images";
	
	int maxSize=5*1024*1024;
	String encType = "UTF-8";
	//String path = request.getRealPath(realFolder);
	
	
	MultipartRequest multi = new MultipartRequest(request, realFolder,
			maxSize, encType, new DefaultFileRenamePolicy());
	//	MultipartRequest multi = new MultipartRequest(request, path,
	//		maxSize, encType, new DefaultFileRenamePolicy());

	String bookId = multi.getParameter("bookId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String author = multi.getParameter("author");
	String publisher = multi.getParameter("publisher");
	String releaseDate = multi.getParameter("releaseDate");
	String totalPages = multi.getParameter("totalPages");
	String description = multi.getParameter("description");
	String category = multi.getParameter("category");
	String unitInStock = multi.getParameter("unitInStock");
	String condition = multi.getParameter("condition");

	Integer price;
	
	if(unitPrice.isEmpty()){
		price=0;
	}else{
		price=Integer.valueOf(unitPrice);
	}
	
	long stock;
	
	if(unitInStock.isEmpty()){
		stock=0;
	}else{
		stock=Long.valueOf(unitInStock);
	}
	
	Integer Pages;
	if(totalPages.isEmpty()){
		Pages=0;
	}else{
		Pages=Integer.valueOf(totalPages);
	}

	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;
	
	String sql = "insert into book values(?,?,?,?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,bookId);
	pstmt.setString(2,name);
	pstmt.setInt(3,price);
	pstmt.setString(4,author);
	pstmt.setString(5,publisher);
	pstmt.setString(6,description);
	pstmt.setString(7,category);
	pstmt.setLong(8,stock);
	pstmt.setString(9,totalPages);
	pstmt.setString(10,releaseDate);
	pstmt.setString(11,condition);
	pstmt.setString(12,fileName);
	pstmt.executeUpdate();
	
	if(pstmt != null){
		pstmt.close();
	}
	if(conn != null){
		pstmt.close();
	}
	
	
	response.sendRedirect("Books.jsp");

%>

</body>
</html>