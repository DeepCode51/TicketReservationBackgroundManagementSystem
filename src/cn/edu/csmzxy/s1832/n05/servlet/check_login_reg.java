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


import cn.edu.csmzxy.s1832.n05.javabean.db_conn;//锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟捷匡拷锟斤拷
import cn.edu.csmzxy.s1832.n05.javabean.get_md5;//锟斤拷锟斤拷MD5锟斤拷希锟斤拷锟斤拷锟洁（锟斤拷锟斤拷为锟皆硷拷写锟侥ｏ拷锟斤拷锟斤拷锟斤拷锟斤拷械锟斤拷啵�
public class check_login_reg extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println("请登录");
		resp.setHeader("refresh", "2;url=index/login_reg.jsp");
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		String log_name = req.getParameter("log_name");
		String log_pwd = req.getParameter("log_pwd");
		String reg_name = req.getParameter("reg_name");
		String reg_pwd1 = req.getParameter("reg_pwd1");
		String reg_pwd2 = req.getParameter("reg_pwd2");
		
		if(log_name!=null&&log_pwd!=null&&reg_name==null&&reg_pwd1==null&&reg_pwd2==null) {
			go_login(log_name, log_pwd, req, resp);
			
		}
		else if(log_name==null&&log_pwd==null&&reg_name!=null&&reg_pwd1!=null&&reg_pwd2!=null&&reg_pwd1.equals(reg_pwd2)) {
			go_reg(reg_name, reg_pwd1, req, resp);
			
		}
		else {
			
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.println("请重新登录");

			resp.setHeader("refresh", "2;url=index/login_reg.jsp");
			//锟斤拷锟剿碉拷录锟斤拷注锟斤拷锟斤拷锟斤拷锟斤拷峤伙拷锟斤拷锟斤拷锟斤拷菥锟轿拷欠锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟绞撅拷欠锟斤拷锟较�
		}
	}
	
	protected void go_login(String name, String pwd, HttpServletRequest req, HttpServletResponse resp) {
		db_conn conn = new db_conn();
		get_md5 MD5 = new get_md5();
		pwd = MD5.getMD5(pwd);
		pwd = MD5.getMD5(pwd);
		HttpSession session = req.getSession();
		String sql = "select * from common_user where user_name = '"+name+"'";
		ResultSet res = conn.executeQuery(sql);
		try {
			
			if(res.next()) {
				String user_pwd = res.getString(2);
				
				if(pwd.equals(user_pwd)) {
					session.setAttribute("user_id", name);
					
					if(session.getAttribute("url")!=null) {
						String url = session.getAttribute("url").toString();
						try{
							resp.sendRedirect(url);
							}
						catch (IOException e) {

						}
					}else {
						try {
							resp.sendRedirect("user_center");
						}
						catch (IOException e) {

						}
						
					}
				}else {
					//锟矫伙拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟�
					try {
						//System.out.println("锟矫伙拷锟斤拷锟斤拷锟斤拷锟�");
						resp.setContentType("text/html;charset=utf-8");
						PrintWriter out = resp.getWriter();
						out.println("请登录");
						resp.setHeader("refresh", "2;url=index/login_reg.jsp");
					}catch (IOException e) {

					}
					
				}				
			}else {
				//锟矫伙拷锟剿号达拷锟斤拷
				try {
					//System.out.println("锟矫伙拷锟剿伙拷锟斤拷锟斤拷");
					resp.setContentType("text/html;charset=utf-8");
					PrintWriter out = resp.getWriter();
					out.println("请登录");
					resp.setHeader("refresh", "2;url=index/login_reg.jsp");
				}catch (IOException e) {

				}
			}
			conn.closeDB();
		}
		catch (SQLException e) {

		}
	}
	protected void go_reg(String name, String pwd1,HttpServletRequest req, HttpServletResponse resp) {
		//System.out.println("注锟结方锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷");
		resp.setContentType("text/html;charset=utf-8");
		
		
		db_conn conn = new db_conn();//锟斤拷锟斤拷锟斤拷锟捷匡拷锟斤拷锟接讹拷锟斤拷
		get_md5 MD5 = new get_md5();
		pwd1 = MD5.getMD5(pwd1);
		pwd1 = MD5.getMD5(pwd1);
		String sql = "select * from common_user where user_name = '"+name+"'";
		ResultSet res = conn.executeQuery(sql);
		try {
			PrintWriter out = resp.getWriter();
			try {
				if(res.next()) {			
					out.println("请登录");
					resp.setHeader("refresh", "2;url=index/login_reg.jsp");			
				}else {
					sql = "insert into common_user (user_name,user_pwd) values('"+name+"','"+pwd1+"')";
					int in_res = conn.executeInsert(sql);
					//System.out.println(in_res);
					if(in_res==1) {
						out.println("请登录");
						resp.setHeader("refresh", "2;url=index/login_reg.jsp");	
					}else {
						out.println("请登录");
						resp.setHeader("refresh", "2;url=index/login_reg.jsp");
					}
				}
			}catch (Exception e) {

			}
		}catch (IOException e) {

		}
		
		conn.closeDB();
	}
}
