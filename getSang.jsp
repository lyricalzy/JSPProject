<%@page import="org.json.simple.JSONArray"%><%@page import="org.json.simple.JSONObject"%><%@page import="model.SangDTO"%><%@page import="java.util.ArrayList"%><%@page
	import="model.MapDAO"%><%@ page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%
	String big = request.getParameter("big");
	MapDAO dao = new MapDAO();
	ArrayList<SangDTO> list = dao.selectBig(big);

	JSONObject jsonMain = new JSONObject();
	JSONArray jArray = new JSONArray();
	JSONObject jObject;
	for (int i = 0; i < list.size(); i++) {
		jObject = new JSONObject();
		jObject.put("title", list.get(i).getTitle());
		jObject.put("longtitude", list.get(i).getLongtitude());
		jObject.put("latitude", list.get(i).getLatitude());
		jArray.add(i, jObject);
	}

	jsonMain.put("list", jArray);
%><%=jsonMain.toJSONString()%>
