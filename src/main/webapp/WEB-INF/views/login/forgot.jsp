<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset="UTF-8">
<title>找回密码</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resource/css/loginStyle.css">
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resource/css/toastr.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resource/plugins/swiper/css/swiper.min.css">
<style type="text/css">
.swiper-container {
	width: 500px;
	height: 650px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.swiper-container .swiper-pagination {
	flex-basis: 150px;
	flex-shrink: 0;
	position: static;
}

#forgotNavPanel {
	width: 100%;
	display: flex;
	justify-content: center;
}

.swiper-pagination-bullet {
	width: auto;
	height: auto;
	border: 0;
	background: none;
	text-align: center;
	display: flex;
	align-items: center;
	margin-right: 50px !important;
	font: normal 14px/24px 'MicroSoft YaHei';
	color: #000000;
}
</style>
</head>

<body>
	<div class="swiper-container">
		<!-- 分页点 -->
		<div id="forgotNavPanel" class="swiper-pagination"></div>
		<!-- 轮播内容容器 -->
		<div class="swiper-wrapper">
			<!-- 轮播内容 -->
			<div class="swiper-slide">
				<div class="container">
					<h2>请输入您的密保问题</h2>
					<div class="group-forms">
						<div class="view  view-confirmQuestion " id="1"
							data-za-module="confirmQuestionForm">
							<form class="confirmQuestion-form"
								action="${pageContext.request.contextPath }/checkQuestion"
								id="confirmQuestion-form" autocomplete="off" method="POST"
								novalidate="novalidate">
								<div class="group-inputs">
									<div class="name input-wrapper">
										<input required="" type="text" name="username"
											aria-label="用户名" maxlength="16" placeholder="用户名"
											id="username">
									</div>
									<div class="question input-wrapper">
										<select name="question" required placeholder="请选择密保问题">
											<option value="我的生日？">我的生日？</option>
											<option value="我父亲/母亲的名字？">我父亲/母亲的名字？</option>
											<option value="我父亲/母亲的生日？">我父亲/母亲的生日？</option>
											<option value="我小学班主任的名字？">我小学班主任的名字？</option>
											<option value="我高中班主任的名字？">我高中班主任的名字？</option>
										</select>
									</div>
									<div class="answer input-wrapper">
										<input required="" type="text" name="answer" aria-label="密保答案"  maxlength="16"
											placeholder="密保答案">
									</div>
								</div>
								<div class="button-wrapper command">
									<button class="confirmQuestion-button submit" type="button"
										id="confirmQuestion-button">下一步</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="swiper-slide">
				<div class="container">
					<h2>请输入您的新密码</h2>
					<div class="group-forms">
						<div class="view  view-confirmQuestion " id="1"
							data-za-module="confirmQuestionForm">
							<form class="confirmQuestion-form"
								action="${pageContext.request.contextPath }/updatePassword"
								id="confirmQuestion-form" autocomplete="off" method="POST"
								novalidate="novalidate">
								<div class="group-inputs">
									<div class="pwd input-wrapper">
										<input required type="password" name="password" id="password"
											aria-label="密码" placeholder="请输入新密码(不少于6位)" minlength="6"
											maxlength="16" autocomplete="off">
											
									</div>
									<div class="pwd input-wrapper" id="extr-panel">
										<input required  type="password" name="password" id="repassword"
											aria-label="密码" placeholder="请重复新密码(不少于6位)" minlength="6"
											maxlength="16" autocomplete="off">
											<label class="error extrtipequal">两次密码必须相同</label>
											<label class="error extrtipless">密码不能少于6位</label>
											<label class="error extrtipnull">密码不能为空</label>
									</div>
								</div>
								<div class="button-wrapper command">
									<button class="newPassword-button submit" type="button"
										id="newPassword-button">提交验证</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="htmleaf-container">
		<div class="wrapper">
			<ul class="bg-bubbles">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
	</div>
	<script type="text/javascript"src="${pageContext.request.contextPath }/resource/jquery/jquery-3.2.1.min.js"></script>
	<script type="text/javascript"src="${pageContext.request.contextPath }/resource/plugins/swiper/js/swiper.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/resource/js/toastr.js"></script>
	<script>
	
		$(function() {
			var activeForm = ".view-confirmQuestion";
			$(activeForm).toggleClass("active");

			var itemSwiper = new Swiper(
					".swiper-container",
					{
						speed : 400,
						spaceBetween : 100,
						simulateTouch : false,
						pagination : {
							el : ".swiper-pagination",
							clickable : false,
							renderBullet : function(index, className) {
								if (index === 0) {
									return "<div class='" + className + "'><h1>① 验证密保问题</h1></div>";
								} else if (index === 1) {
									return "<div class='" + className + "'><h1>② 重置密码</h1></div>";
								}

							},
						}
					});

			// 点击进入下一页
			$("#confirmQuestion-button").on("click", function() {
				$.ajax({
					url : $("form:first").prop("action"),
					type : "post",
					data : $("form:first").serialize(),
					async : false,
					success : function(data) {
						console.log(data);
						console.log(data.success);
						if (data.success) {
							itemSwiper.slideNext();
						} else {
							toastr.error("密保回答错误！请重新输入！！");
						}
					}
				});

			});
			
			
			
			$("#newPassword-button").on("click", function() {
				$("#extr-panel").find("label").removeClass("is-visible");
				if(!$("#password").val()|| !$("#repassword").val()){
					$("#extr-panel").find("label.extrtipnull").addClass("is-visible");
					return;
				}else if( $("#repassword").val().length<6 || $("#password").val().length<6){
					$("#extr-panel").find("label.extrtipless").addClass("is-visible");
					return;
				}else if( $("#repassword").val()!== $("#password").val() )	{
			        $("#extr-panel").find("label.extrtipequal").addClass("is-visible"); 
					return;
				}
				var username = $("#username").val();
				var password = $("#password").val();
				$.ajax({
					url : $("form:last").prop("action"),
					type : "post",
					data : {
						"username" : username,
						"password" : password
					},
					async : false,
					success : function(data) {
						if (data.success) {
							toastr.success("密码修改成功！");
							window.location.href="${pageContext.request.contextPath }/login";
						} else {
							toastr.error("密码修改失败！！");
						}
					}
				});

			});

		})
	</script>
</body>

</html>