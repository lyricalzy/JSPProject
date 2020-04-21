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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="../../js/jquery-3.4.1.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../../css/css.css">
<title>창업박람회/설명회 일정 작성</title>
<script type="text/javascript">
	$(
			function() {
				$('#writeBtn')
						.click(
								function() {
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
									var when = $('#when1').val() + ' ~ '
											+ $('#when2').val()
									var tel = $('#tel1').val() + '-'
											+ $('#tel2').val() + '-'
											+ $('#tel3').val()

									$
											.ajax({
												url : '../../control/expoInsert.jsp',
												data : {
													id : 0,
													title : $('#title').val(),
													place : $('#place').val(),
													when : when,
													tel : tel,
													name : $('#name').val(),
													brand : $('#brand').val(),
													home : $('#home').val(),
													time : time,
													content : $('#content')
															.val()
												},
												success : function(result) {
													if (result == 0) {
														alert('글 작성 오류')
													} else {
														alert('글 작성 완료!')
														location.href = "expoList.jsp?pageNo=1";
													}
												}
											})
								})
			})
</script>
</head>
<body>

	<jsp:include page="../main/top.jsp"></jsp:include>
	<div style="height: 70px;"></div>
	<div class="container" style="margin-bottom: 100px;">
		<h2>창업박람회/설명회 일정 작성</h2>
		<p>
		<hr style="border: solid 2px;">
		<table class="table">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" id="title"
					class="form-control"></td>
			</tr>
			<tr>
				<td>장소</td>
				<td><input type="text" name="place" id="place"
					class="form-control"></td>
			</tr>
			<tr>
				<td>일시</td>
				<td>
					<div class="form-group row">
						<div class="col-md-4">
							<input type="date" name="when1" id="when1" class="form-control">
						</div>
						<div class="col-md-1">~</div>
						<div class="col-md-4">
							<input type="date" name="when2" id="when2" class="form-control">
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>
					<div class="form-group row">
						<div class="col-md-2">
							<select name="tel1" id="tel1" class="form-control">
								<option>010</option>
								<option>011</option>
								<option>017</option>
								<option>019</option>
								<option>02</option>
								<option>032</option>
							</select>
						</div>
						<div class="col-md-2">
							<input type="text" name="tel2" id="tel2" maxlength="4"
								class="form-control"
								onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
						</div>
						<div class="col-md-1">-</div>
						<div class="col-md-2">
							<input type="text" name="tel3" id="tel3" maxlength="4"
								class="form-control"
								onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="name" id="name"
					value="<%=session.getAttribute("id")%>" readonly="readonly"
					class="form-control"></td>
			</tr>
			<tr>
				<td>브랜드명</td>
				<td><input type="text" name="brand" id="brand"
					class="form-control"></td>
			</tr>
			<tr>
				<td>홈페이지</td>
				<td><input type="text" name="home" id="home"
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
	<div class="jumbotron text-center"
		style="margin-bottom: 100px; margin-top: 0px;">
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>