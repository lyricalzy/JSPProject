<%@page import="java.util.ArrayList"%>
<%@page import="model.ExpoDTO"%>
<%@page import="model.ExpoDAO"%>
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
<title>예상 창업 비용 계산 결과</title>
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

<!-- 	<div class="container"> -->
<%-- 		<jsp:include page="../main/knowhowTop.jsp"></jsp:include> --%>
<!-- 	</div> -->

<jsp:include page="../main/top.jsp"></jsp:include>
<div style ="height : 70px;"></div>
	<div class="container" style="margin-bottom: 100px;">
		<h2>예상 창업 비용 계산 결과</h2>
		<hr style="border: solid 2px;">
		<div>
			<%
				String name = request.getParameter("name");
				int pyung = Integer.parseInt(request.getParameter("pyung"));
				String sido = request.getParameter("sido");
				String tae = request.getParameter("tae");
				int jum = 0; // 점포구입비용
				int sisul = 1; // 시설 비용
				int cho = 0; // 초기물품&기타비용
				if (sido == "서울") {
					if (pyung == 10) {
						jum = 40000000;
					} else if (pyung == 20) {
						jum = 60000000;
					} else if (pyung == 30) {
						jum = 80000000;
					} else if (pyung == 40) {
						jum = 100000000;
					} else if (pyung == 50) {
						jum = 120000000;
					} else if (pyung == 60) {
						jum = 140000000;
					}
				} else if (sido == "경기" || sido == "인천" || sido == "대전" || sido == "대구" || sido == "울산" || sido == "부산"
						|| sido == "광주") {
					if (pyung == 10) {
						jum = 30000000;
					} else if (pyung == 20) {
						jum = 50000000;
					} else if (pyung == 30) {
						jum = 70000000;
					} else if (pyung == 40) {
						jum = 90000000;
					} else if (pyung == 50) {
						jum = 100000000;
					} else if (pyung == 60) {
						jum = 120000000;
					}
				} else {
					if (pyung == 10) {
						jum = 20000000;
					} else if (pyung == 20) {
						jum = 40000000;
					} else if (pyung == 30) {
						jum = 60000000;
					} else if (pyung == 40) {
						jum = 80000000;
					} else if (pyung == 50) {
						jum = 90000000;
					} else if (pyung == 60) {
						jum = 100000000;
					}
				}
				if (tae.equals("외식업")) {
					sisul = pyung * 2200000; //시설비용 = 평수*2200000
					cho = 4000000; //초기물품&기타비용

				} else if (tae.equals("판매업")) {
					sisul = pyung * 1900000; //시설비용 = 평수*1900000
					cho = 20000000; //초기물품&기타비용

				} else if (tae.equals("서비스/무점포업")) { //
					sisul = pyung * 2100000; //시설비용 = 평수*2100000
					cho = 5000000; //초기물품&기타비용

				} else if (tae.equals("기타")) { //
					sisul = pyung * 2000000; //시설비용 = 평수*2000000
					cho = 6000000; //초기물품&기타비용
				}
				int total = jum + sisul + cho;
			%>
			<!-- 평균가격 (비교대상) -->
			<span style="font-weight: bold; font-size: 25px;"><%=name%></span>님의
			예상 총 창업비용은 <span style="font-weight: bold; font-size: 25px;"><%=total%></span>원입니다.
			<p>
			<table class="table">
				<tr class="success">
					<td class="col-md-1">선택한 평수:</td>
					<td class="col-md-2"><%=pyung%></td>
				</tr>
				<tr class="success">
					<td class="col-md-1">선택한 지역:</td>
					<td class="col-md-2"><%=sido%></td>
				</tr>
				<tr class="success">
					<td class="col-md-1">선택한 업태:</td>
					<td class="col-md-2"><%=tae%></td>
				</tr>
				<tr class="info">
					<td class="col-md-1">점포 구입 비용:</td>
					<td class="col-md-2"><span
						style="font-weight: bold; font-size: 25px;"><%=jum%></span>원</td>
				</tr>
				<tr class="info">
					<td class="col-md-1">시설 비용:</td>
					<td class="col-md-2"><span
						style="font-weight: bold; font-size: 25px;"><%=sisul%></span>원</td>
				</tr>
				<tr class="info">
					<td class="col-md-1">초기물품&기타비용:</td>
					<td class="col-md-2"><span
						style="font-weight: bold; font-size: 25px;"><%=cho%></span>원</td>
				</tr>
			</table>
			<div class="container" style="text-align: center; font-size: 15px;">
				<p>
					<span style="color: green;">점포 구입 비용이란?</span>
				</p>
				<p>점포구입비용은 보증금과 권리금으로 구분하여 살펴볼 수 있다.</p>
				<p>보증금은 점포를 얻기 위해 건물주에게 맡겨 두는 비용이고, 권리금은 기존 점포주에게 주는 소멸성 비용이다.</p>
				<p>점포 얻는 비용은 보증금과 권리금의 합을 말한다.</p>
			</div>
			<div class="container" style="text-align: center; font-size: 15px;">
				<p>
					<span style="color: green;">시설 투자 비용이란?</span>
				</p>
				<p>기존시설을 철거하고 설치하는 창업은 인테리어, 간판, 홀 집기, 주방설비 등의 항목으로 지출되게 된다.</p>
				<p>프랜차이즈 창업과 개인 창업, 시설의 정도에 따라 비용의 차이가 많이 난다.</p>
				<p>일반적으로 시설을 새로 할 때 15평 기준 3-5,000만원 내외의 시설비용이 지출 된다</p>
				<p>기존업종과 시설을 그대로 유지하는 창업은 간판교체 비용정도인 500-1,000만원의 비교적 적은 비용이
					지출된다.</p>
			</div>
			<div class="container" style="text-align: center; font-size: 15px;">
				<p>
					<span style="color: green;">초도 상품비용 및 기타비용이란?</span>
				</p>
				<p>초도 상품 및 기타 비용으로는 초도상품 비용은 판매업의 경우는 2-3,000만원 가까이 지출되고,</p>
				<p>외식업의 경우 100-400만원 내외의 비용이 지출된다.</p>
				<p>판매업은 초도 물품비용이 높고 서비스업이나 외식업은 상대적으로 낮은 편이다.</p>
			</div>
		</div>
		<button onclick="#" class="btn btn-success" style="float: right;">1:1문의하기</button>
	</div>
	<div class="jumbotron text-center"
		style="margin-bottom: 100px; margin-top: 0px;">
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>