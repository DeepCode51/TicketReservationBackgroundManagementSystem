<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="verify_login.jsp" %><%--包含验证用户是否登录的代码 --%>
<jsp:useBean id="img_url" class="cn.edu.csmzxy.s1832.n05.javabean.get_img" scope="session" />
<jsp:setProperty property="user_id" name="img_url" value="<%=session.getAttribute(\"user_id\") %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户中心</title>
	<link rel="shortcut icon" href="https://picreso.oss-cn-beijing.aliyuncs.com/plane.png" type="image/x-icon">
<link type="text/css" rel="stylesheet" href="/jsp_plane_ticket_book/index/css/core.css">
<link type="text/css" rel="stylesheet" href="/jsp_plane_ticket_book/index/css/icon.css">
<link type="text/css" rel="stylesheet" href="/jsp_plane_ticket_book/index/css/home.css">
</head>
<body>

	<div class="ydc-entered" style="height:11%;width:100%;">
		<div class="ydc-header-content ydc-flex">

			<div class="ydc-column">
				<div class="ydc-column-user">
					<div class="ydc-user-photo">
						<a href="javascript:;"> <img
							src="<%=img_url.getImg() %>" title="" alt="">
						</a>
					</div>
					<div class="ydc-user-info">

						<div class="ydc-user-info-func ydc-flex">
							<span class="ydc-tag">
								<% if(session.getAttribute("user_id").equals("admin")){
										out.println("刘训灼");
									}else{
										out.println(session.getAttribute("user_id"));
									}//不要问我为什么要这么操作，因为我是管理员^c^
								%>
							</span> 
							<span class="ydc-mal"><i
								class="ydc-icon ydc-icon-mail fl"></i><em>0</em></span> <a
								href="/jsp_plane_ticket_book/index/logout.jsp">退出</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="ydc-content-slide ydc-body" style="height:86%;">
		<div class="ydc-flex" style="height:100%;">
			<!-- left begin -->
			<div class="ydc-column ydc-column-2">
				<div class="ydc-menu">
					<ul>
						<li class="ydc-menu-item"><span class="ydc-menu-sub-title">
								<i class="ydc-icon ydc-icon-home fl"></i>首页
						</span>
							<ul>
								<li><a target="frame" href="/jsp_plane_ticket_book/index/user_info.jsp"
									>个人资料</a></li>
								<li><a target="frame" href="/jsp_plane_ticket_book/index/edit_info.jsp">修改信息</a></li>
							</ul></li>

						<li class="ydc-menu-item">
							<span class="ydc-menu-sub-title">
								<i class="ydc-icon ydc-icon-record fl"></i>订单
							</span>
							<ul>
								<li><a target="frame" href="/jsp_plane_ticket_book/index/order_list.jsp">订单列表</a></li>
							</ul>
						</li>

						<li class="ydc-menu-item"><span class="ydc-menu-sub-title">
								<i class="ydc-icon ydc-icon-file fl"></i>管理
						</span>
							<ul>
								<li><a href="/jsp_plane_ticket_book/default/index.jsp">返回首页</a></li>
							</ul></li>


					</ul>
				</div>
			</div>
			<!-- left end -->
			
			<!-- right start -->
			<div style="width:76%;height:100%;">
				<iframe name="frame" scrolling="auto" width="100%" height="100%" frameborder="0" src="/jsp_plane_ticket_book/index/user_info.jsp"></iframe>
			</div>
			<!-- right end -->
		</div>
	</div>

</body>
</html>