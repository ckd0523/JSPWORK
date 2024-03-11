<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<%
	String filename = "";
	String realFolder = "C:\\upload"; //웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
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
	ResultSet rs = null;
	
	String sql = "select * from product where p_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bookId);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		if(fileName != null){
			sql = "UPDATE product SET b_name=?, b_unitPrice=?, b_author=?, b_publisher=?, b_description=?, b_category=?, b_unitInStock=?, b_totalPages=?, b_totalPages=?, b_releaseDate=?, b_condition=?, b_fileName=?  WHERE b_id=?";
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
		}else{
			sql = "UPDATE product SET b_name=?, b_unitPrice=?, b_author=?, b_publisher=?, b_description=?, b_category=? WHERE b_id=?";
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
			pstmt.executeUpdate();	
		}
	}
	
	
	if(pstmt != null){
		pstmt.close();
	}
	if(conn != null){
		pstmt.close();
	}
	
	
	response.sendRedirect("editBook.jsp?edit=update");

%>