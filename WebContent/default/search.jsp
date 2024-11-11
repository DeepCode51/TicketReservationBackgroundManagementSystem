<%@page import="cn.edu.csmzxy.s1832.n05.javabean.flight"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-----------------------------------
-@data-time	2019?6?15?---??8:18:53
-@author	created by matou
-@IDE		eclipse
-@tomcat	9.0
-@jdk		1.8.0_161	
------------------------------------%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>机票预订系统</title>
	<link rel="shortcut icon" href="https://picreso.oss-cn-beijing.aliyuncs.com/plane.png" type="image/x-icon">
<link href="/jsp_plane_ticket_book/default/css/bootstrap.min.css" rel="stylesheet">
<link href="/jsp_plane_ticket_book/default/css/common.css" rel="stylesheet">
<link href="/jsp_plane_ticket_book/default/css/corptravel.css" rel="stylesheet">
<link href="/jsp_plane_ticket_book/default/css/enterprise.css" rel="stylesheet">
<link href="/jsp_plane_ticket_book/default/css/iconfont.css" rel="stylesheet">
<script type="/jsp_plane_ticket_book/default/text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="/jsp_plane_ticket_book/default/js/bootstrap.min.js"></script>
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
								<li><a href="/jsp_plane_ticket_book/default/logout.jsp">退出</a></li>
							</ul>
						<%}else{ %>
							<a href="/jsp_plane_ticket_book/user_center" class="dropdown-toggle"  role="button" aria-haspopup="true" aria-expanded="false">
								请登录！
								
							</a>
						<%} %>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right nav-top-small">
					<li class="dropdown">
						<a href="/jsp_plane_ticket_book/default/message_board.jsp" class="dropdown-toggle"> 留言板 </a>
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
				<a class=" " href="/jsp_plane_ticket_book/default/index.jsp"><img src="https://picreso.oss-cn-beijing.aliyuncs.com/plane.png"
					width="70" height="70" alt="系统LOGO" class="pull-left mar-right-30"
					style="margin-left: -15px;"></a>

			</div>


			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="/jsp_plane_ticket_book/default/index.jsp"><i
							class="icon iconfont icon-nav-block font24">&#xe620;</i> 首页</a></li>
					<li><a href="/jsp_plane_ticket_book/user_center"><i
							class="icon iconfont icon-nav-block font24">&#xe61c;</i> 用户中心</a></li>

				</ul>
			</div>

		</div>
	</nav>
	<!-- header end -->
	<!-- 搜索 -->
	<div class="index-wall white " style="">
		<div class="container"
			style="position: relative; margin-left: 650px; width: auto;">
			<form class="form-inline" action="/jsp_plane_ticket_book/search" method="post">
				<div class="form-group">
					<select name="" class="form-control">
						<option selected>单程</option>
						<option>往返</option>
					</select>
				</div>
				<div class="form-group mar-left-10">
					<label for="">出发城市</label> <input name="departure" type="text" class="form-control"
						style="width: 85px;" id="departure" value="" placeholder="出发城市">
				</div>
				<div class="form-group">
					<label for=""> — <a href="#" class="huan">换</a> —
					</label>
				</div>
				<div class="form-group">
					<label for="">到达城市</label> <input name="destination" type="text" class="form-control"
						style="width: 85px;" id="destination" value="" placeholder="到达城市">
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
					ArrayList flightlist=(ArrayList)request.getAttribute("flightlist");
					//ArrayList userlist=(ArrayList)request.getAttribute("userlist");
					if(flightlist.size()==0){
						out.println("对不起，未找到您需要的航班，请重新查找");
					}else{
						for(int i=0;i<flightlist.size();i++){
							flight flight_info=(flight)flightlist.get(i);
							Integer f_p_i=Integer.parseInt(flight_info.getF_f_c_p());
							Integer b_p_i=Integer.parseInt(flight_info.getF_s_c_p());
							Integer e_p_i=Integer.parseInt(flight_info.getF_t_c_p());
					
					
				%>
				
					<!-- 表头 -->
				<ul class="list-inline bor-bottom-solid-1  ">
					<li class="w-percentage-25"><img src="https://picreso.oss-cn-beijing.aliyuncs.com/plane.png"
						width="24" height="24"> <strong>航班</strong> <%=flight_info.getF_n() %><span
						class="gray-999 font12 mar-left-10">机型：空客320（中）</span></li>
					<li class="text-right w80"><strong class="time "><%=flight_info.getF_d_t() %></strong></li>
					<li class="">——</li>
					<li class="w80"><strong class="time "><%=flight_info.getF_a_t() %></strong></li>
					<li class="w100 text-right"><%=flight_info.getF_s_a() %></li>
					<li class="">——</li>
					<li class=" w100"><%=flight_info.getF_a_a() %></li>
					
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
								class="rmb orange-f60 font16">￥<%=flight_info.getF_f_c_p() %></strong></li>
							<li class="pull-right "><button type="button"
									class="btn btn-danger btn-sm"
									onClick="window.location.href ='/jsp_plane_ticket_book/default/order.jsp?flight_id=<%=flight_info.getF_n() %>&grade=f';">订票</button></li>
						</ul>
						<ul class="list-inline">
							<li class="w-percentage-20"><strong class=" red">商务舱(B)</strong></li>
							<li class="w-percentage-25">座位数：≥29</li>
							<li class="w-percentage-25">票面价：<span class="rmb">￥<%=b_p_i+200 %></span></li>


							<li class="w-percentage-20 ">优惠价：<strong
								class="rmb orange-f60 font16">￥<%=flight_info.getF_s_c_p() %></strong></li>
							<li class="pull-right "><button type="button"
									class="btn btn-danger btn-sm"
									onClick="window.location.href ='/jsp_plane_ticket_book/default/order.jsp?flight_id=<%=flight_info.getF_n() %>&grade=b';">订票</button></li>
						</ul>
						<ul class="list-inline">
							<li class="w-percentage-20"><strong class="blue-0093dd">经济舱(E)</strong></li>
							<li class="w-percentage-25">座位数：≥62</li>
							<li class="w-percentage-25">票面价：<span class="rmb">￥<%=e_p_i+100 %></span></li>


							<li class="w-percentage-20 ">优惠价：<strong
								class="rmb orange-f60 font16">￥<%=flight_info.getF_t_c_p() %></strong></li>
							<li class="pull-right "><button type="button"
									class="btn btn-danger btn-sm"
									onClick="window.location.href ='/jsp_plane_ticket_book/default/order.jsp?flight_id=<%=flight_info.getF_n() %>&grade=e';">订票</button></li>
						</ul>
					</div>
				</div>
				<!-- 表BODY 结束 -->
				
				<%
						}
					}
				%>
				
				
			</div>


			<div class="clearfix"></div>
		</div>
	</div>

</body>
</html>