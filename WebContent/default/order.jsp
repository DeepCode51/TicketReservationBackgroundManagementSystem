<%@page import="cn.edu.csmzxy.s1832.n05.javabean.db_conn"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//添加URL session ，作为用户登录后跳转回来的依据,登录servlet中已经写了判断程序，如果有url_cookie，就跳转到url_cookie，如果没有，就跳转到用户中心
	session.setAttribute("url", request.getRequestURI());
%>
<%! 
	String flight_id=null;
	String grade=null;
	String grade_character=null;
	String s_p=null;//起飞地点
	String e_p=null;//到达地点
	String s_a=null;//起飞机场
	String e_a=null;//目的机场
	String t_t=null;//起飞时间
	String l_t=null;//到达时间
	
%>
<%
	flight_id=request.getParameter("flight_id");
	if(flight_id==null){
		flight_id="SU2312";
	}
%>
<%
	
db_conn conn=new db_conn();
String sql="select * from flight where f_n='"+flight_id+"'";
ResultSet res=conn.executeQuery(sql);
if(res.next()){	
	s_p=res.getString(2);
	e_p=res.getString(3);
	s_a=res.getString(4);
	e_a=res.getString(5);
	t_t=res.getString(6);
	l_t=res.getString(7);
}

%>


<%@ include file="verify_login.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/common.css" rel="stylesheet">
<link href="css/corptravel.css" rel="stylesheet">
<link href="css/enterprise.css" rel="stylesheet">
<link href="css/iconfont.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body class="bg-body">
	<!-- header -->
	<nav class="navbar navbar-default navbar-fixed-top bg-white">
		<nav class="navbar navbar-default"
			style="min-height: 30px; line-height: 30px; margin-bottom: 0px; border-radius: 0;">
			<div class="container font12">

				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<ul class="nav navbar-nav nav-top-small" style="margin-left: -15px;">
					<li class="dropdown">
						<% if(session.getAttribute("user_id")!=null){ %>
							<a href="javacript:none" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
								您好，<%=session.getAttribute("user_id").toString() %>
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="logout.jsp">退出</a></li>
							</ul>
						<%}else{ %>
							<a href="../user_center" class="dropdown-toggle"  role="button" aria-haspopup="true" aria-expanded="false">
								请登录！
								
							</a>
						<%} %>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right nav-top-small">
					<li class="dropdown">
						<a href="message_board.jsp" class="dropdown-toggle"> 留言板 </a>
					</li>

				</ul>

			</div>
		</nav>


		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class=" " href="index.jsp"><img src="images/logo.png"
					width="210" height="70" alt="系统LOGO" class="pull-left mar-right-30"
					style="margin-left: -15px;"></a>

			</div>


			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="index.jsp"><i
							class="icon iconfont icon-nav-block font24">&#xe620;</i>首页</a></li>
					<li><a href="/jsp_plane_ticket_book/user_center"><i
							class="icon iconfont icon-nav-block font24">&#xe61c;</i> 用户中心</a></li>

				</ul>
			</div>

		</div>
	</nav>
	<!-- header end -->
	
	
	
	
	
	<!-- content start -->

	<form action="../add_order" method="post" >
	<input type="hidden" name="flight_id" value="<%=flight_id %>">
	<div class="container bg-gray-eee box-shadow mar-bottom-30"
		style="padding-right: 0px; padding-left: 0px; position: relative; margin-top: 120px;">
		<div class="col-sm-7 container bg-white  pad-bottom-20"
			style="margin-top: 30px; margin-bottom: 30px;">
			<div style="overflow: hidden;">
				<h3 class="mar-bottom-20" style="display: block; float: left;">乘机人</h3>
			</div>
			<div>
				<input name="passenger_name" type="text" class="form-control input-sm w300"
					style="display: inline-block;" placeholder="姓名，与登机所持证件中的姓名一致">
				<input type="date" name="date"/>
			</div>
			<div class="mar-top-10">
				<select name="grade" class="form-control input-sm w150" style=" display: inline-block;">
            		<option value="头等舱" selected="selected">头等舱</option>
           			<option value="商务舱">商务舱</option>
            		<option value="经济舱">经济舱</option>
     			</select>
				<input name="passenger_id" type="text" class="form-control input-sm w300"
					style="display: inline-block;" placeholder="身份证件号码">
			</div>



			<!-- 航班信息 结束 -->



			<!-- 联系人 -->
			<h3 class="mar-bottom-20">联系人</h3>
			<input name="contact" type="text" class="form-control input-sm"
				style="display: inline-block; width: 460px;" placeholder="姓名">
			<div class="mar-top-10">
				<select name="select"
					class="form-control input-sm w110 mar-right-10"
					style="display: inline-block;">
					<option value="国家" selected="selected">中国&nbsp;&nbsp;+86</option>
				</select> <input name="contact_phone" type="text" class="form-control input-sm"
					style="display: inline-block; width: 337px;"
					placeholder="手机号码，接收航班信息">
			</div>



		</div>
		<div class="col-sm-5 bg-gray-eee">
			<div style="margin-left: -15px;">
				<h4 style="overflow: hidden; margin-left: 10px;">
					<span style="display: block; float: left;"></span>
					<span style="display: block; float: left; margin-left: 200px;"><%=s_p %>-<%=e_p %></span>
					<span
						style="display: block; float: right; color: #999; font-size: 14px; margin-right: 5px;"></span>
				</h4>
			</div>
			<div style="overflow: hidden; margin-bottom: 20px;">
				<div class="flight-from" style="float: left;">
					<span class="time text-center"><%=t_t %></span><br /> <span
						class="text-center"><%=s_a %></span>
				</div>
				<div class="flight-info" style="float: left; margin-left: 100px;">
					<img src="images/a.png"> <span class="font12 gray-999">2h35m</span>
					<img src="images/b.png"><br /> <img src="images/c.png" class="mar-left-10"> <span
						class="text-center font12 gray-999">实际乘坐<%=flight_id %></span><br /> <span
						class="airline-direct"></span> <span class="arrow"></span>
				</div>
				<div class="flight-to" style="float: right;">
					<span class="time text-center"><%=l_t %></span><br /> <span
						class="text-center"><%=e_a %></span>
				</div>
			</div>
			<div>
				<div class="tuigaiqian" style="cursor: pointer; color: #337ab7;">退改签说明</div>
				<div class="instruction">
					<table class="table table-bordered" style="height: 150px;">
						<tr>
							<td>成人票</td>
							<td>退票扣费</td>
							<td>改期加收手续费</td>
							<td>签转</td>
						</tr>
						<tr>
							<td>起飞前24小时之前</td>
							<td>￥169/人</td>
							<td>￥368/人</td>
							<td>可以签转</td>
						</tr>
						<tr>
							<td>起飞前24小时之后</td>
							<td>￥338/人</td>
							<td>￥368/人</td>
							<td>可以签转</td>
						</tr>
					</table>
				</div>
			</div>


		</div>

	</div>


	<div class="text-center mar-top-10" style="margin-bottom: 20px;">
			<input type="submit" value="提交订单" class="btn btn-danger mar-top-20">
	</div>
	</form>
	

	<!-- content end -->
</body>
</html>