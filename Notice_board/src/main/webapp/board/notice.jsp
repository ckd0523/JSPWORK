<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<%@ page import="mvc.model.RepleDTO"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	List repleList = (List) request.getAttribute("replelist");
	BoardDTO notice = (BoardDTO) request.getAttribute("board");
	int num = ((Integer) request.getAttribute("num")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>Board</title>
<script type="text/javascript">
	function checkForm() {	
		if (${sessionId==null}) {
			alert("로그인 해주세요.");
			return false;
		}

		location.href = "./BoardWriteForm.do?id=<%=sessionId%>"
	}
</script>
</head>
<body class="mx-auto" style="height: 100%; width: 75%;">

<jsp:include page="../menu.jsp" />

<div class="bg-warning-subtle text-black text-center d-flex justify-content-center align-items-center" style="min-height: 90vh;">
    	<div class="col">
    		<div class="row">
        		<h1 class="display-3"><%=notice.getNum()%>번 게시글</h1>
    		</div>
    		<div class="col-sm-12" align="right">
				<a href="./BoardListAction.do?pageNum=<%=nowpage%>" class="btn btn-outline-info" style="margin-right: 10px;">목록</a>
			</div>
    		<div class="row mb-3">
				<div class="container">
					<form name="newUpdate" action="BoardUpdateAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>" class="form-horizontal" method="post">
						<div class="form-group row mb-3">
							<label class="col-sm-2 control-label" >성명</label>
							<div class="col-sm-3">
								<input name="name" class="form-control"	value=" <%=notice.getName()%>" readonly>
							</div>
						</div>
						<div class="form-group row mb-3">
							<label class="col-sm-2 control-label" >제목</label>
							<div class="col-sm-5">
								<input name="subject" class="form-control"	value=" <%=notice.getSubject()%>" readonly>
							</div>
						</div>
						<div class="form-group row mb-3">
							<label class="col-sm-2 control-label" >내용</label>
							<div class="col-sm-8" style="word-break: break-all;">
								<textarea name="content" class="form-control" cols="50" rows="5" readonly> <%=notice.getContent()%></textarea>
							</div>
						</div>
					</form>
					<hr>
				</div>	
			</div>
		<div class="container">
		<div class="row mb-3">
			
				<table class="table">
				<tr class="table-danger">
					<th>아이디</th>
					<th>댓글</th>
					<th>댓글 시간</th>
				</tr>
					<%
					for (int j = 0; j < repleList.size(); j++) {
						RepleDTO notice1 = (RepleDTO) repleList.get(j);
					%>
					<tr>
						<td><%=notice1.getId()%></td>
						<td><%=notice1.getReple()%></td>
						<td><%=notice1.getRegist_day()%></td>
					</tr>
					<%
					}
					%>
				</table>
			
		</div>
			<div class="row-sm-1 mb-3">
				
					<form name="repleWrite" action="./BoardRepleWriteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>" class="form-horizontal" method="post">
						<div class="row">
						<div class="col">
						<input name="reple" type="text" class="form-control mg-3" placeholder="댓글" style="width:1200px;">
						</div>
						<div class="col">
						<input type="submit" class="btn btn-outline-secondary" value="등록">
						</div>
						<input name="id" type="hidden" value="${sessionId}">
						</div>
					</form>
				
			</div>
    	</div>
    </div>
  </div>	


<jsp:include page="../footer.jsp" />

</body>
</html>