<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="addR add disappear">
	<h3>编辑角色</h3>
	<form class="form-inline"
		action="${pageContext.request.contextPath }/role/edit" method="post"
		id="submitForm">
		<div>
			<input type="hidden" value="${role.createDate}" name="createDate">
		</div>
		<div class="form-group">
			<input type="hidden" value="${role.id}" name="id"> <label
				for="">名称：</label> <input type="text" class="form-control"
				name="roleName" value="${role.roleName}" maxlength="16" required>
		</div>
		<div class="form-group">
			<label for="">描述：</label>
			<textarea name="description" cols="60" rows="10" style="resize: none"
				maxlength="20" required>${role.description}</textarea>
		</div>
		<div class="form-group">
			<label for="">权限：</label>
			<c:forEach var="item" items="${listJurisdiction }" varStatus="status">
				<input type="checkbox" name="ids" value="${item.id }"
					<c:if test="${item.flag }">checked</c:if>>${item.jurisdictionName }
			</c:forEach>
		</div>

	</form>
	<div class="save">
		<button class="btn btn-info updateRole">保存</button>
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
							"${pageContext.request.contextPath }/role/list");
				});

		$(".updateRole").on("click", function() {
			$form.trigger("submit");
		});

		//为非空验证做准备
		var $add = $(".add");
		var $form = $add.find(".form-inline");
		var $input = $form.find("input");

		// 初始化表单提交
		$form
				.on(
						"submit",
						function(e) {
							e.preventDefault()
							var $this = $(this);

							$this
									.ajaxSubmit({
										beforeSubmit : function(data, $form) {
											var roleName = $form
													.find("input[name='roleName']");
											var description = $form
													.find("textarea[name='description']");

											// 非空验证
											if ($.trim(roleName.val()) === "") {
												return showInputErrorTip(
														roleName, "请输入角色名称");
											} else {
												hideInputErrorTip(roleName);
											}

											// 非空验证
											if ($.trim(description.val()) === "") {
												return showInputErrorTip(
														description, "请输入角色描述");
											} else {
												hideInputErrorTip(description);
											}

										},
										success : function(data) {
											if (data.success) {
												toastr.success("更新成功！");
												$(".content_panel")
														.load(
																"${pageContext.request.contextPath }/role/list");
											} else {
												toastr
														.error("更新失败，请重新尝试！（至少包含一项权限）");
											}
										},
									});
						});
	});
</script>