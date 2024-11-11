<%@page import="cn.edu.csmzxy.s1832.n05.javabean.db_conn"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//添加URL session ，作为用户登录后跳转回来的依据,登录servlet中已经写了判断程序，如果有url_cookie，就跳转到url_cookie，如果没有，就跳转到用户中心
	session.setAttribute("url", request.getRequestURI());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>机票预订系统</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/common.css" rel="stylesheet">
<link href="css/corptravel.css" rel="stylesheet">
<link href="css/enterprise.css" rel="stylesheet">
<link href="css/iconfont.css" rel="stylesheet">
	<link rel="shortcut icon" href="https://picreso.oss-cn-beijing.aliyuncs.com/plane.png" type="image/x-icon">
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
								登录
								
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
				<a class=" " href="index.jsp"><img src="https://picreso.oss-cn-beijing.aliyuncs.com/plane.png"
					width="70" height="70" alt="系统LOGO" class="pull-left mar-right-30"
					style="margin-left: -15px;"></a>

			</div>


			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="javascript:none"><i
							class="icon iconfont icon-nav-block font24">&#xe620;</i> 首页</a></li>
					<li><a href="/jsp_plane_ticket_book/user_center"><i
							class="icon iconfont icon-nav-block font24">&#xe61c;</i> 用户中心</a></li>
							
							<li><a href="/jsp_plane_ticket_book/admin/index.jsp"><i
							class="icon iconfont icon-nav-block font24">&#xe61c;</i> 后台管理</a></li>

				</ul>
			</div>

		</div>

	</nav>
	<div style="background:url('https://picreso.oss-cn-beijing.aliyuncs.com/airport.jpg') no-repeat;width:100%;height:900px;"><h1 style="text-align: center;">航线中心</h1></div>

	<!-- header end -->
	<!-- 搜索 -->
	<div class="index-wall white " style="margin-top: -20px;">
		<div class="container"
			style="position: relative; text-align: center; width: auto;">
			<form class="form-inline" action="../search" method="post">
				<div class="form-group">
					<select name="" class="form-control">
						<option selected>单程</option>
						<option>往返</option>
					</select>
				</div>
				<div class="form-group mar-left-10">
					<label for="">出发城市</label> <input name="departure" type="text" class="form-control"
						style="width: 85px;" id="" value="" placeholder="出发城市">
				</div>
				<div class="form-group">
					<label for=""> — <a href="#" class="huan">换</a> —
					</label>
				</div>
				<div class="form-group">
					<label for="">到达城市</label> <input name="destination" type="text" class="form-control"
						style="width: 85px;" id="" value="" placeholder="到达城市">
				</div>
				<button type="submit" class="btn btn-warning mar-left-10">搜索</button>
			</form>
		</div>
	</div>
	<!-- 搜索结束 -->



	<!-- 列表开始 -->
	<div class="container mar-bottom-30 ">
		<div class="hangbanlist">
			<div>
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
						Integer f_p_i=Integer.parseInt(f_p);
						String b_p=res.getString(9);
						Integer b_p_i=Integer.parseInt(b_p);
						String e_p=res.getString(10);
						Integer e_p_i=Integer.parseInt(e_p);
				%>
			
				<!-- 表头 -->
				<ul class="list-inline bor-bottom-solid-1  ">
					<li class="w-percentage-25"><img src="https://picreso.oss-cn-beijing.aliyuncs.com/plane.png"
						width="24" height="24"> <strong>航班</strong> <%=f_i %><span
						class="gray-999 font12 mar-left-10">机型：空客320（中）</span></li>
					<li class="text-right w80"><strong class="time "><%=t_t %></strong></li>
					<li class="">——</li>
					<li class="w80"><strong class="time "><%=l_t %></strong></li>
					<li class="w100 text-right"><%=s_a %></li>
					<li class="">——</li>
					<li class=" w100"><%=e_a %></li>
					
				</ul>
				<!-- 表头结束 -->
				<!-- 表BODY -->
				<div class="collapse" id="collapseExample" style="display: block;">
					<div class="hangbanlist-body " style="background-color: #FEFCFC;">
						<ul class="list-inline">
							<li class="w-percentage-20"><strong class="blue-0093dd">头等舱(F)</strong></li>
							<li class="w-percentage-25">座位数：≥16</li>
							<li class="w-percentage-25">票面价：<span class="rmb">￥<%=f_p_i+500 %></span></li>


							<li class="w-percentage-20 ">优惠价：<strong
								class="rmb orange-f60 font16">￥<%=f_p %></strong></li>
							<li class="pull-right "><button type="button"
									class="btn btn-danger btn-sm"
									onClick="window.location.href ='order.jsp?flight_id=<%=f_i %>&grade=f';">订票</button></li>
						</ul>
						<ul class="list-inline">
							<li class="w-percentage-20"><strong class=" red">商务舱(B)</strong></li>
							<li class="w-percentage-25">座位数：≥29</li>
							<li class="w-percentage-25">票面价：<span class="rmb">￥<%=b_p_i+200 %></span></li>


							<li class="w-percentage-20 ">优惠价：<strong
								class="rmb orange-f60 font16">￥<%=b_p %></strong></li>
							<li class="pull-right "><button type="button"
									class="btn btn-danger btn-sm"
									onClick="window.location.href ='order.jsp?flight_id=<%=f_i %>&grade=b';">订票</button></li>
						</ul>
						<ul class="list-inline">
							<li class="w-percentage-20"><strong class="blue-0093dd">经济舱(E)</strong></li>
							<li class="w-percentage-25">座位数：≥62</li>
							<li class="w-percentage-25">票面价：<span class="rmb">￥<%=e_p_i+100 %></span></li>


							<li class="w-percentage-20 ">优惠价：<strong
								class="rmb orange-f60 font16">￥<%=e_p %></strong></li>
							<li class="pull-right "><button type="button"
									class="btn btn-danger btn-sm"
									onClick="window.location.href ='order.jsp?flight_id=<%=f_i %>&grade=e';">订票</button></li>
						</ul>
					</div>
				</div>
				<!-- 表BODY 结束 -->
				
				<%
					}
				%>
				
			</div>


			<div class="clearfix"></div>
		</div>
	</div>

</body>
</html>