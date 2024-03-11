<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Locale" %>
<%
	Locale locale = request.getLocale();
	String displayLanguage = locale.getDisplayLanguage();
	String language = locale.getLanguage();
	String displayCountry = locale.getDisplayCountry();
	String country = locale.getCountry();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Localization</title>
</head>
<body>

	<%
		out.println("Locale Language : "+displayLanguage+"<br />");
		out.println("Locale Language Code : "+language+"<br />");
		out.println("Locale Country : "+displayCountry+"<br />");
		out.println("Locale Country Code : "+country+"<br />");
	%>

</body>
</html>