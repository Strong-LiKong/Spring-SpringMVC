<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>ECharts</title>
</head>
<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="height: 400px"></div>
	<!-- ECharts单文件引入 -->
	<script src="http://echarts.baidu.com/build/dist/echarts.js "></script>
	<script type="text/javascript">
		//获取部门名称
		var getDepartmentList = function() {
			var departmentList = "${departmentList }";

			return departmentList;
		};
		var getDepartmentNames = function() {
			var departmentName = "${departmentNames}";

			return departmentName;
		};
		// 路径配置
		require.config({
			paths : {
				echarts : 'http://echarts.baidu.com/build/dist'
			}
		});

		// 使用
		require([ 'echarts', 'echarts/chart/pie' // 使用柱状图就加载bar模块，按需加载
		], function(ec) {
			// 基于准备好的dom，初始化echarts图表
			var myChart = ec.init(document.getElementById('main'));

			var option = {
				title : {
					text : '部门人数统计',
					subtext : '仅供参考',
					x : 'center'
				},

				tooltip : {
					trigger : 'item',
					formatter : "{a} <br/>{b} : {c} ({d}%)"
				},
				legend : {
					orient : 'vertical',
					x : 'left',
					data : eval(getDepartmentNames())
				},
				toolbox : {
					show : true,
					feature : {
						mark : {
							show : true
						},
						dataView : {
							show : true,
							readOnly : false
						},
						magicType : {
							show : true,
							type : [ 'pie', 'funnel' ],
							option : {
								funnel : {
									x : '25%',
									width : '50%',
									funnelAlign : 'left',
									max : 1548
								}
							}
						},
						restore : {
							show : true
						},
						saveAsImage : {
							show : true
						}
					}
				},
				calculable : true,
				series : [ {
					name : '数据信息',
					type : 'pie',
					radius : '55%',
					center : [ '50%', '60%' ],
					data : eval(getDepartmentList())
				} ]
			};

			// 为echarts对象加载数据 
			myChart.setOption(option);
		});
	</script>
</body>
