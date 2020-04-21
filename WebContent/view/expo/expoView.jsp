<%@page import="model.ExpoDTO"%>
<%@page import="model.ExpoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	if (session.getAttribute("name") == null) {
		response.sendRedirect("../login/LoginView.jsp");

	}
%>

<!DOCTYPE html>
<html>
<head>
<title>창업 성공 사례</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="../../js/jquery-3.4.1.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../../css/css.css">
</head>
<body>

	<jsp:include page="../main/top.jsp"></jsp:include>

	<div style="height: 70px;"></div>
	<div class="container" style="margin-bottom: 100px;">
		<h2>창업박람회/설명회 일정 보기</h2>
		<p>
		<hr style="border: solid 2px;">
		<table class="table">

			<jsp:useBean id="dto" class="model.ExpoDTO"></jsp:useBean>
			<jsp:setProperty property="id" name="dto" />

			<%
				ExpoDAO dao = new ExpoDAO();
				ExpoDTO dto2 = dao.select(dto);
			%>
			<tr>
				<th class="col-md-1">제목</th>
				<td class="col-md-6"><%=dto2.getTitle()%></td>
			</tr>
			<tr>
				<th>장소</th>
				<td><%=dto2.getPlace()%></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><%=dto2.getTel()%></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto2.getName()%></td>
			</tr>
			<tr>
				<th>브랜드명</th>
				<td><%=dto2.getBrand()%></td>
			</tr>
			<tr>
				<th>홈페이지</th>
				<td><%=dto2.getHome()%></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><%=dto2.getTime()%></td>
			</tr>
			<tr>
				<td colspan="2">
					<div style="height: 500px;"><%=dto2.getContent()%></div>
				</td>
			</tr>
			<tr>
				<td align="right" colspan="2">
					<button onclick="location = 'expoList.jsp?pageNo=1'"
						class="btn btn-success">목록</button>
				</td>
			</tr>
		</table>
		<hr>
	</div>
	<div class="jumbotron text-center"
		style="margin-bottom: 100px; margin-top: 0px;">
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>