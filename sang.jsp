<%@page import="model.SangDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MapDAO"%>
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
<title>지역 상권 분석</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="../../js/jquery-3.4.1.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../../css/css.css">
<script type="text/javascript">
	$(function() {
		$('#giant').change(function() {
			$('#big').empty();
			$('#big').append("<option>-상권업종중분류명-</option>")
			if ($('#giant').val() == '음식') {
				$("#big").append("<option value=닭/오리요리>닭/오리요리</option>")
				$("#big").append("<option value=패스트푸드>패스트푸드</option>")
				$("#big").append("<option value=한식>한식</option>")
				$("#big").append("<option value=커피점/카페>커피점/카페</option>")
			} else if ($('#giant').val() == '생활서비스') {
				$("#big").append("<option value=대행업>대행업</option>")
				$("#big").append("<option value=세탁/가사서비스>세탁/가사서비스</option>")
				$("#big").append("<option value=자동차/이륜차>자동차/이륜차</option>")
			} else if ($('#giant').val() == '소매') {
				$("#big").append("<option value=화장품소매>화장품소매</option>")
				$("#big").append("<option value=운동/경기용품소매>운동/경기용품소매</option>")
				$("#big").append("<option value=시계/귀금속소매>시계/귀금속소매</option>")
			}
		})
	})
</script>
<style>
#mapwrap {
	position: relative;
	overflow: hidden;
}

.category, .category * {
	margin: 0;
	padding: 0;
	color: #000;
}

.category {
	position: absolute;
	overflow: hidden;
	top: 10px;
	left: 10px;
	width: 270px;
	height: 20px;
	z-index: 10;
	border: 1px solid black;
	font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
	font-size: 12px;
	text-align: center;
	background-color: #fff;
}
</style>
</head>
<body>
<jsp:include page="../main/top.jsp"></jsp:include>
<div style ="height : 70px;"></div>
		<br>
		<div class="container">
			<h2>지역 상권 분석</h2>
			<p>
			<hr style="border: solid 2px;">

			<div id="mapwrap">
				<!-- 지도가 표시될 div -->
				<div id="map" style="width: 1150px; height: 500px;"></div>
				<div class="category">
					<select id="giant">
						<option>-상권업종대분류명-</option>
						<option>음식</option>
						<option>생활서비스</option>
						<option>소매</option>
					</select> <select onchange="changeMarker(this)" id="big">
						<option>-상권업종중분류명-</option>
					</select>
				</div>
			</div>
<!-- bc00a071c738ee2da1b6b77ca505f158 -->
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc00a071c738ee2da1b6b77ca505f158"></script>
			<script type="text/javascript">
				var container = document.getElementById('map');
				var options = {
					center : new kakao.maps.LatLng(37.56421, 127.001699),
					level : 9
				};
				var map = new kakao.maps.Map(container, options);
			<%MapDAO dao = new MapDAO();
			ArrayList<SangDTO> list;%>
				var markers = []
				function changeMarker(obj) {
					for (var i = 0; i < markers.length; i++) {
						markers[i].setMap(null)
					}
					var type = $(obj).val()
					$.ajax({
						url : "../../control/getSang.jsp",
						dataType : "json",
						data: {
							big: type
						},
						success : function(result) {
							total = result.list
							$(total).each(function(i, item) {
						        var markerImage
						        var imageSize = new kakao.maps.Size(30, 30)
						        var position = new kakao.maps.LatLng(item.latitude, item.longtitude)
								if (type == "닭/오리요리") {
									markerImage = createMarkerImage("../../img/치킨.png", imageSize)  
								} else if (type == "커피점/카페") {
									markerImage = createMarkerImage("../../img/커피.png", imageSize)
								} else if (type == "세탁/가사서비스") {
									markerImage = createMarkerImage("../../img/세탁.png", imageSize)
								} else if (type == "자동차/이륜차") {
									markerImage = createMarkerImage("../../img/카센터.png", imageSize)
								} else if (type == "운동/경기용품소매") {
									markerImage = createMarkerImage("../../img/스포츠.png", imageSize)
								} else if (type == "시계/귀금속소매") {
									markerImage = createMarkerImage("../../img/귀금속.png", imageSize)
								} else {
									markerImage = createMarkerImage("../../img/"+type+".png", imageSize)
								}
								markers[i] = createMarker(position, markerImage, item.title);  
								markers[i].setMap(map)
							})//each
						} //success
					}) //ajax
				}
				// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
				function createMarkerImage(src, size) {
					var markerImage = new kakao.maps.MarkerImage(src, size);
					return markerImage;
				}
				// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
				function createMarker(position, image, title) {
					var marker = new kakao.maps.Marker({
						position : position,
						image : image,
						title : title
					});

					return marker;
				}
			</script>
		</div>
	
	<div class="jumbotron text-center"
		style="margin-bottom: 100px; margin-top: 0px;">
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>