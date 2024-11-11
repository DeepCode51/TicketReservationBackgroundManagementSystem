
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("user_id")==null){
		response.sendRedirect("/jsp_plane_ticket_book/index/login_reg.jsp");
		//为什么要写绝对路径？因为用户从servlet中正常访问和用户直接访问页面时，路径是不一样的，所以
		//写成绝对路径，防范错误发生
	}
%>