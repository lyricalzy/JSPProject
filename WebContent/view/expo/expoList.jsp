<%@page import="model.ExpoDTO"%>
<%@page import="model.ExpoPageDTO"%>
<%@page import="model.ExpoDAO"%>
<%@page import="java.util.ArrayList"%>
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
<title>창업설명회/박람회 일정</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="../../js/jquery-3.4.1.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../../css/css.css">
<script type="text/javascript">
function del(obj) {
    idValue = $(obj).attr("id")
    check = confirm("해당 글을 삭제하시겠습니까?")
    if (check) {
	    $.ajax({
	    	url: '../../control/expoDelete.jsp',
	    	data: {
	    		id: idValue
	    	},
	    	success: function(result) {
	    		if (result == 0) {
		    		alert('삭제 실패!')
				}else {
		    		alert('글 삭제 완료!')
		    		location.reload()
				}
			}
	    })
	}
}
$(function() {
	if ("<%=session.getAttribute("name")%>" == null) {
		$('#writeBtn').hide()
	}
})
</script>
</head>
<body>

<jsp:include page="../main/top.jsp"></jsp:include>

<div style ="height : 70px;"></div>
	<div class="container" style="margin-bottom: 100px;">
		<h2>창업 설명회/박람회 일정</h2>
		<p>
		<hr style="border: solid 2px;">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목/일정</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>글 삭제</th>
				</tr>
			</thead>
			<tbody>
				<%
					ExpoDAO dao = new ExpoDAO();
					ExpoPageDTO pdto = new ExpoPageDTO();
					int pageNo = Integer.parseInt(request.getParameter("pageNo"));
					pdto.setPage(pageNo);
					ArrayList<ExpoDTO> list = dao.selectPage(pdto);
					for (ExpoDTO dto2 : list) {
				%>
				<tr>
					<td><%=dto2.getId()%></td>
					<td>
						<a href="expoView.jsp?id=<%=dto2.getId()%>">
							<%=dto2.getWhen()%><br>
							<%=dto2.getTitle()%>
						</a>
					</td>
					<td><%=dto2.getName()%></td>
					<td><%=dto2.getTime()%></td>
					<td>
						<%if(dto2.getName().equals(session.getAttribute("id"))
								||"Y".equals(session.getAttribute("admin"))){%>
						<button type="button" class="btn btn-primary active"
						id="<%=dto2.getId()%>" onclick="del(this)">X</button>
						<%} else{%>
						<button type="button" class="btn btn-primary disabled">X</button>
						<%} %>
					</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<button onclick="location.href='expoWrite.jsp'" class="btn btn-success"
			style="float: right;" id="writeBtn">글작성</button>
		<div style="text-align: center;">
			<ul class="pagination">
				<li><a
					href="expoList.jsp?pageNo=<%=((pageNo / 11) - 1) * 10 + 1%>"><<</a></li>
				<%
					for (int iCount = pdto.getStartPage(); iCount <= pdto.getEndPage(); iCount++) {
						if (iCount == pageNo) {
				%>

				<li class="active"><a href="expoList.jsp?pageNo=<%=iCount%>"><%=iCount%></a></li>
				<%
					} else {
				%>
				<li><a href="expoList.jsp?pageNo=<%=iCount%>"
					style="color: black;"><%=iCount%></a></li>
				<%
					}
					}
				%>
				<li><a
					href="expoList.jsp?pageNo=<%=((pageNo / 11) + 1) * 10 + 1%>">>></a></li>
			</ul>
		</div>

	</div>
	<div class="jumbotron text-center" style="margin-bottom: 100px; margin-top: 0px;">
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>
