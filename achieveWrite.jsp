<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	<%
	if(session.getAttribute("name") == null){
		response.sendRedirect("../login/LoginView.jsp");
		
	}

%>	
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="../../js/jquery-3.4.1.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../../css/css.css">
<title>취업 성공 사례 작성 화면</title>
<script type="text/javascript">
	$(function() {
		$('#writeBtn').click(function() {
			var date = new Date();
			var year = date.getFullYear(); // 년도
			var month = new String(date.getMonth() + 1); // 월
			var day = new String(date.getDate()); // 날짜
			if (month.length == 1) { // 월이 한자리 수면
				month = "0" + month; // 앞에 0을 넣어서 MM을 맞춰줌
			}
			if (day.length == 1) { // 일이 한자리 수면
				day = "0" + day; // 앞에 0을 넣어서 DD를 맞춰줌
			}
			var time = year + '-' + month + '-' + day // 작성일 완성

			$.ajax({
				url : '../../control/achieveInsert.jsp',
				data : {
					id : 0,
					title : $('#title').val(),
					name : $('#name').val(),
					time : time,
					content : $('#content').val()
				},
				success : function(result) {
					if (result == 0) {
						alert('글 작성 오류')
					} else {
						alert('글 작성 완료!')
						location.href = "achieveList.jsp?pageNo=1";
					}
				}
			})
		})
	})
</script>
</head>
<body>

<jsp:include page="../main/top.jsp"></jsp:include>
<div style ="height : 70px;"></div>
		<div class="container" style="margin-bottom: 100px;">
		<h2>창업 성공사례 작성</h2>
		<p>
		<hr style="border: solid 2px;">
		<table class="table">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" id="title"
					class="form-control"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="name" id="name"
					value="<%=session.getAttribute("id")%>" readonly="readonly"
					class="form-control"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea class="form-control" rows="10" id="content"
						name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><button id="writeBtn">글
						작성하기</button></td>
			</tr>
		</table>
		</div>
	<div class="jumbotron text-center" style="margin-bottom: 100px; margin-top: 0px;">
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>