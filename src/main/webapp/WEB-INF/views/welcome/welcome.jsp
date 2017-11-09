<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
body{
background-image: url("${pageContext.request.contextPath }/resource/images/welcome.png");
background-size: 100% 100%;
background-repeat: no-repeat;
 
}
.title-panel {
	width: 400px;
    height: 300px;
	font-size:40px;
	font: normal  'MicroSoft YaHei';
	margin-left:300px;
	margin-top:150px;
 	background-color:rgba(255,255,255,0.2);	
 	/* border-radius:5%; */
 	padding:75px 30px;
	
}
.title-font{
	font-size:40px;
    font: normal  'MicroSoft YaHei';
    color: #000000;
}
</style>
<body>
<div class="title-panel">
	<div>Welcome</div>
	<div class="title-font"><span class="span-font" id="ifont-1">6S</span>&nbsp; 用户管理系统</div>
</div>
</body>