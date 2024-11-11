package cn.edu.csmzxy.s1832.n05.javabean;
import java.sql.*;

public class db_conn {
	public Connection conn = null;
	public ResultSet res = null;
	public Statement st = null;
	public  db_conn() {
		String URL="jdbc:mysql://localhost:3306/graduation_128_plane_ticket_book?serverTimezone=UTC";
		String USER="root";
		String PWD="123456";
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e){
			System.out.println(e);
		}try{
			conn = DriverManager.getConnection(URL,USER,PWD);
			st=conn.createStatement();
		}catch(SQLException e){
			System.out.println(e);
		}
	}
	

	public int executeInsert(String sql){
		int num=0;
		try{
			num=st.executeUpdate(sql);
		}
		catch(SQLException e){
			System.out.println("插入失败:"+e.getMessage());
		}
		return num;
	}
	

	public ResultSet executeQuery(String sql){
		res=null;
		try{
			res=st.executeQuery(sql);
		}
		catch(SQLException e){
			System.out.print("查询失败:"+e.getMessage());
		}
		return res;
	}
	

	public int Update(String sql){
		int num=0;
		try{
			num=st.executeUpdate(sql);
		}catch(SQLException ex){
			System.out.print("更新失败:"+ex.getMessage());
		}
		return num;
	}
	

	public int executeDelete(String sql){
		int num=0;
		try{
			num=st.executeUpdate(sql);
		}
		catch(SQLException e){
			System.out.print("删除失败:"+e.getMessage());
		}
		return num;
	}
	

	public void closeDB(){
		try{
			st.close();
			conn.close();
		}
		catch(Exception e){
			System.out.print("Connection关闭失败:"+e.getMessage());
		}
	}
}
