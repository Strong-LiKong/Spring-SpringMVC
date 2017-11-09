<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>6s-ums</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resource/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resource/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resource/css/style.css">
<style type="text/css">
html, body {
	margin: 0;
	padding: 0;
	border: 0;
	outline: 0;
	font-size: 100%;
	font-family: "Open Sans", Helvetica, Arial, sans-serif;
	line-height: 1.6;
	letter-spacing: 0.06rem;
}

body:not() {
	
}

html, body {
	height: 100%;
}

section:not (#section-1 ) {
	padding-top: 5rem;
}

#shade {
	width: 100%;
	height: 100%;
	background-color: rgba(245, 245, 245, 0.5);
	position: absolute;
}

#section-1 {
	height: 100%;
	background-color: #f5f5f5;
	background-image:
		url(${pageContext.request.contextPath }/resource/images/background.png);
	background-size: cover;
}

#section-2 {
	height: 40rem;
}

#section-3 {
	height: 50rem;
}

#section-4 {
	height: 50rem;
}

#section-5 {
	height: 50rem;
}

#section-2 img {
	transform: scale(1);
	transition: all .3s ease;
}

#section-2 img:hover {
	transform: scale(1.1);
	transition: all .3s ease;
}

#section-4 .system-list-panel .col-md-12 {
	transition: all .3s ease;
}

#section-4 .system-list-panel .collapsed .fa-plus {
	display: inline-block;
}

#section-4 .system-list-panel .collapsed .fa-minus {
	display: none;
}

#section-4 .system-list-panel .fa-plus {
	display: none;
}

#section-4 .system-list-panel .fa-minus {
	display: inline-block;
}

#section-5 .position-absolute {
	top: 0;
}
</style>
</head>

