<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="addM add disappear">
	<h3>添加用户</h3>
	<form class="form-inline"
		action="${pageContext.request.contextPath }/user/add" method="post"
		id="submitForm">
		<div class="form-group">
			<label for="exampleInputName2">用户名：</label> <input type="text"
				class="form-control" id="username" name="username" minlength="6"
				maxlength="16" required>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail2">密 码：</label> <input type="text"
				value="123456" readonly="readonly" class="form-control"
				id="password" name="password" maxlength="16" required>
		</div>
		<div class="form-group">
			性 别： <input type="radio" name="gender" value="男" checked>男 <input
				type="radio" name="gender" value="女">女
		</div>
		<div class="form-group">
			部 门： <select name="department.id" id="accountDepartment">
				<c:forEach var="item" items="${departments }" varStatus="status">
					<option value="${item.id }">${item.departmentName }</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			状 态： <input type="radio" name="state" value="启用" checked>启用 <input
				type="radio" name="state" value="禁用">禁用
		</div>
		<div class="form-group">
			角 色： <select name="role.id" id="accountRole">
				<c:forEach var="item" items="${roles }" varStatus="status">
					<option value="${item.id }">${item.roleName }</option>
				</c:forEach>
			</select>
		</div>
	</form>
	<div class="save">
		<button type="button" class="btn btn-info saveAccount"
			id="save-Account">保存</button>
		<button class="btn btn-warning" id="cancel">取消</button>
	</div>
</div>
<script>
	$(function() {

		//取消按钮
		$("#cancel").on(
				"click",
				function() {
					$(".content_panel").load(
							"${pageContext.request.contextPath }/user/list");
				});

		// 保存提交按钮
		$(".saveAccount").on("click", function() {
			/* $.ajax({
				cache : true, 
				type : "POST",
				url :  $('#submitForm').prop("action"),
				data :  $('#submitForm').serialize(), // formid
				async : false,
				success : function() {			
					toastr.success("保存成功！");	
					$(".content_panel").load("${pageContext.request.contextPath }/user/list");
				}
			}); */
			$form.trigger("submit");
		});

		//为非空验证做准备
		var $add = $(".add");
		var $form = $add.find(".form-inline");
		var $input = $form.find("input");

		// 初始化表单提交
		$form.on("submit", function(e) {
			e.preventDefault()
			var $this = $(this);

			$this.ajaxSubmit({
				beforeSubmit : function(data, $form) {
					var username = $form.find("input[id='username']");
					var accountDepartment = $form
							.find("select[id='accountDepartment']");
					var accountRole = $form.find("select[id='accountRole']");

					// 非空验证
					if ($.trim(username.val()) === "") {
						return showInputErrorTip(username, "请输入用户名");
					} else if ($.trim(username.val().length) < 6) {
						return showInputErrorTip(username, "用户名不少于6位");
					} else {
						hideInputErrorTip(username);
					}

					// 非空验证
					if ($.trim(accountDepartment.val()) === "") {
						return showInputErrorTip(accountDepartment, "请选择用户部门");
					} else {
						hideInputErrorTip(accountDepartment);
					}

					// 非空验证
					if ($.trim(accountRole.val()) === "") {
						return showInputErrorTip(accountRole, "请选择用户角色");
					} else {
						hideInputErrorTip(accountRole);
					}
				},
				success : function() {
					toastr.success("保存成功！");
					$(".content_panel").load(
							"${pageContext.request.contextPath }/user/list");
				},
			});
		});

	});
</script>