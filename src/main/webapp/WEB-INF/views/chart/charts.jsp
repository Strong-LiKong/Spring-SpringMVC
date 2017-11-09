<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body>
<div class="chart-button-pannel">
<button class="btn btn-info userRegister" type="button">注册信息统计</button>
<button class="btn btn-info departmentList" type="button">部门人数统计</button>
</div>
<div class="showChart"></div>
<script type="text/javascript">
$(function(){
	//填充折线图
	$(".userRegister").on("click", function() {
		$(".showChart").load("${pageContext.request.contextPath }/chart/line");
	});
	//填充饼图
	$(".departmentList").on("click", function() {
		$(".showChart").load("${pageContext.request.contextPath }/chart/pie");
	});
})
</script>
</body>
