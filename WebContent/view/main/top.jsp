<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="jumbotron text-center" style="margin-bottom: 0px; background:#83d7fe; height : 600px;">
		<a href ="../item/category2.jsp"><img src="../../img/logo.png" style="width: 300px;height : 300px;" ></a>
		<div style="height : 50px;">
		</div>
		<p style= "font-family : G마켓 산스 TTF Medium;"> 흥망성쇠는 창업에 유용한 정보를 제공하는 비영리 홈페이지입니다.<br>
		<p style= "font-family : G마켓 산스 TTF Light;"> 창업예상비용, 다양한 사람의 노하우, 추천창업 아이템을 확인 할 수 있으며, 커뮤니티를 통해 주변정보 또한 획득할 수 있습니다.
		<div style = "margin-top: 100px;">
		<span style="color:black; float: right;font-family : G마켓 산스 TTF Light;font-size: 15px;"><%=session.getAttribute("name") %>님 환영합니다. <a href="../login/logout.jsp">로그아웃</a></span>
		</div>
	
	</div>

	<jsp:include page="mainMenu.jsp"></jsp:include>
	

</body>
</html>