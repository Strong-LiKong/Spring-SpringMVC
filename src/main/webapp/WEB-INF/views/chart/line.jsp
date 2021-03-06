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
		//获取日期
		var getCreateDate = function() {
			var getCreateDate = "${createDate}";

			return getCreateDate;
		};
		////获取人数
		var getCounts = function() {
			var counts = "${counts}";

			return counts;
		};
		// 路径配置
		require.config({
			paths : {
				echarts : 'http://echarts.baidu.com/build/dist'
			}
		});

		// 使用
		require([ 'echarts', 'echarts/chart/line' // 使用柱状图就加载bar模块，按需加载
		], function(ec) {
			// 基于准备好的dom，初始化echarts图表
			var myChart = ec.init(document.getElementById('main'));

			option = {
				title : {
					text : '最近一周系统人数变化',
					subtext : '仅供参考'
				},
				tooltip : {
					trigger : 'axis'
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
							type : [ 'line', 'bar' ]
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
				xAxis : [ {
					type : 'category',
					boundaryGap : false,
					data : eval(getCreateDate())
				} ],
				yAxis : [ {
					type : 'value',
					axisLabel : {
						formatter : '{value} 人'
					}
				} ],
				series : [ {
					name : '增加人数',
					type : 'line',
					data : eval(getCounts()),
				},]
			};

			// 为echarts对象加载数据 
			myChart.setOption(option);
		});
	</script>
</body>
