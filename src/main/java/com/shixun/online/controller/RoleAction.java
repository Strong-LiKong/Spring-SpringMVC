package com.shixun.online.controller;
//

import java.util.List;

import javax.servlet.http.HttpServletRequest;

//import java.util.Date;
//import java.util.List;
//import java.util.Map;
//
//import org.apache.struts2.convention.annotation.Action;
//import org.apache.struts2.convention.annotation.Namespace;
//import org.apache.struts2.convention.annotation.ParentPackage;
//import org.apache.struts2.convention.annotation.Result;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//
//import com.opensymphony.xwork2.ActionContext;
//import com.opensymphony.xwork2.ActionSupport;
//import com.shixun.online.model.Jurisdiction;
//import com.shixun.online.model.PageShow;
//import com.shixun.online.model.Role;
//import com.shixun.online.service.RoleService;
//
//@Namespace("/") // @Namespace来代替<package namespace="">
//@ParentPackage("base") // @ParentPackage来代替<package extends=””>

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shixun.online.commons.PageShow;
import com.shixun.online.commons.ResponseData;
import com.shixun.online.commons.SimpleHandler;
import com.shixun.online.model.Role;
import com.shixun.online.service.RoleService;

@Controller("roleAction")
@RequestMapping("/role")
public class RoleAction {

	//
	@Autowired
	private RoleService roleService;

	/**
	 * 获取role列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String roleManage(Model model,
			@RequestParam(value = "pageNow", defaultValue = "1", required = false) int pageNow,
			@RequestParam(value = "pageSize", defaultValue = "10", required = false) int pageSize) {
		List<Role> listRole = roleService.getrole(pageNow, pageSize);
		if (listRole != null && listRole.size() > 0) {
			// 保存在session
			model.addAttribute("listRole", listRole);
			PageShow page = new PageShow(pageNow, roleService.getRoleSize(), pageSize);

			// 保存到request
			model.addAttribute("page", page);
		}
		return "role/list";
	}

	/**
	 * 保存
	 * 
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData addRole(HttpServletRequest request,Role role, Integer[] ids) {
		
		SimpleHandler handler = new SimpleHandler(request) {

			@Override
			protected void doHandle(ResponseData responseData) throws Exception {
				logger.debug("编辑用户 role:" + role);
				roleService.saveRole(role, ids);
			}
		};

		// 返回处理结果（json 格式）
		return handler.handle();
	}
	

	/**
	 * 跳转到保存
	 * 
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(Model model) {
		model.addAttribute("listJurisdiction", roleService.getJurisdiction());
		return "role/add";
	}

	/**
	 * 删除
	 * 
	 * @return
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseData removeRole(HttpServletRequest request, @PathVariable Integer id) {

		SimpleHandler handler = new SimpleHandler(request) {

			@Override
			protected void doHandle(ResponseData responseData) throws Exception {
				roleService.removeRole(id);
			}
		};

		// 返回处理结果（json 格式）
		return handler.handle();

	}

	/**
	 * 多选删除
	 * 
	 * @return
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData delete(Integer[] checkbox, HttpServletRequest request) {

		SimpleHandler handler = new SimpleHandler(request) {

			@Override
			protected void doHandle(ResponseData responseData) throws Exception {
				roleService.delete(checkbox);
			}
		};

		// 返回处理结果（json 格式）
		return handler.handle();

	}

	/**
	 * 跳转到编辑角色界面，并且根据id获取内容（编辑）
	 * 
	 * @return
	 */
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String edit(Model model, @PathVariable Integer id) {
		Role role = roleService.get(id);
		model.addAttribute("role", role);
		model.addAttribute("listJurisdiction", roleService.getJurisdiction(role.getJurisdictions()));
		return "role/edit";
	}

	/**
	 * 保存编辑户后的角色信息（保存）
	 * 
	 * @return
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData edit(HttpServletRequest request, Role role, Integer[] ids) {

		SimpleHandler handler = new SimpleHandler(request) {

			@Override
			protected void doHandle(ResponseData responseData) throws Exception {
				logger.debug("编辑用户 role:" + role);
				roleService.updateRole(role, ids);
			}
		};

		// 返回处理结果（json 格式）
		return handler.handle();
	}
}
