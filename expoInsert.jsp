<%@page import="model.ExpoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="model.ExpoDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	ExpoDAO dao = new ExpoDAO();
	int result = dao.insert(dto);
%><%= result %>