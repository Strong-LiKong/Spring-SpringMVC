<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="addM add disappear">
	<h3>编辑用户</h3>
	<form class="form-inline"
		action="${pageContext.request.contextPath }/user/edit" method="post"
		id="submitForm">
		<div>
			<input type="hidden" value="${user.createDate}"
				name="createDate">
		</div>
		<div class="form-group">
			<input type="hidden" value="${user.id}" name="id"> <label
				for="exampleInputName2">用户名：</label> <input type="text"
				class="form-control" id="exampleInputName2" minlength="6"
				maxlength="16" placeholder="（不少于6位）" value="${user.username}"
				name="username" required>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail2">密 码：</label> <input type="text"
				class="form-control" id="exampleInputEmail2" minlength="6"
				maxlength="16" placeholder="（不少于6位）" value="${user.password}"
				name="password" required>
		</div>
		
		<div class="form-group">
			<label for="exampleInputName2">手 机：</label> <input type="text"
				class="form-control" id="exampleInputName2" value="${user.phone}"
				name="phone" required>
		</div>
		<div class="form-group" id="gender">
			<c:if test="${user.gender eq '男'}">
		性　别： <input type="radio" name="gender" value="男" checked="checked">男 <input
					type="radio" name="gender" value="女">女
		</c:if>
			<c:if test="${user.gender eq '女'}">
		性　别： <input type="radio" name="gender" value="男">男 <input
					type="radio" name="gender" value="女" checked="checked">女
		</c:if>

		</div>
		<div class="form-group">
			部 门： <select name="department.id">
				<c:forEach var="item" items="${departments }" varStatus="status">
					<c:if test="${user.department.id eq item.id }">
						<option value="${item.id }" selected="selected">${item.departmentName }</option>
					</c:if>
					<c:if test="${user.department.id ne item.id }">
						<option value="${item.id }">${item.departmentName }</option>
					</c:if>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">

			<c:if test="${user.state eq '启用'}">
		状　态： <input type="radio" name="state" value="启用" checked="checked">启用
			  <input type="radio" name="state" value="禁用">禁用
		</c:if>
			<c:if test="${user.state eq '禁用'}">
		状　态： <input type="radio" name="state" value="启用">启用
		      <input type="radio" name="state" value="禁用" checked="checked">禁用
		</c:if>
		</div>
		<div class="form-group">
			角 色： <select name="role.id">
				<c:forEach var="item" items="${roles }" varStatus="status">
					<c:if test="${user.role.id eq item.id }">
						<option value="${item.id }" selected="selected">${item.roleName }</option>
					</c:if>
					<c:if test="${user.role.id ne item.id  }">
						<option value="${item.id }">${item.roleName }</option>
					</c:if>
				</c:forEach>
			</select>
		</div>
	</form>
	<div class="save">
		<button class="btn btn-info updateAccount" type="button">保存</button>
		<button class="btn btn-warning" id="cancel">取消</button>
	</div>
</div>
<script>
	$(function() {

		$("#cancel").on(
				"click",
				function() {
					$(".content_panel").load(
							"${pageContext.request.contextPath }/user/list");
				});

		//保存更新用户信息
		$(".updateAccount").on("click", function() {
			/* $.ajax({
				url : $("#submitForm").prop("action"),
				type : "post",
				data : $("#submitForm").serialize(),
				async : false,
				success : function(data) {
					if(data.success){
						toastr.success("更新成功！");
						$(".content_panel").load("${pageContext.request.contextPath }/user/list");
					}
					else{
						toastr.error("出现错误，请更改！");
					}
				},
			}); */
			$form.trigger("submit");
		});

		//为非空验证做准备
		var $add = $(".add");
		var $form = $add.find(".form-inline");
		var $input = $form.find("input");
		// 验证手机号的正则表达式
		var pattern = /^1[34578]\d{9}$/;

		// 初始化表单提交
		$form.on("submit", function(e) {
			e.preventDefault()
			var $this = $(this);

			$this.ajaxSubmit({
				beforeSubmit : function(data, $form) {
					var username = $form.find("input[name='username']");
					var password = $form.find("input[name='password']");
					var phone = $form.find("input[name='phone']");

					// 非空验证
					if ($.trim(username.val()) === "") {
						return showInputErrorTip(username, "请输入用户名");
					} else if ($.trim(username.val().length) < 6) {
						return showInputErrorTip(username, "用户名不少于6位");
					} else {
						hideInputErrorTip(username);
					}

					// 非空验证
					if ($.trim(password.val()) === "") {
						return showInputErrorTip(password, "请输入密码");
					} else if ($.trim(password.val().length) < 6) {
						return showInputErrorTip(password, "密码不少于6位");
					} else {
						hideInputErrorTip(password);
					}

					
					// 非空验证
					if ($.trim(phone.val()) === "") {
						return showInputErrorTip(phone, "请输入电话");
					} else if (!pattern.test(phone.val())) {
						return showInputErrorTip(phone, "请输入正确的电话格式");
					} else {
						hideInputErrorTip(phone);
					}
				},
				success : function() {
					toastr.success("更新成功！");
					$(".content_panel").load(
							"${pageContext.request.contextPath }/user/list");
				},
			});
		});

	});
</script>