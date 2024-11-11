package cn.edu.csmzxy.s1832.n05.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import cn.edu.csmzxy.s1832.n05.javabean.db_conn;
import cn.edu.csmzxy.s1832.n05.javabean.flight;

public class search_fly extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		String url=null;
		if(session.getAttribute("url")!=null) {
			url=session.getAttribute("url").toString();
		}else {
			url="default/index.jsp";
		}
		resp.sendRedirect(url);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		String url="default/index.jsp";
		
		String departure=null;
		String destination=null;
		departure=req.getParameter("departure");
		destination=req.getParameter("destination");
		String sql=null;
		if(departure==""&&destination=="") {

			resp.sendRedirect(url);
		}else if (departure!=""&&destination=="") {
			sql="select * from flight where f_s_p='"+departure+"'";
		}else if (departure==""&&destination!="") {
			sql="select * from flight where f_e_p='"+destination+"'";
		}else if (departure!=""&&destination!="") {
			sql="select * from flight where f_s_p='"+departure+"' and f_e_p='"+destination+"'";
		}
		if(departure==""&&destination=="") {

		}else {
			db_conn conn=new db_conn();

			ArrayList<flight> flightlist = new ArrayList<flight>();
			flight flight_info=new flight();
			
			ResultSet res=conn.executeQuery(sql);
			try {
				while (res.next()) {
					flight_info.setF_n(res.getString(1));
					flight_info.setF_s_a(res.getString(4));
					flight_info.setF_a_a(res.getString(5));
					flight_info.setF_d_t(res.getString(6));
					flight_info.setF_a_t(res.getString(7));
					flight_info.setF_f_c_p(res.getString(8));
					flight_info.setF_s_c_p(res.getString(9));
					flight_info.setF_t_c_p(res.getString(10));
					flightlist.add(flight_info);					
				}
				req.setAttribute("flightlist", flightlist);
			} catch (SQLException e) {
				System.out.println("������Ϣ��"+e);
			}finally {
				conn.closeDB();
			}

			req.getRequestDispatcher("default/search.jsp").forward(req, resp);
		}
		
	}
}
