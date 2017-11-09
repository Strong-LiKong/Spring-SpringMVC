<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="addR add disappear">
	<h3>编辑权限</h3>
	<form class="form-inline"
		action="${pageContext.request.contextPath }/jurisdiction/edit"
		method="post" id="submitForm">
		<div>
			<input type="hidden" value="${jurisdiction.createDate}" name="createDate">
			<input type="hidden" value="${jurisdiction.styleType}" name="styleType">
		</div>
		<input type="hidden" value="${jurisdiction.id}" name="id">
		<div class="form-group">
			<label for="">名称：</label> <input type="text" class="form-control"
				value="${jurisdiction.jurisdictionName}" name="jurisdictionName"
				maxlength="16" required>
		</div>
		<div class="form-group">
			<label for="">描述：</label>
			<textarea cols="60" rows="10" style="resize: none" name="description"
				maxlength="20" required>${jurisdiction.description}</textarea>
		</div>
		<div class="form-group">
			<label for="">地址：</label> <input type="text" class="form-control"
				value="${jurisdiction. uri}" name="uri">
		</div>
	</form>
	<div class="save">
		<button class="btn btn-info updateJurisdiction">保存</button>
		<button class="btn btn-warning" id="cancel">取消</button>
	</div>
</div>
<script>
	$(function() {

		//取消按钮
		$("#cancel")
				.on(
						"click",
						function() {
							$(".content_panel")
									.load(
											"${pageContext.request.contextPath }/jurisdiction/list");
						});

		$(".updateJurisdiction").on("click", function() {
			/* $.ajax({
				url : $("#submitForm").prop("action"),
				type : "post",
				data : $("#submitForm").serialize(),
				async : false,
				success : function(data) {
					console.log(data);
					if (data.success) {
						toastr.success("更新成功！");
						$(".content_panel").load("${pageContext.request.contextPath }/jurisdiction/list");
					} else {
						toastr.error("出现错误，请更改!");
					}
				},
			}); */
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
											var jurisdictionName = $form
													.find("input[name='jurisdictionName']");
											var description = $form
													.find("textarea[name='description']");

											// 非空验证
											if ($.trim(jurisdictionName.val()) === "") {
												return showInputErrorTip(
														jurisdictionName,
														"请输入权限名称");
											} else {
												hideInputErrorTip(jurisdictionName);
											}

											// 非空验证
											if ($.trim(description.val()) === "") {
												return showInputErrorTip(
														description, "请输入权限描述");
											} else {
												hideInputErrorTip(description);
											}

										},
										/* success : function() {
											toastr.success("保存成功！");
											$(".content_panel")
													.load(
															"${pageContext.request.contextPath }/jurisdiction/list");
										}, */
										success : function(data) {
											console.log(data);
											if (data.success) {
												toastr.success("更新成功！");
												$(".content_panel").load("${pageContext.request.contextPath }/jurisdiction/list");
											} else {
												toastr.error("出现错误，请更改!");
											}
										},
									});
						});

	});
</script>