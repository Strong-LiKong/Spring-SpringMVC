<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>用户管理系统</title>
<!-- <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.css"> -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resource/plugins/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resource/css/toastr.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resource/css/indexStyle.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resource/css/iconfont.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resource/css/iconfontlist.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resource/jquery/jquery.form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resource/js/toastr.js"></script>
</head>

<body>
	<div id="topPanel">
		<div class="logo_panel">
			<div class="logo_content_panel"><span class="span-font" id="ifont-1">6S</span></div>
			<h3>用户管理系统-UMS</h3>
		</div>
		<form id="avatarForm" method="post"
			enctype="multipart/form-data">
			<!-- 把文件框隐藏，在点击图片的时候触发文件框的点击事件 -->
			<span style="display: none"><input type="file"
				onchange="uploadPic()" name="avatarFile"></span>
		</form>
		<div class="avatar1_panel">
			<div class="avatar1_content_panel">
				<div class="s_menu">
					<img id="avatarImg"
						src="${pageContext.request.contextPath }/resource/${currentLoginUser.avatarPath }" />
				</div>
				<div class="u_name">
					<span>${currentLoginUser.username}</span>
				</div>
				<ul class="hide_ul">
					<li><a href="https://scgmysunny.github.io/" target="_blank">帮助</a></li>
					<li><a href="${pageContext.request.contextPath }/logout" class="logout">退出</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="bottomPanel">
		<div class="menu_panel">
			<div class="menu_content_panel">
				<ul>
				    <!-- 
					<li class="active li1" onclick="accountManage()"><a href="javascript:;">账号管理</a> </li>
					<li class="li2" onclick="roleManage()"><a href="javascript:;">角色管理</a> </li>
					<li class="li3" onclick="superManage()"><a href="javascript:;">权限管理</a> </li>
					<li class="li4" onclick="departManage()"><a href="javascript:;">部门管理</a> </li>
					 -->
					<c:forEach items="${currentJurisdictions }" var="item" >
					   <li class="menu-flag-li" onclick="loadPage('${item.uri}',this)"><i class="${item.styleType }"></i> <a href="javascript:;">${item.jurisdictionName}</a> </li>
					</c:forEach>
					
				</ul>
			</div>
		</div>
		<div class="content_panel"></div>
	</div>
	<script>
	
	$(".menu-flag-li:first").click();
		$(function() {
			
			//提示框属性设置
			toastr.options = {
					//展现时间
					"timeOut": "1000", 
					//消失的动画时间
					"hideDuration": "8000",
			}
			




			$(".avatar1_content_panel").mouseover(function() {
							$(".hide_ul").show();//显示menu
						});

						$(".avatar1_content_panel").mouseout(function() {
							$(".hide_ul").hide();//隐藏menu
						});

			// 点击图片的时候触发上传文件的输入框的点击事件
			$("#avatarImg").on("click", function() {
				 if (confirm("确定要上传头像吗？")) { 
					$("input[type=file]").click();
				}
			});
		});
		
		// 选中li高亮
		function loadPage(uri,_this){
			var li = $(_this);
			$(".menu-flag-li").removeClass("active");
			li.addClass("active");
            $(".content_panel").load("${pageContext.request.contextPath }"+uri);
        }


		//上传头像
		function uploadPic() {

			var file = $("input[type=file]").val();
			// 文件名
			var filename = file.replace(/.*(\/|\\)/, "");
			// 后缀
			var fileExt = (/[.]/.exec(filename)) ? /[^.]+$/.exec(filename
					.toLowerCase()) : '';
			// 判断文件格式
			if (fileExt != "png" && fileExt != "jpg") {
				alert("上传的文件格式不符合要求，请上传 png 或者 jpg 格式的图片");
				return;
			}
			// 上传设置  
			var options = {
				// 规定把请求发送到那个URL  
				url : "${pageContext.request.contextPath }/user/avatar",
				// 请求方式  
				type : "post",
				// 服务器响应的数据类型  
				dataType : "json",
				// 请求成功时执行的回调函数  
				success : function(data, status, xhr) {
					if(data.success){
						toastr.success("头像修改成功！");
						// 图片显示地址  
						$("#avatarImg").attr("src", "${pageContext.request.contextPath }/resource"+data.data);
						
					}else{
						toastr.error("头像修改失败，请稍后再试");
					}
				}
			}

			$("#avatarForm").ajaxSubmit(options);
		}
		
		
		// 显示输入框错误提示
		function showInputErrorTip($input, value) {
			var $parent = $input.parent();

			$parent.addClass("error-group");
			$parent.find("span").remove();
			$parent.append("<span class='error-tip'>" + value + "</span>");

			$input.focus();

			return false;
		}

		// 隐藏输入框错误提示
		function hideInputErrorTip($input) {
			var $parent = $input.parent();

			$parent.removeClass("error-group");
			$parent.find("span").remove();
		}

	</script>

</body>

</html> 