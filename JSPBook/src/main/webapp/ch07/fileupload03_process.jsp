<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload</title>
</head>
<body>

	<%
		String fileUploadPath="C:\\upload2";
		DiskFileUpload upload = new DiskFileUpload();
		
		List items = upload.parseRequest(request);
		Iterator params = items.iterator();
		// 파라미터 불러와서 처리
		while(params.hasNext()){
			FileItem fileItem = (FileItem)params.next();
			//파일 형태인지 확인
			if(!fileItem.isFormField()){
				//경로 포함 파일 이름 가져오기
				String fileName = fileItem.getName();
				//경로를 뺀 파일 이름 저장
				fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
				//저장경로와 파일 이름 결합
				File file = new File(fileUploadPath+"/"+fileName);
				//서버에 저장
				fileItem.write(file);
			}
		}
	%>

</body>
</html>