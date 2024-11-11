package cn.edu.csmzxy.s1832.n05.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.csmzxy.s1832.n05.javabean.db_conn;

public class del_user_message extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sort=req.getParameter("class");
		if(sort.equals("user")) {
			String user_name=req.getParameter("id");
			db_conn conn=new db_conn();
			String sql="delete from common_user where user_name='"+user_name+"'";
			conn.executeDelete(sql);
			resp.sendRedirect("admin/user_list.jsp");
		}else if (sort.equals("message")) {
			String id_str=req.getParameter("id");
			int id=Integer.parseInt(id_str);
			db_conn conn=new db_conn();
			
			String sql="delete from user_message where id='"+id+"'";

			conn.executeDelete(sql);

			resp.sendRedirect("admin/feedback_list.jsp");
		}
		
	}
}
