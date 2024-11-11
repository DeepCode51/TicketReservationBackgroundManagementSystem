<%@page import="java.sql.ResultSet"%>
<%@ page import="cn.edu.csmzxy.s1832.n05.javabean.db_conn" %>
<%@ include file="verify_login.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
<link href="asset/css/style.css" rel="stylesheet">
</head>
<body>
	
	<div class="panel">
		<div class="panel-body">
			<div class="col-md-12">
				<h3 class="animated fadeInLeft">留言列表</h3>
				<p class="animated fadeInDown">留言管理<span class="fa-angle-right fa"></span>留言列表</p>
			</div>
		</div>
    </div>
	
	
    <div class="col-md-12 padding-0 form-element">
      
        <div class="panel">
			<div class="panel-heading">
				<h3>列表内容</h3>
			</div>
			
			<div class="panel-body">
				<div class="responsive-table">
					<div id="datatables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
						<div class="row">
							<div class="col-sm-12">
								<table class="table table-striped table-bordered dataTable no-footer" width="100%" cellspacing="0"  style="width: 100%;">
									<thead>
										<tr role="row">
											<th class="sorting_asc"style="width:20%;">留言人</th>
											<th class="sorting" style="width:20%;">留言时间</th>
											<th class="sorting" style="width:50%;">留言内容</th>
											<th class="sorting" style="width:10%;">操作</th>
										</tr>
									</thead>
									
									<tbody>
									
										<%
											db_conn conn= new db_conn(); 
											String sql="select * from user_message";
											ResultSet res=conn.executeQuery(sql);
							
											while(res.next()){
												String user_name=res.getString(3);
												String user_message=res.getString(4);
												String message_date=res.getString(2);
												String row=null;
												int id=res.getInt(1);
												if(res.getRow()%2==0){
													row="even";
												}else{
													row="odd";
												}
										%>
										
										<tr role="row" class="<%=row%>">
											<td class="sorting_1"><%=user_name %></td>
											<td><%=message_date %></td>
											<td><%=user_message %></td>
											<td>
												<a style="text-decoration:none;" href="/jsp_plane_ticket_book/del_message?id=<%=id%>&class=message">
													删除
												</a>
											</td>
										</tr>
									
										<%
											}
										%>
									
                     
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
        </div>
    </div>
	
</body>
</html>