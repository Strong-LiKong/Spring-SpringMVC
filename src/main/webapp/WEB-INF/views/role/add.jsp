<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="addR add disappear">
	<h3>添加角色</h3>
	<form class="form-inline" action="${pageContext.request.contextPath }/role/add" method="post" id="submitForm">
		<div class="form-group">
			<label for="">名称：</label>
			<input type="text" class="form-control" name="roleName" id="roleName" maxlength="16" required>
		</div>
		<div class="form-group">
			<label for="">描述：</label>
			<textarea name="description" id="description" cols="60" rows="10" style="resize: none" maxlength="20" required></textarea>
		</div>
		<div class="form-group">
			<label for="">权限：</label>
			<c:forEach var="item" items="${listJurisdiction }" varStatus="status">
					<input type="checkbox" name="ids" value="${item.id }">${item.jurisdictionName }
				</c:forEach>
		</div>
	</form>
	<div class="save">
		<button class="btn btn-info saveRole" type="button">保存</button>
		<button class="btn btn-warning" id="cancel">取消</button>
	</div>
</div>
<script>
	$(function() {
		
		//取消按钮
		$("#cancel").on("click", function() {
			$(".content_panel").load("${pageContext.request.contextPath }/role/list");
		});
		
		//保存提交按钮
		$(".saveRole").on("click", function() {
					
			/* $.ajax({
				cache : true,
				type : "POST",
				url : "${pageContext.request.contextPath }/role/add",
				data :$('#submitForm').serialize(),// 你的formid
				async : false,
				success : function() {
					toastr.success("保存成功！");
					$(".content_panel").load("${pageContext.request.contextPath }/role/list");
				}
			}); */
			$form.trigger("submit");
		});	

		//为非空验证做准备
		var $add = $(".add");
		var $form=$add.find(".form-inline");
		var $input=$form.find("input");

		// 初始化表单提交
		$form.on("submit", function(e) {
			e.preventDefault()
			var $this = $(this);

			$this.ajaxSubmit({
				beforeSubmit : function(data, $form) {
					var roleName = $form.find("input[id='roleName']");
					var description = $form.find("textarea[id='description']");

					// 非空验证
					if ($.trim(roleName.val()) === "") {
						return showInputErrorTip(roleName, "请输入角色名称");
					} else {
						hideInputErrorTip(roleName);
					}

					// 非空验证
					if ($.trim(description.val()) === "") {
						return showInputErrorTip(description, "请输入角色描述");
					} else {
						hideInputErrorTip(description);
					}

					/* // 非空验证
					if ($.trim(ids_checked.length) === "0") {
						return showInputErrorTip(ids, "请选择权限");
					} else {
						hideInputErrorTip(ids);
					} */

				},
				success : function(data) {
					
					if (data.success) {
						
						toastr.success("保存成功！");
						$(".content_panel").load("${pageContext.request.contextPath }/role/list");
					} else {
						
						toastr.error("保存失败，请重新尝试！（至少包含一项权限）");
					}
				}, 

			});
		});	
	});
</script>