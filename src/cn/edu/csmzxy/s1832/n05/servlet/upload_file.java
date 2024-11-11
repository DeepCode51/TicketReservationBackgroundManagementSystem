package cn.edu.csmzxy.s1832.n05.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.edu.csmzxy.s1832.n05.javabean.db_conn;
public class upload_file extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {

			resp.sendRedirect("/jsp_plane_ticket_book/index/edit_info.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		if(session.getAttribute("user_id")==null) {
			response.sendRedirect("index/user_info.jsp");
		}
		else {

			boolean flag=ServletFileUpload.isMultipartContent(request);
			if(flag) {
				DiskFileItemFactory factory=new DiskFileItemFactory();
				ServletFileUpload upload=new ServletFileUpload(factory);
				try {
					List<FileItem>fileList = upload.parseRequest(request);
					Iterator<FileItem> myitor = fileList.iterator();
					while(myitor.hasNext()) {
						FileItem item=myitor.next();
						if(item!=null) {
							String filename=item.getName();
							if(filename!=null) {
								String path="index/upload";
								String absolutepath=this.getServletContext().getRealPath(path);

								
								File file = new File(filename);

								String file_name=file.getName();
								String ext=file_name.substring(file_name.lastIndexOf("."));

								String end_filename=UUID.randomUUID().toString()+ext;

								File uploadFile = new File(absolutepath, end_filename);
								try {
									if(uploadFile.exists()) {
										uploadFile.delete();
									}
									item.write(uploadFile);
									
									db_conn conn= new db_conn();
									String sql="update common_user set avatar_img='"+end_filename+"' "
											+ "where user_name='"+session.getAttribute("user_id")+"'";
									int res=conn.Update(sql);

									PrintWriter out=response.getWriter();
									response.setContentType("text/html;charset=utf-8");
									if(res!=0) {
										response.sendRedirect("/jsp_plane_ticket_book/index/user_info.jsp");
									}else {
										
										out.println("返回用户信息");
										response.setHeader("refresh", "2;url=/jsp_plane_ticket_book/index/user_info.jsp");
									}
									
									
									
									
									
								}catch (Exception e) {

								}
								
							}				
						}
					}
				} catch (FileUploadException e) {

					e.printStackTrace();
				}
			}
		}
		
	}
}
