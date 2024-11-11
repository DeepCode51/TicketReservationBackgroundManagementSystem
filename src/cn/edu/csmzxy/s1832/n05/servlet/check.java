package cn.edu.csmzxy.s1832.n05.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.csmzxy.s1832.n05.javabean.db_conn;
import cn.edu.csmzxy.s1832.n05.javabean.get_md5;

public class check extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.println("");
		}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		String id = null;
		String password = null;
		HttpSession session = req.getSession();
		id = req.getParameter("id");
		password = req.getParameter("password");
		
		get_md5 MD5 = new get_md5();//锟斤拷锟斤拷一锟斤拷锟斤拷取MD5锟侥讹拷锟襟，讹拷password锟斤拷锟叫癸拷希
		password = MD5.getMD5(password);
		password = MD5.getMD5(password);//锟斤拷password锟斤拷锟斤拷锟斤拷锟轿癸拷希锟斤拷锟斤拷为锟斤拷锟捷匡拷锟叫达拷锟斤拷锟斤拷锟揭诧拷蔷锟斤拷锟斤拷锟斤拷锟絤d5锟侥斤拷锟�
		
		
		db_conn conn = new db_conn();
		
		String sql = "select * from admin_user where user = '"+id+"'";
															
		
		try {
			ResultSet res = conn.executeQuery(sql);
			if(res.next()) {
				String pwd = res.getString(2);
				if(password.equals(pwd)) {
					session.setAttribute("admin_id", id);
					resp.sendRedirect("frame");
				}else {

					resp.sendRedirect("/jsp_plane_ticket_book/admin/index.jsp");
				}
			}else {

				resp.sendRedirect("/jsp_plane_ticket_book/admin/index.jsp");				
			}
		}catch(SQLException e) {
			System.out.println(e);
		}
	}
	
}
