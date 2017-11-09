<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset="UTF-8">
<!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">-->
<title>用户管理系统——请登录</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resource/css/loginStyle.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resource/css/iconfont.css">
</head>

<body>
	<div class="htmleaf-container">
		<div class="wrapper">
			<div class="container">
				<h1>Welcome</h1>
				<div class="group-forms">
                    <!-- 注册div -->
                    <div class="view  view-signup " id="1" data-za-module="SignUpForm">
                        <form class="signup-form" action="${pageContext.request.contextPath }/register" id="sign-form-1" autocomplete="off" method="POST" novalidate="novalidate">
                            <div class="index-tab-navs">
                                <div class="navs-slider">
                                    <ul>
                                        <li><a href="#" class="li1" onclick="signup()">注册</a></li>
                                        <li><a href="#" class="li2" onclick="signin()">登录</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="group-inputs">
                                <div class="name input-wrapper">
                                    <input type="text" name="username" id="usernameup" aria-label="用户名" 　minlength="6" maxlength="16" placeholder="用户名（不少于 6 位）" required>
                                    <label class="error singupUsernameNullError ">请填写用户名</label>
                                    <label class="error singupUsernameLessError ">用户名不少于6位</label>
                                </div>
                                <div class="pwd input-wrapper">
                                    <input required type="password" name="password" id="passwordup" aria-label="密码" placeholder="密码（不少于 6 位）" minlength="6" maxlength="16" autocomplete="off">
                                    <label class="error singupPasswordNullError">请填写密码</label>
                                    <label class="error singupPasswordLessError">密码不少于6位</label>
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
                                    <input required="" type="text" name="answer" id="answer" aria-label="密保答案"  maxlength="16" placeholder="密保答案">
                                    <label class="error">请填写密保答案</label>
                                </div>
                            </div>
                            <div class="button-wrapper command">
                                <!--<input  class="sign-button submit" type="button" name="" id="Signup-button" onclick="tosignin()" value="Signup" />-->
                                <button class="sign-button submit" id="Signup-button"  type="submit">Signup</button>
                            </div>
                        </form>
                    </div>
                    <!-- 登录div -->
                    <div class="view view-signin " id="2" data-za-module="SignInForm">
                        <form class="signin-form" action="${pageContext.request.contextPath}/login" method="POST" novalidate="novalidate" id="sign-form-2">
                            <div class="index-tab-navs">
                                <div class="navs-slider">
                                    <ul>
                                        <li><a href="#" class="li1" onclick="signup()">注册</a></li>
                                        <li><a href="#" class="li2" onclick="signin()">登录</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="group-inputs">
                                <div class="account input-wrapper">
                                    <input type="text" name="username" id="username" aria-label="用户名" placeholder="用户名（不少于 6 位）" minlength="6"  maxlength="16" required="">
                                    <label class="error singinUsernameNullError ">请填写用户名</label>
                                    <label class="error singinUsernameLessError ">用户名不少于6位</label>
                                    <label class="error extrtip">请填写用户名或密码</label>
                                </div>
                                <div class="pwd input-wrapper">
                                    <input type="password" name="password" id="password" aria-label="密码" placeholder="密码（不少于 6 位）" minlength="6" maxlength="16" required="">
                                    <label class="error singinPasswordNullError">请填写密码</label>
                                    <label class="error singinPasswordLessError">密码不少于6位</label>
                                </div>
                            </div>
                            <div class="button-wrapper command">
                                <button class="sign-button submit" type="submit" id="login-button">Login</button>
                            </div>
                            <div class="signin-misc-wrapper clearfix">
                                <a class="unable-login" href="${pageContext.request.contextPath }/toCheckQuestion">无法登录？</a>
                            </div>
                            <div style="color:red">${message}</div>
                             <div style="color:green">${message1}</div>
                        </form>
                    </div>
                </div>
			</div>
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
	<script src="${pageContext.request.contextPath }/resource/jquery/jquery-3.2.1.min.js"></script>
	<script>
		$(function() {
			// 键盘按下，可被所有键盘按键触发登录
			$("body").on("keydown", function(event) {
				// 按下回车键				
				if (event.keyCode === 13) {
					$("#login-button").click();
				}
			});
		});

		var activeForm = ".view-signin";
		$(activeForm).toggleClass("active");
		var activeLi = ".li2";
		$(activeLi).toggleClass("selected");
		//登录跳转过度动画
		$("#login-button").click(function(event) {
			$(".wrapper").addClass("form-success");
			$(".group-forms").fadeOut(1000, function() {
				$("#sign-form-2").submit();
			});

		});

		//form标签添加active
		function toggle(Mid) {
			if (activeForm != Mid) {
				$(activeForm).toggleClass("active");
				$(Mid).addClass("active");
				activeForm = Mid;
			}

		};

		//li标签添加selected
		function active(Mid) {
			if (activeLi != Mid) {
				$(activeLi).toggleClass("selected");
				$(Mid).addClass("selected");
				activeLi = Mid;
			}
		};

		function tosignin(event) {
			event.preventDefault();
			toggle(".view-signin");
			active(".li2");
		}

		function signup() {
			toggle(".view-signup");
			active(".li1");
		};

		function signin() {
			toggle(".view-signin");
			active(".li2");
		};
		
		// 登录验证
		   $("#username").blur(function() {
		        var $parent = $(this).parent();
		        $parent.find("label").removeClass("is-visible");
		        //进行下一步判断前把之前的结果清除  
		        // 登录验证
		        if ($("#username").val() == "") {
		            $parent.find("label.singinUsernameNullError").addClass("is-visible");
		            return false;
		        } else if ($("#username").val().length < 6) {
		            $parent.find("label.singinUsernameLessError").addClass("is-visible");
		            return false;
		        } else {
		            $parent.find("label").removeClass("is-visible");
		        }
		   });
		
		   $("#password").blur(function() {
			   var $parent = $(this).parent();
		        $parent.find("label").removeClass("is-visible");
		     // 登录验证
		        if ($("#password").val() == "") {
		            $parent.find("label.singinPasswordNullError").addClass("is-visible");
		            return false;
		        } else if ($("#password").val().length < 6) {
		            $parent.find("label.singinPasswordLessError").addClass("is-visible");
		            return false;
		        } else {
		            $parent.find("label").removeClass("is-visible");
		        }
		   });


	        //注册判断
	        $("#usernameup").blur(function(){
	        	var $parent = $(this).parent();
		        $parent.find("label").removeClass("is-visible");
	        	if ($("#usernameup").val() == "") {
		            $parent.find("label.singupUsernameNullError").addClass("is-visible");
		            return false;
		        } else if ($("#usernameup").val().length < 6) {
		            $parent.find("label.singupUsernameLessError").addClass("is-visible");
		            return false;
		        } else {
		            $parent.find("label").removeClass("is-visible");
		        }	 
	        });
		        
			$("#passwordup").blur(function(){
				var $parent = $(this).parent();
		        $parent.find("label").removeClass("is-visible");
				//注册判断
		        if ($("#passwordup").val() == "") {
		            $parent.find("label.singupPasswordNullError").addClass("is-visible");
		            return false;
		        } else if ($("#passwordup").val().length < 6) {
		            $parent.find("label.singupPasswordLessError").addClass("is-visible");
		            return false;
		        } else {
		            $parent.find("label").removeClass("is-visible");
		        }
	        });

			$("#answer").blur(function(){
				var $parent = $(this).parent();
		        $parent.find("label").removeClass("is-visible");
				//注册判断
		        if ($("#answer").val() == "") {
		            $parent.find("label.error").addClass("is-visible");
		            return false;
		        } else {
		            $parent.find("label.error").removeClass("is-visible");
		        }
			});
		        

		

	</script>
	<div class="title-panel">
		<span class="span-font" id="ifont-1">6S</span>
		<div class="title-font">&nbsp; 用户管理系统</div>
	</div>
</body>

</html>