
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	try{
		if(session.getAttribute("admin_id")==null){
			response.sendRedirect("/jsp_plane_ticket_book/frame");
			//如果预设的session为空，则证明用户未登录，所以跳转到servlet /frame中
			//为什么不是跳转到/admin/index.jsp？
			//如果用户已经登录，但是网页停留时间过长导致session失效，此时，如果通过在后台框架中点击超链接
			//此时，整个框架不刷新，刷新的只有iframe中的内容，会出现iframe中出现嵌套/admin/index.jsp的
			//现象，但是如果跳转到/frame中，因为session失效，/frame中验证登陆将会失败，整个页面都会跳转到
			//  /admin/index.jsp中，不会导致出现框架中嵌套/admin/index.jsp的怪象
		}
	}catch(Exception e){
		System.out.println("验证登陆时出现异常"+e);
		response.sendRedirect("/jsp_plane_ticket_book/frame");
	}
%>