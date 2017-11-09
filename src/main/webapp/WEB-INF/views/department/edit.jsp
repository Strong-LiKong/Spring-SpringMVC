<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="addR add disappear">
	<h3>编辑部门</h3>
	<form class="form-inline" action="${pageContext.request.contextPath }/department/edit" method="post"
		id="submitForm">
		<div>
			<input type="hidden" value="${department.createDate}" name="createDate">
		</div>
		<div class="form-group">
			<input type="hidden" value="${department.id}" name="id"> <label
				for="">名称：</label> <input type="text" class="form-control"
				name="departmentName"
				value="${department.departmentName}" maxlength="16" required>
		</div>
		<div class="form-group">
			<label for="">描述：</label>
			<textarea name="description" cols="60" rows="10" maxlength="20" required>${department.description}</textarea>
		</div>
	</form>
	<div class="save">
		<button class="btn btn-info updateDepartment">保存</button>
		<button class="btn btn-warning" id="cancel">取消</button>
	</div>
</div>
<script>
	$(function() {

		//取消按钮
		$("#cancel").on("click", function() {
			$(".content_panel").load("${pageContext.request.contextPath }/department/list");
		});

		//更新
		$(".updateDepartment").on("click", function() {
			/* $.ajax({
				url : $("#submitForm").prop("action"),
				type : "post",
				data : $("#submitForm").serialize(),
				async : false,
				success : function(data) {
					console.log(data);
					if(data.success){
						toastr.success("更新成功！");
						$(".content_panel").load("${pageContext.request.contextPath }/department/list");	
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
		var $form=$add.find(".form-inline");
		var $input=$form.find("input");

		// 初始化表单提交
		$form.on("submit", function(e) {
			e.preventDefault()
			var $this = $(this);

			$this.ajaxSubmit({
				beforeSubmit : function(data, $form) {
					var departmentName = $form.find("input[name='departmentName']");
					var description = $form.find("textarea[name='description']");

					// 非空验证
					if ($.trim(departmentName.val()) === "") {
						return showInputErrorTip(departmentName, "请输入部门名称");
					} else {
						hideInputErrorTip(departmentName);
					}

					// 非空验证
					if ($.trim(description.val()) === "") {
						return showInputErrorTip(description, "请输入部门描述");
					} else {
						hideInputErrorTip(description);
					}

				},
				/* success : function() {
					toastr.success("保存成功！");
					$(".content_panel").load("${pageContext.request.contextPath }/department/list");
				}, */
				success : function(data) {
					console.log(data);
					if(data.success){
						toastr.success("更新成功！");
						$(".content_panel").load("${pageContext.request.contextPath }/department/list");	
					}
					else{
						toastr.error("出现错误，请更改！");
					}
					
				},
			});
		});
	});
</script>