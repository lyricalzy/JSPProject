<%@page import="model.AchieveDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="model.AchieveDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	AchieveDAO dao = new AchieveDAO();
	int result = dao.insert(dto);
%><%= result %>