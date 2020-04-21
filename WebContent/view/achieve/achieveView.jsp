<%@page import="model.AchieveDTO"%>
<%@page import="model.AchieveDAO"%>
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
	<!-- 	<div class="jumbotron text-center" style="margin-bottom: 0px;"> -->
	<!-- 		<h1>창업 컨설팅 사이트</h1> -->
	<%-- 		<h3 class ="text-right" style="color:black"><%=session.getAttribute("name") %>님 환영합니다. <a href="../login/logout.jsp">로그아웃</a></h3> --%>
	<!-- 	</div> -->

	<!-- 	<div class="container" style="margin-bottom: 100px; margin-top: 0px;"> -->
	<%-- 		<jsp:include page="../main/mainMenu.jsp"></jsp:include> --%>
	<!-- 	</div> -->




	<!-- 	<div> -->
	<!-- 		<div class="container"> -->
	<%-- 			<jsp:include page="../main/knowhowTop.jsp"></jsp:include> --%>
	<!-- 		</div> -->
	<!-- 		<br> -->
	<jsp:include page="../main/top.jsp"></jsp:include>
	<div style ="height : 70px;"></div>
	<div class="container" style="margin-bottom: 100px;">
		<h2>창업 성공 사례 게시글</h2>
		<p>
		<hr style="border: solid 2px;">
		<table class="table">
			<jsp:useBean id="dto" class="model.AchieveDTO"></jsp:useBean>
			<jsp:setProperty property="id" name="dto" />

			<%
				AchieveDAO dao = new AchieveDAO();
				AchieveDTO dto2 = dao.select(dto);
			%>
			<tr>
				<th class="col-md-1">제목</th>
				<td class="col-md-6"><%=dto2.getTitle()%></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto2.getName()%></td>
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
					<button onclick="location = 'achieveList.jsp?pageNo=1'"
						class="btn btn-success">목록</button>
				</td>
			</tr>
		</table>
	</div>
	<div class="jumbotron text-center"
		style="margin-bottom: 100px; margin-top: 0px;">
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>