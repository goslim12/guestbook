<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.cafe24.guestbook.vo.GuestBookVo"%>
<%@page import="com.cafe24.guestbook.dao.GuestBookDao"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String password = request.getParameter("pass");
	String content = request.getParameter("content");
	
	GuestBookVo vo = new GuestBookVo();
	vo.setName(name);
	vo.setPassword(password);
	vo.setContent(content);
	vo.setRegDate(new java.text.SimpleDateFormat("yyyy-MM-dd-hh-mm-ss").format(new java.util.Date()));
	
	GuestBookDao dao = new GuestBookDao();
	dao.insert(vo);
	
	response.sendRedirect("/guestbook");
%>