package com.shixun.online.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shixun.online.service.DepartmentChartService;
/*import com.shixun.online.service.UserChartService;*/
import com.shixun.online.service.UserChartService;

/**
 * 图表 Controller 类
 * 
 * @author May_X
 * 
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/chart")
public class ChartController {

	@Autowired
	private DepartmentChartService departmentChartService;

	@Autowired
	private UserChartService userChartService;

	/**
	 * 获取折线图数据
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/line", method = RequestMethod.GET)
	public String pie(Model model) {
		List<Map<String, Object>> userList = userChartService.queryUserList();
		// 获取日期以及对应的人数
		String createDate = "";
		String counts = "";

		for (Map<String, Object> map : userList) {
			createDate += "," + "'" + map.get("createDate") + "'";
			counts += "," + "'" + map.get("count(1)") + "'";
		}
		System.out.println(createDate);
		System.out.println(counts);
		model.addAttribute("createDate", "[" + createDate.substring(1, createDate.length()) + "]");
		model.addAttribute("counts", "[" + counts.substring(1, counts.length()) + "]");

		return "/chart/line";
	}

	/**
	 * 获取饼图数据
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/pie", method = RequestMethod.GET)
	public String line(Model model) {
		List<Map<String, Object>> departmentList = departmentChartService.queryDepartmentList();
		// 获取部门名称以及对应的人数
		String departmentName = "";
		String listStr = "";

		for (Map<String, Object> map : departmentList) {
			listStr += ", {value:" + map.get("value") + ", name:'" + map.get("name") + "'}";
			departmentName += "," + "'" + map.get("name") + "'";
		}

		model.addAttribute("departmentNames", "[" + departmentName.substring(1, departmentName.length()) + "]");
		model.addAttribute("departmentList", "[" + listStr.substring(1, listStr.length()) + "]");

		return "/chart/pie";
	}

	/**
	 * 跳转到显示图表的界面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/charts", method = RequestMethod.GET)
	public String charts(Model model) {

		return "/chart/charts";
	}

}
