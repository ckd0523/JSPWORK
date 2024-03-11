<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	List boardList = (List) request.getAttribute("boardlist");
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	int total_page = ((Integer) request.getAttribute("total_page")).intValue();
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>Board</title>
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
<body class="mx-auto" style="width: 75%;">
<jsp:include page="../menu.jsp" />
	<div class="bg-warning-subtle text-black text-center d-flex justify-content-center align-items-center" style="min-height: 800px;">
    	<div class="col">
    		<div class="row">
        		<h1 class="display-3">게시판</h1>
    		</div>
	
	<div class="row">
	<div class="container">
		<form action="<c:url value="./BoardListAction.do"/>" method="post">
			<div>
				<div class="text-right">
					<span class="badge text-bg-secondary">전체 <%=total_record%>건	</span>
				</div>
			</div>
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr class="table-danger">
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회</th>
						<th>글쓴이</th>
						<th>*삭제</th>
						<th>*수정</th>
					</tr>
					<%
						for (int j = 0; j < boardList.size(); j++) {
							BoardDTO notice = (BoardDTO) boardList.get(j);
					%>
					<tr>
						<td><%=notice.getNum()%></td>
						<td><a href="./BoardRepleAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getSubject()%></a></td>
						<td><%=notice.getRegist_day()%></td>
						<td><%=notice.getHit()%></td>
						<td><%=notice.getName()%></td>
						<c:set var="userId" value="<%=notice.getId()%>" />
						<c:choose>
						<c:when test="${sessionId==userId}">
						<td>
							<a	href="./BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"	class="btn btn-outline-danger">삭제</a> 
						</td>
						<td>	
							<a href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>" class="btn btn-outline-success">수정</a>
						</td>
						</c:when>
						<c:when test="${sessionId!=userId}">
						<td></td>
						<td></td>
						</c:when>
						</c:choose>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<div align="center">
				<c:set var="pageNum" value="<%=pageNum%>" />
				<c:forEach var="i" begin="1" end="<%=total_page%>">
					<a href="<c:url value="./BoardListAction.do?pageNum=${i}" /> ">
						<c:choose>
							<c:when test="${pageNum==i}">
								<font color='4C5317'><b> [${i}]</b></font>
							</c:when>
							<c:otherwise>
								<font color='4C5317'> [${i}]</font>

							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
			</div>
			<div align="left">
				<table>
					<tr>
						<td width="100%" align="left">&nbsp;&nbsp; 
						<select name="items" class="txt">
								<option value="subject">제목에서</option>
								<option value="content">본문에서</option>
								<option value="name">글쓴이에서</option>
						</select> <input name="text" type="text" /> <input type="submit" id="btnAdd" class="btn btn-outline-secondary btn-sm" value="검색" />
						</td>
						<td width="100%" align="right">
							<input type="button" class="btn btn-outline-secondary sm-3 mg-3" value="&laquo;글쓰기" onclick="checkForm(); return false;" />
						</td>
					</tr>
				</table>
			</div>
			</div>
			
		</form>
		
		</div>
		<hr>
	</div>
	
	</div>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>