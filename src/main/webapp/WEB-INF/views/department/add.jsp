<div class="addR add disappear">
	<h3>添加部门</h3>
	<form class="form-inline" action="${pageContext.request.contextPath }/department/add" method="post">
		<div class="form-group">
			<label for="">名称：</label>
			<input type="text" class="form-control" name="departmentName" id="departmentName" maxlength="16" required>
		</div>
		<div class="form-group">
			<label for="">描述：</label>
			<textarea name="description" id="description" cols="60" rows="10" style="resize: none" maxlength="20" required></textarea>
		</div>
	</form>
	<div class="save">
		<button class="btn btn-info saveDepartment" id="save-Department">保存</button>
		<button class="btn btn-warning" id="cancel">取消</button>
	</div>
</div>
<script>
	$(function() { 
		
		//取消按钮
		$("#cancel").on("click", function() {
			$(".content_panel").load("${pageContext.request.contextPath }/department/list");
		});
		
		//保存提交按钮
		$(".saveDepartment").on("click", function() {
			/* var departmentName = $("#departmentName").val();
			var description = $("#description").val();
			$.ajax({
				url : "${pageContext.request.contextPath }/department/add",
				sync : "true",
				type : "post",
				data : {
					"departmentName" : departmentName,
					"description" : description
				},
				success : function() {
					toastr.success("保存成功！");
					$(".content_panel").load("${pageContext.request.contextPath }/department/list");
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
					var departmentName = $form.find("input[id='departmentName']");
					var description = $form.find("textarea[id='description']");

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
				success : function() {
					toastr.success("保存成功！");
					$(".content_panel").load("${pageContext.request.contextPath }/department/list");
				},
			});
		});
	});
</script>