<%@page import="java.sql.ResultSet"%>
<%@page import="cn.edu.csmzxy.s1832.n05.javabean.db_conn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="verify_login.jsp"%>
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
				<h3 class="animated fadeInLeft">航班列表</h3>
				<p class="animated fadeInDown">航班管理<span class="fa-angle-right fa"></span>航班列表</p>
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
											<th class="sorting_asc"style="width:8%;">航班号</th>
											<th class="sorting" style="width:8%;">始发地</th>
											<th class="sorting" style="width:8%;">目的地</th>
											<th class="sorting" style="width:13%;">始发机场</th>
											<th class="sorting"  style="width:13%;">到达机场</th>
											<th class="sorting"  style="width:10%;">起飞时间</th>
											<th class="sorting"  style="width:10%;">到达时间</th>
											<th class="sorting"  style="width:10%;">头等舱价格</th>
											<th class="sorting"  style="width:10%;">商务舱价格</th>
											<th class="sorting"  style="width:10%;">经济舱价格</th>
										</tr>
									</thead>
									
									<tbody>
									
										<%
											db_conn conn=new db_conn();
											String sql="select * from flight";
											ResultSet res=conn.executeQuery(sql);
											while(res.next()){
												String f_i=res.getString(1);
												String s_p=res.getString(2);
												String end_place=res.getString(3);
												String s_a=res.getString(4);
												String e_a=res.getString(5);
												String t_t=res.getString(6);
												String l_t=res.getString(7);
												String f_p=res.getString(8);
												String b_p=res.getString(9);
												String e_p=res.getString(10);
												String row=null;
												
												if(res.getRow()%2==0){
													row="even";
												}else{
													row="odd";
												}
												
										%>
										<tr role="row" class="<%=row%>">
											<td class="sorting_1"><%=f_i %></td>
											<td><%=s_p %></td>
											<td><%=end_place %></td>
											<td><%=s_a %></td>
											<td><%=e_a %></td>
											<td><%=t_t %></td>
											<td><%=l_t %></td>
											<td><%=f_p %></td>
											<td><%=b_p %></td>
											<td><%=e_p %></td>
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