<body>
	<div id="shade"></div>
	<section id="section-1">
		<div class="container h-100">
			<div class="row h-100">
				<div class="col-md-6 offset-lg-1 d-flex">
					<div class="align-self-center">
						<h2 class="text-uppercase margin-bottom-30">
							6s ums <br> <strong>Designed by Follow Traveller</strong>
						</h2>
						<p class="text-muted m-0">A man may go faster</p>
						<p class="text-muted margin-bottom-20">But a team gets further
						</p>
						<button class="btn btn-lg btn-info u-btn-info col-md-6 click-in">
							<i class="fa fa-send-o" id="1">&nbsp;进入网站</i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="section-2">
		<div class="container mt-5 text-center">
			<h4 class="font-size-12">
				<span class="u-text-info">01.</span> 关于我们
			</h4>
			<h2 class="margin-bottom-30">
				奋斗中的人儿，<strong>魅力四射</strong>
			</h2>
			<p class="text-muted">六只来自遵义医学院的大四狗，正走向优质程序员的进阶之路</p>
		</div>
		<div class="container h-75 pt-4 px-5">
			<div class="row h-100 no-gutters">
				<div class="col-lg-3 col-sm-6 u-bg-info text-white overflow-hideen">
					<img class="w-100"
						src="${pageContext.request.contextPath }/resource/images/section-1-1.png">
					<div class="col-md-12 pt-5 px-4">
						<h3 class="mb-4">一拍即合</h3>
						<p class="font-size-14">文老板和组长大人正在开心的讨论项目的Bug，两人似乎一拍即合，立刻就想到了解决方案</p>
					</div>
				</div>
				<div
					class="col-lg-3 col-sm-6 u-bg-darkpurple text-white overflow-hideen">
					<img class="w-100"
						src="${pageContext.request.contextPath }/resource/images/section-1-2.png">
					<div class="col-md-12 pt-5 px-4">
						<h3 class="mb-4">女中豪杰</h3>
						<p class="font-size-14">听说要拍照，李渣渣正襟危坐，俨然一副女中豪杰的样子</p>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6 u-bg-pink text-white overflow-hideen">
					<img class="w-100"
						src="${pageContext.request.contextPath }/resource/images/section-1-3.png">
					<div class="col-md-12 pt-5 px-4">
						<h3 class="mb-4">志同道合</h3>
						<p class="font-size-14">两个志同道合的河南老乡，悄悄的说些什么呢</p>
					</div>
				</div>
				<div
					class="col-lg-3 col-sm-6 u-bg-purple text-white overflow-hideen">
					<img class="w-100"
						src="${pageContext.request.contextPath }/resource/images/section-1-4.png">
					<div class="col-md-12 pt-5 px-4">
						<h3 class="mb-4">不愿露脸</h3>
						<p class="font-size-14">某个不愿露正脸的人，本大大费尽九牛二虎之力也只拍到了一个侧脸，看来不能给同桌开小灶了呢</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="section-3" class="mb-5">
		<div class="container mt-4 text-center">
			<h4 class="font-size-12">
				<span class="u-text-info">02.</span> 系统简介
			</h4>
			<h2 class="margin-bottom-30">
				一个后台的<strong>管理员系统</strong>
			</h2>
			<p class="text-muted">在实现基础功能的前提下，添加了注册、找回密码以及上传头像等功能，本系统只供管理员使用，注册成功即成为管理员</p>
		</div>
		<div class="container h-75 pt-4 px-5">
			<div class="row h-100">
				<div class="col-lg-4 margin-bottom-30 text-center">
					<div class="col-md-12 h-100 px-4 py-5 bg-light">
						<i class="fa fa-lg m-0 mb-4 fa-leaf u-text-info"></i>
						<h4 class="font-size-12 font-weight-700 mb-4">Spring
							Framework</h4>
						<p class="font-size-12 text-muted">Spring是一个开放源代码的设计层面框架，他解决的是业务逻辑层和其他各层的松耦合问题，因此它将面向接口的编程思想贯穿整个系统应用</p>
					</div>
				</div>
				<div class="col-lg-4 margin-bottom-30 text-center">
					<div class="col-md-12 h-100 px-4 py-5 bg-light">
						<i class="fa fa-lg m-0 mb-4 fa-modx u-text-info"></i>
						<h4 class="font-size-12 font-weight-700 mb-4">Spring MVC</h4>
						<p class="font-size-12 text-muted">Spring 框架提供了构建 Web 应用程序的全功能 MVC 模块。使用 Spring 可插入的 MVC 架构，从而在使用Spring进行WEB开发时，可以选择使用Spring的SpringMVC框架或集成其他MVC开发框架。</p>
					</div>
				</div>
				<div class="col-lg-4 margin-bottom-30 text-center">
					<div class="col-md-12 h-100 px-4 py-5 bg-light">
						<i class="fa fa-lg m-0 mb-4 fa-slack u-text-info"></i>
						<h4 class="font-size-12 font-weight-700 mb-4">Hibernate</h4>
						<p class="font-size-12 text-muted">Hibernate是一个开放源代码的对象关系映射框架，它对JDBC进行了非常轻量级的对象封装，是一个全自动的ORM框架</p>
					</div>
				</div>
				<div class="col-lg-4 margin-bottom-30 text-center">
					<div class="col-md-12 h-100 px-4 py-5 bg-light">
						<i class="fa fa-lg m-0 mb-4 fa-star u-text-info"></i>
						<h4 class="font-size-12 font-weight-700 mb-4">Model View
							Controller</h4>
						<p class="font-size-12 text-muted">典型的三层构架体现MVC思想，良好的可扩展性，ssh主流技术有强大的用户社区支持它，所以该框架扩展性非常强</p>
					</div>
				</div>
				<div class="col-lg-4 margin-bottom-30 text-center">
					<div class="col-md-12 h-100 px-4 py-5 bg-light">
						<i class="fa fa-lg m-0 mb-4 fa-pagelines u-text-info"></i>
						<h4 class="font-size-12 font-weight-700 mb-4">jQuery</h4>
						<p class="font-size-12 text-muted">jQuery是一个快速、简洁的JavaScript框架，jQuery设计的宗旨是Write
							Less，Do More，即倡导写更少的代码，做更多的事情</p>
					</div>
				</div>
				<div class="col-lg-4 margin-bottom-30 text-center">
					<div class="col-md-12 h-100 px-4 py-5 bg-light">
						<i class="fa fa-lg m-0 mb-4 fa-bug u-text-info"></i>
						<h4 class="font-size-12 font-weight-700 mb-4">Bootstrap</h4>
						<p class="font-size-12 text-muted">Bootstrap，来自Twitter，是目前很受欢迎的前端框架。Bootstrap基于HTML、CSS、JavaScript，使得Web开发更加快捷</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="section-4" class="bg-light">
		<div class="container h-100 px-5">
			<div class="row h-100">
				<div class="col-md-6 d-flex">
					<div class="align-self-center w-100">
						<h4 class="font-size-12">
							<span class="u-text-info">03.</span> 功能组成
						</h4>
						<h2 class="margin-bottom-30">
							多种功能，<strong>纷繁复杂</strong>
						</h2>
						<p class="text-muted">对于一个后端的管理员系统，也值得拥有优美的页面和详尽的功能</p>
						<div class="system-list-panel text-white" role="tablist">
							<div class="card border-0">
								<div id="systemItem1Tab"
									class="col-md-12 u-bg-info p-3 collapsed" role="tab"
									data-toggle="collapse" href="#systemItem1"
									aria-controls="systemItem1">
									<i class="fa fa-plus"></i><i class="fa fa-minus"></i> 用户管理
								</div>
								<div id="systemItem1" class="collapse col-md-12 u-bg-info pb-3"
									role="tabpanel" aria-labelledby="systemItem1Tab"
									data-parent=".system-list-panel">包括增加用户、编辑用户信息、删除单个用户以及删除多个用户等功能</div>
							</div>
							<div class="card border-0">
								<div id="systemItem2Tab" class="col-md-12 bg-info p-3 collapsed"
									role="tab" data-toggle="collapse" href="#systemItme2"
									aria-controls="systemItme2">
									<i class="fa fa-plus"></i><i class="fa fa-minus"></i> 角色管理
								</div>
								<div id="systemItme2" class="collapse col-md-12 bg-info pb-3"
									role="tabpanel" aria-labelledby="systemItem2Tab"
									data-parent=".system-list-panel">包括增加角色、编辑角色信息、删除单个角色以及删除多个角色等功能</div>
							</div>
							<div class="card border-0">
								<div id="systemItem3Tab"
									class="col-md-12 u-bg-info p-3 collapsed" role="tab"
									data-toggle="collapse" href="#systemItem3"
									aria-controls="systemItem3">
									<i class="fa fa-plus"></i><i class="fa fa-minus"></i> 权限管理
								</div>
								<div id="systemItem3" class="collapse col-md-12 u-bg-info pb-3"
									role="tabpanel" aria-labelledby="systemItem3Tab"
									data-parent=".system-list-panel">包括增加权限、编辑权限信息、删除单个权限以及删除多个权限等功能</div>
							</div>
							<div class="card border-0">
								<div id="systemItem4Tab" class="col-md-12 bg-info p-3 collapsed"
									role="tab" data-toggle="collapse" href="#systemItem4"
									aria-controls="systemItem4">
									<i class="fa fa-plus"></i><i class="fa fa-minus"></i> 部门管理
								</div>
								<div id="systemItem4" class="collapse col-md-12 bg-info pb-3"
									role="tabpanel" aria-labelledby="systemItem4Tab"
									data-parent=".system-list-panel">包括增加部门、编辑部门信息、删除单个部门以及删除多个部门等功能</div>
							</div>
							<div class="card border-0">
								<div id="systemItem5Tab"
									class="col-md-12 u-bg-info p-3 collapsed" role="tab"
									data-toggle="collapse" href="#systemItem5"
									aria-controls="systemItem5">
									<i class="fa fa-plus"></i><i class="fa fa-minus"></i> 上传头像
								</div>
								<div id="systemItem5" class="collapse col-md-12 u-bg-info pb-3"
									role="tabpanel" aria-labelledby="systemItem5Tab"
									data-parent=".system-list-panel">注册成功的用户有默认头像，之后可以上传自定义头像</div>
							</div>
							<div class="card border-0">
								<div id="systemItem6Tab" class="col-md-12 bg-info p-3 collapsed"
									role="tab" data-toggle="collapse" href="#systemItem6"
									aria-controls="systemItem6">
									<i class="fa fa-plus"></i><i class="fa fa-minus"></i> 用户注册
								</div>
								<div id="systemItem6" class="collapse col-md-12 bg-info pb-3"
									role="tabpanel" aria-labelledby="systemItem6Tab"
									data-parent=".system-list-panel">在系统原型基础上增加用户注册的功能，再登录进系统</div>
							</div>
							<div class="card border-0">
								<div id="systemItem7Tab"
									class="col-md-12 u-bg-info p-3 collapsed" role="tab"
									data-toggle="collapse" href="#systemItem7"
									aria-controls="systemItem7">
									<i class="fa fa-plus"></i><i class="fa fa-minus"></i> 找回密码
								</div>
								<div id="systemItem7" class="collapse col-md-12 u-bg-info pb-3"
									role="tabpanel" aria-labelledby="systemItem7Tab"
									data-parent=".system-list-panel">当用户因忘记密码时，可根据注册时的密保问题，进行找回</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="section-5" class="position-relative">
		<div class="container-fluid h-50"></div>
		<div class="container-fluid h-50 u-bg-info"></div>
		<div
			class="container-fluid h-100 position-absolute d-flex justify-content-center">
			<div class="align-self-center w-75 h-50">
				<div class="col-md-12 h-25">
					<div class="row h-100">
						<div class="col-lg-2 text-center">
							<h4 class="font-size-12 u-text-info">项目经理</h4>
							<h2>孔立</h2>
							<p class="text-muted">负责登录注册</p>
						</div>
						<div class="col-lg-2 text-center">
							<h4 class="font-size-12 u-text-info">高级后端开发</h4>
							<h2>谢梅</h2>
							<p class="text-muted">负责部门管理</p>
						</div>
						<div class="col-lg-2 text-center">
							<h4 class="font-size-12 u-text-info">高级前端开发</h4>
							<h2>李泽毅</h2>
							<p class="text-muted">负责前端设计编写</p>
						</div>
						<div class="col-lg-2 text-center">
							<h4 class="font-size-12 u-text-info">高级BUG测试</h4>
							<h2>文友</h2>
							<p class="text-muted">负责编写BUG</p>
						</div>
						<div class="col-lg-2 text-center">
							<h4 class="font-size-12 u-text-info">高级后端开发</h4>
							<h2>苏晨光</h2>
							<p class="text-muted">负责权限管理</p>
						</div>
						<div class="col-lg-2 text-center">
							<h4 class="font-size-12 u-text-info">高级后端开发</h4>
							<h2>马泰</h2>
							<p class="text-muted">负责用户管理</p>
						</div>
					</div>
				</div>
				<div class="col-md-12 h-75 pt-5">
					<div class="row h-100 bottom-img">
						<div class="col-lg-2">
							<img width="100%"
								src="${pageContext.request.contextPath }/resource/images/people-1.jpg">
						</div>
						<div class="col-lg-2">
							<img width="100%"
								src="${pageContext.request.contextPath }/resource/images/people-2.jpg">
						</div>
						<div class="col-lg-2">
							<img width="100%"
								src="${pageContext.request.contextPath }/resource/images/people-3.jpg">
						</div>
						<div class="col-lg-2">
							<img width="100%"
								src="${pageContext.request.contextPath }/resource/images/people-4.png">
						</div>
						<div class="col-lg-2">
							<img width="100%"
								src="${pageContext.request.contextPath }/resource/images/people-5.jpg">
						</div>
						<div class="col-lg-2">
							<img width="100%"
								src="${pageContext.request.contextPath }/resource/images/people-6.jpg">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resource/jquery/jquery-3.2.1.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resource/plugins/popper/js/popper.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resource/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".click-in").on("click",function(){
				/* window.open("http://localhost:8080/ums/login") */
				window.location.href="${pageContext.request.contextPath }/login"
				});
				
		});
	</script>
</body>

</html>