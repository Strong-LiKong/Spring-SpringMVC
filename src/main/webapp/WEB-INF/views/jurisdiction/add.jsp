<div class="addR add disappear">
	<h3>添加权限</h3>
	<form class="form-inline" action="${pageContext.request.contextPath }/jurisdiction/add" method="post">
		<div class="form-group">
			<label for="">名称：</label>
			<input type="text" class="form-control" name="jurisdictionName" id="jurisdictionName" maxlength="16" required>
		</div>
		<div class="form-group">
			<label for="">描述：</label>
			<textarea name="description" id="description" cols="60" rows="10" style="resize: none" maxlength="16" required></textarea>
		</div>
		<div class="form-group">
            <label for="">地址：</label>
            <input name="uri" type="text" class="form-control" id="uri" >
        </div>
        
        <div class="form-group">
           <label for="">样式：</label> 
           <input type="radio" name="styleType" value="iconfont icon-role"><i class="iconfont icon-role"></i>
           <input type="radio" name="styleType" value="iconfont icon-role1"><i class="iconfont icon-role1"></i>
           <input type="radio" name="styleType" value="iconfont icon-ic-control-Jurisdiction"><i class="iconfont icon-ic-control-Jurisdiction"></i>
           <input type="radio" name="styleType" value="iconfont icon-yunpingtaitubiao_department"><i class="iconfont icon-yunpingtaitubiao_department"></i>
           <input type="radio" name="styleType" value="iconfont icon-ic-control-Jurisdiction"><i class="iconfont icon-ic-control-Jurisdiction"></i>
           <input type="radio" name="styleType" value="iconfont icon-datastatistics1"><i class="iconfont icon-datastatistics1"></i>                                           
           <input type="radio" name="styleType" value="iconfont icon-data1"><i class="iconfont icon-data1"></i>
           <input type="radio" name="styleType" value="iconfont icon-chazhaobiaodanliebiao"><i class="iconfont icon-chazhaobiaodanliebiao"></i>
           <input type="radio" name="styleType" value="iconfont icon-liebiao"><i class="iconfont icon-liebiao"></i>
           <input type="radio" name="styleType" value="iconfont icon-role4"><i class="iconfont icon-role7"></i>
        </div>
        
        
	</form>
	<div class="save">
		<button class="btn btn-info saveJurisdiction">保存</button>
		<button class="btn btn-warning" id="cancel">取消</button>
	</div>
</div>
<script>
	$(function() {
	
		//取消按钮
		$("#cancel").on("click", function() {
			$(".content_panel").load("${pageContext.request.contextPath }/jurisdiction/list");
		});
		
		//保存提交按钮
		$(".saveJurisdiction").on("click", function() {
			/* var jurisdictionName = $("#jurisdictionName").val();
			var description = $("#description").val();
			var uri = $("#uri").val();
			$.ajax({
				url : "${pageContext.request.contextPath }/jurisdiction/add",
				sync : "true",
				type : "post",
				data : {
					"jurisdictionName" : jurisdictionName,
					"description" : description,
					"uri" : uri
				},
				success : function() {
					toastr.success("保存成功！");
					$(".content_panel").load("${pageContext.request.contextPath }/jurisdiction/list");
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
					var jurisdictionName = $form.find("input[id='jurisdictionName']");
					var description = $form.find("textarea[id='description']");

					// 非空验证
					if ($.trim(jurisdictionName.val()) === "") {
						return showInputErrorTip(jurisdictionName, "请输入权限名称");
					} else {
						hideInputErrorTip(jurisdictionName);
					}

					// 非空验证
					if ($.trim(description.val()) === "") {
						return showInputErrorTip(description, "请输入权限描述");
					} else {
						hideInputErrorTip(description);
					}

				},
				success : function() {
					toastr.success("保存成功！");
					$(".content_panel").load("${pageContext.request.contextPath }/jurisdiction/list");
				},
			});
		});
			 
		
	});
</script>