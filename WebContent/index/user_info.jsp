

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="verify_login.jsp" %><%--包含验证登陆代码--%>
<jsp:useBean id="img_url" class="cn.edu.csmzxy.s1832.n05.javabean.get_img" scope="session" />
<jsp:setProperty property="user_id" name="img_url" value="<%=session.getAttribute(\"user_id\") %>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/jsp_plane_ticket_book/index/css/core.css">
<link type="text/css" rel="stylesheet" href="/jsp_plane_ticket_book/index/css/home.css">
</head>
<body>

	<div class="ydc-content-slide ydc-body">
		<div class="ydc-flex">

			<!-- right begin -->
			<div class="ydc-column ydc-column-8">
				<div class="ydc-release-content">
					<div class="ydc-tabPanel ydc-tabPanel-release">
						<div class="ydc-release-tab-head">
							<ul>
								<li class="hit">帐号设置</li>
							</ul>
						</div>
						<div class="ydc-panes">
							<div class="ydc-pane ydc-pane-clear" style="display: block;">
								<div class="ydc-reg-form-group clearfix">
									<label>帐号名称</label>
									<div class="ydc-reg-form-input">
										<label><%=session.getAttribute("user_id") %></label>
									</div>
								</div>

								<div class="ydc-reg-form-group clearfix">
									<label>帐号头像</label>
									<div class="ydc-reg-form-input">
										<label></label>
										<div class="ydc-reg-form-text ydc-reg-form-user-logo">
											<img src="<%=img_url.getImg() %>" alt="">
										</div>
									</div>
								</div>



								<div class="ydc-reg-form-group clearfix">
									<label>姓名</label>
									<div class="ydc-reg-form-input">
										<label>***</label>
									</div>
								</div>
								<div class="ydc-reg-form-group clearfix">
									<label>所在城市</label>
									<div class="ydc-reg-form-input">
										<label>上海</label>
									</div>
								</div>
								<div class="ydc-reg-form-group clearfix">
									<label>身份证号</label>
									<div class="ydc-reg-form-input">
										<label>******************</label>
									</div>
								</div>
								<div class="ydc-reg-form-group clearfix">
									<label>身份证照片</label>
									<div class="ydc-reg-form-input">
										<label>已提交</label>
									</div>
								</div>
								<div class="ydc-reg-form-group clearfix">
									<label>联系手机</label>
									<div class="ydc-reg-form-input">
										<label>158****0960 已验证</label>
									</div>
								</div>
								<div class="ydc-reg-form-group clearfix">
									<label>邮箱</label>
									<div class="ydc-reg-form-input">
										<label>***@163.com</label>
									</div>
								</div>
								<div class="ydc-reg-form-group clearfix">
									<label>QQ/微信</label>
									<div class="ydc-reg-form-input">
										<label>*********</label>
									</div>
								</div>
								<div class="ydc-reg-form-group clearfix"
									style="margin-top: 40px;">
									<div class="ydc-reg-form-button" style="margin-left: 255px;">
										<a class="btn fl" href="/jsp_plane_ticket_book/index/edit_info.jsp">修改</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- right end -->
		</div>
	</div>

</body>
</html>