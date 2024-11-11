<%@page import="java.sql.ResultSet"%>
<%@ page import="cn.edu.csmzxy.s1832.n05.javabean.db_conn"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//添加URL session ，作为用户登录后跳转回来的依据,登录servlet中已经写了判断程序，如果有url_cookie，就跳转到url_cookie，如果没有，就跳转到用户中心
	session.setAttribute("url", request.getRequestURI());
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>留言板</title>
<link rel="stylesheet" href="css/semantic.css" type="text/css">
<link rel="stylesheet" href="css/zyComment.css" type="text/css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/common.css" rel="stylesheet">
<link href="css/corptravel.css" rel="stylesheet">
<link href="css/enterprise.css" rel="stylesheet">
<link href="css/iconfont.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<style type="text/css" media="print, screen">  
label {
	font-weight: bold;
}

a {
	font-family: Microsoft YaHei;
}

#articleComment {
	width: 600px;
	margin:0 auto;
}
</style> 
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
				<a class=" " href="index.jsp"><img src="https://picreso.oss-cn-beijing.aliyuncs.com/plane.png"
					width="70" height="70" alt="系统LOGO" class="pull-left mar-right-30"
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
	<!-- 留言板开始 -->
	<div id="articleComment" style="margin-top:150px;">
		<div id="commentItems" class="ui threaded comments"
			style="margin-bottom: 20px;">
			<div class="text"
				style="font-size: 2rem; padding-bottom: 10px; border-bottom: 1px solid #DFDFDF;">
				欢迎您留下宝贵的意见</div>
			<div class="comment">
				<a class="avatar"> <img src="images/foot.png">
				</a>
				<div class="content ">
					<a class="author"> 刘训灼 </a>
					<div class="metadata">
						<span class="date"> 2020-08-04 </span>
					</div>
					<div class="text">测试评论系统</div>

				</div>
			</div>

			<% 
				db_conn conn= new db_conn(); 
				String sql="select * from user_message";
				ResultSet res=conn.executeQuery(sql);
	
				while(res.next()){
					String user_name=res.getString(3);
					String user_message=res.getString(4);
					String message_date=res.getString(2);
					//System.out.print(res.getRow()+"---");
					
			%>



			<div class="comment">
				<a class="avatar"> <img src="images/foot.png">
				</a>
				<div class="content topStyle">
					<a class="author"> <%=user_name %> </a>
					<div class="metadata">
						<span class="date"> <%=message_date %> </span>
					</div>
					<div class="text"><%=user_message %></div>
				</div>
			</div>
			
			<%
				}
			%>

		</div>
		<div id="commentFrom">
			<form id="replyBoxAri" action="../messageBoard" method="post" class="ui reply form">
				<div class="ui large form ">
					<div class="two fields">
						<div class="field">
							<input type="text" id="userName" placeholder="昵称" name="name"> <label
								class="userNameLabel inputdefault" for="userName"></label>
						</div>
					</div>
					<div class="contentField field">
						<textarea id="commentContent" name="message" placeholder="留言内容"></textarea>
						<label class="commentContentLabel areadefault"
							for="commentContent"></label>
					</div>
					
						
					<input type="submit" value="提交评论" >
					
				</div>
			</form>
		</div>
	</div>
	<!-- 留言板结束 -->

</body>
</html>