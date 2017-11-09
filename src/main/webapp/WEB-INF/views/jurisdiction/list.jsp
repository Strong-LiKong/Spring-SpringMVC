<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.page{
position: absolute;
top:700px;
}
</style>
<div id="table">
<form action="" id="deleteJurisdictionForm">
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th colspan="5">
					<button class="btn btn-info" id="save-jurisdiction" type="button">添加</button>
					<button class="btn btn-danger remove-jurisdiction" type="button">删除</button>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr class="not-hover">
				<th><input type="checkbox" class="checkbox-all">&nbsp;序号</th>
				<th>名称</th>
				<th>描述</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
			<c:forEach var="item" items="${listJurisdiction }" varStatus="status">
				<tr class="item-list" data-id="${item.id }">
					<td><input type="checkbox" name="checkbox" value="${item.id }"
					data-id="${item.id }">&nbsp;${status.count }</td>
					<td>${item.jurisdictionName }</td>
					<td>${item.description }</td>
					<td>${item.createDate }</td>
					<td class="item-menu-group text-right"><a class="btn btn-sm btn-info eidt-Jurisdiction"
					href="javascript:;" data-id="${item.id }"><i class="iconfont icon-edit2"></i></a> <a
					class="btn btn-sm btn-danger removeJurisdiction" href="javascript:;"
					data-id="${item.id }"><i class="iconfont icon-delete4"></i></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</form>
	<div class="page">
		<table>
			<tr style="border: none">
				<td colspan="6" style="text-align: right; border-right: 0">当前是第<${page.pageNow}>页，共<${page.totalPage}>页
					<c:if test="${page.hasFirst}"></c:if>
				</td>
				<td colspan="2"><a class="firstPage" href="javascript:;">首页</a>
					<c:if test="${page.hasPre}">
						<a class="prePage" href="javascript:;">上一页</a>
					</c:if> <c:if test="${page.hasNext}">
						<a class="nextPage" href="javascript:;">下一页</a>
					</c:if> <c:if test="${page.hasLast}">
						<a class="lastPage" href="javascript:;">尾页</a>
					</c:if></td>
			</tr>
		</table>
	</div>
</div>
<script>
	$(function() {

		//保存按钮
		$("#save-jurisdiction").on("click", function() {
			$(".content_panel").load("${pageContext.request.contextPath }/jurisdiction/add");
		});

		//编辑按钮
		$(".eidt-Jurisdiction").on("click", function() {
			var id = $(this).data("id");
			$(".content_panel").load("${pageContext.request.contextPath }/jurisdiction/edit/"+id);
		});

		////单击时全选中
		$(".checkbox-all").on("click", function() {
			var $this = $(this);
			$("input[name='checkbox']").prop("checked", $this.prop("checked"));
		});

		// 单击一行时选中checked
		$("table").find("tr td:not(:first-child)").on("click", function() {
			var $this = $(this).parent();
			var nowItem = $this.find("input[name='checkbox']");
			// 获取当前行checkbox的状态值
			var isChecked = nowItem.prop("checked");
			nowItem.prop("checked", !isChecked);
		});

		//每一行的删除按钮
		$(".removeJurisdiction").on("click", function() {
			if (confirm("确认删除？")) {
				var $this = $(this);
				var id = $this.data("id");
				$.get("${pageContext.request.contextPath }/jurisdiction/delete/"+id,function(data) {
					if(data.success){
	                    toastr.success("删除成功！");
	                    $(".content_panel").load("${pageContext.request.contextPath }/jurisdiction/list");
					}else{
						toastr.error("该选项已被绑定，不能删除！");
					}
                });
			}
		});
		
		//多选删除
		$(".remove-jurisdiction").on("click", function() {
			var input_checked = $("table").find("input[name='checkbox']:checked");
			if(input_checked.length===0){
				toastr.error("请选择你要删除的内容！");
			}else if (confirm("确认删除？")) {
			$.post("${pageContext.request.contextPath }/jurisdiction/delete",$('#deleteJurisdictionForm').serialize(),function(data){
				if(data.success){
					toastr.success("删除成功！");	
					$(".content_panel").load("${pageContext.request.contextPath }/jurisdiction/list");
				}else{
					toastr.error("有选项已被绑定，不能删除！");
				}
			});
			}
		});	

		//分页
		$(".firstPage").on("click", function() {
			$("#table").load("${pageContext.request.contextPath }/jurisdiction/list?pageNow=1");
		});
		$(".prePage").on("click", function() {
			$("#table").load("${pageContext.request.contextPath }/jurisdiction/list?pageNow=${page.pageNow-1}");
		});
		$(".nextPage").on("click", function() {
			$("#table").load("${pageContext.request.contextPath }/jurisdiction/list?pageNow=${page.pageNow+1}");
		});
		$(".lastPage").on("click", function() {
			$("#table").load("${pageContext.request.contextPath }/jurisdiction/list?pageNow=${page.totalPage}");
		});
	})
</script>