package com.shixun.online.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shixun.online.commons.BaseController;
import com.shixun.online.commons.PageShow;
import com.shixun.online.commons.ResponseData;
import com.shixun.online.commons.SimpleHandler;
import com.shixun.online.model.Department;
import com.shixun.online.service.DepartmentService;

@Controller
@RequestMapping("/department")
public class DepartmentAction extends BaseController {

	@Autowired
	private DepartmentService departmentService;

	 /**
	 * 获取信息列表
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @RequestParam(value = "pageNow", defaultValue = "1", required = false) int pageNow,
			@RequestParam(value = "pageSize", defaultValue = "10", required = false) int pageSize) {
		List<Department> listDepartment = departmentService.getdepartment(pageNow, pageSize);
		if (listDepartment != null && listDepartment.size() > 0) {
			model.addAttribute("listDepartment", listDepartment);
			PageShow page = new PageShow(pageNow, departmentService.getDepartmentSize(), pageSize);
			model.addAttribute("page", page);
		}
		return "department/list";
	}

	/**
	 * 跳转到添加页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add() {
		return "department/add";
	}

	/**
	 * 保存
	 * 
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData add(HttpServletRequest request, Department department) {

		SimpleHandler handler = new SimpleHandler(request) {

			@Override
			protected void doHandle(ResponseData responseData) throws Exception {
				departmentService.saveDepartment(department);
			}
		};

		// 返回处理结果（json 格式）
		return handler.handle();
	}

	/**
	 * 删除
	 * 
	 * @return
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseData removeDepartment(HttpServletRequest request, @PathVariable Integer id) {
		SimpleHandler handler = new SimpleHandler(request) {

			@Override
			protected void doHandle(ResponseData responseData) throws Exception {
				departmentService.removeDepartment(id);
			}
		};

		// 返回处理结果（json 格式）
		return handler.handle();
	}
	
	/**
	 * 删除多个
	 * 
	 * @return
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData delete(HttpServletRequest request, Integer[] checkbox) {
		SimpleHandler handler = new SimpleHandler(request) {

			@Override
			protected void doHandle(ResponseData responseData) throws Exception {
				departmentService.delete(checkbox);
			}
		};

		// 返回处理结果（json 格式）
		return handler.handle();
	}

	/**
	 * 跳转到编辑部门(编辑)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String editDepartment(Model model, @PathVariable Integer id) {
		model.addAttribute("department", departmentService.get(id));
		return "department/edit";
	}

	/**
	 * 更新编辑过的部门信息（保存）
	 * 
	 * @return
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData edit(HttpServletRequest request, Department department) {

		SimpleHandler handler = new SimpleHandler(request) {

			@Override
			protected void doHandle(ResponseData responseData) throws Exception {
				departmentService.updateDepartment(department);
			}
		};

		// 返回处理结果（json 格式）
		return handler.handle();
	}
}
