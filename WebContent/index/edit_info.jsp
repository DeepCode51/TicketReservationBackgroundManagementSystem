
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="verify_login.jsp" %><%--包含验证登陆的代码--%>
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
			<div class="ydc-column ydc-column-8">
				<div class="ydc-release-content">
					<div class="ydc-tabPanel ydc-tabPanel-release">
						<div class="ydc-release-tab-head">
							<ul>
								<li class="hit">帐号设置</li>
							</ul>
						</div>
						<div class="ydc-panes">
							<form action="../upload_img" enctype="multipart/form-data" method="post">
								<div class="ydc-reg-form-class ydc-reg-form-reg"
									style="margin-top: 40px;">
									<div class="ydc-reg-form-group clearfix">
										<label>帐号名称:</label>
										<div class="ydc-reg-form-input"><%=session.getAttribute("user_id") %></div>
									</div>

									<div class="ydc-reg-form-group clearfix">
										<label>帐号图标:</label>
										<div class="ydc-reg-form-input">
											<input type="file" id="" name="username" class=""
												autocomplete="off" placeholder="">
										</div>
									</div>
									<div class="ydc-reg-form-group clearfix">
										<label>姓名:</label>
										<div class="ydc-reg-form-input">
											<input type="text" id="user1"
												class="ydc-form-control" autocomplete="off"
												placeholder="***">
										</div>
									</div>
									<div class="ydc-reg-form-group clearfix">
										<label>身份证号:</label>
										<div class="ydc-reg-form-input clearfix">
											<input type="text" id="user2"
												class="ydc-form-control" autocomplete="off"
												placeholder="******************">
										</div>

									</div>
									<div class="ydc-reg-form-group clearfix">
										<label>所在城市:</label>
										<div class="ydc-reg-form-input">
											<select>
												<option>上海市</option>
												<option>上海市</option>
												<option>上海市</option>
											</select>
										</div>

									</div>
									<div class="ydc-reg-form-group clearfix">
										<label>联系手机:</label>
										<div class="ydc-reg-form-input">
											<input type="text" id="user4"
												class="ydc-form-control" autocomplete="off"
												placeholder="158****9060">
										</div>

									</div>
									<div class="ydc-reg-form-group clearfix">
										<label>邮箱:</label>
										<div class="ydc-reg-form-input">
											<input type="text" id="user5"
												class="ydc-form-control" autocomplete="off"
												placeholder="***@163.com">
										</div>

									</div>
									<div class="ydc-reg-form-group clearfix">
										<label>QQ/微信号:</label>
										<div class="ydc-reg-form-input">
											<input type="text" id="user6"
												class="ydc-form-control" autocomplete="off"
												placeholder="*********">
										</div>
										<div class="ydc-reg-form-text">
											<p>由于时间原因，现仅实现了头像上传功能</p>
										</div>
									</div>


								</div>
								<div class="ydc-reg-form-group">
									<div class="ydc-reg-form-button" style="margin-left: 255px;">
											<input type="submit" value="保存">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>