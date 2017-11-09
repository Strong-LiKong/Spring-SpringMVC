package com.shixun.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
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
import com.shixun.online.model.Jurisdiction;
import com.shixun.online.service.JurisdictionService;

@Controller("jurisdictionAction")
@RequestMapping("/jurisdiction")
public class JurisdictionAction {

	@Autowired
	private JurisdictionService jurisdictionService;

	// 动态改变 页面取得
	private int pageNow = 1;

	// 固定不变
	private int pageSize = 6;

	/**
	 * 获取数据
	 * @param model
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @RequestParam(value = "pageNow", defaultValue = "1", required = false) int pageNow,
			@RequestParam(value = "pageSize", defaultValue = "10", required = false) int pageSize) {
		List<Jurisdiction> listJurisdiction = jurisdictionService.getjurisdiction(pageNow, pageSize);
		if (listJurisdiction != null && listJurisdiction.size() > 0) {
			PageShow page = new PageShow(pageNow, jurisdictionService.getJurisdictionSize(), pageSize);
			model.addAttribute("page", page);
			model.addAttribute("listJurisdiction", listJurisdiction);
		}
		return "jurisdiction/list";
	}

	/**
	 * 保存
	 * 
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addJurisdiction(Jurisdiction jurisdiction) {
		jurisdictionService.saveJurisdiction(jurisdiction);
		return "jurisdiction/list";
	}

	 /**
	 * 跳转到保存
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String toAddJurisdiction() {
		return "jurisdiction/add";
	}

	 /**
	 * 删除
	 * @return
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseData removeJurisdiction(HttpServletRequest request, @PathVariable Integer id) {

		SimpleHandler handler = new SimpleHandler(request) {

			@Override
			protected void doHandle(ResponseData responseData) throws Exception {
				jurisdictionService.removeJurisdiction(id);
			}
		};

		// 返回处理结果（json 格式）
		return handler.handle();
	}
	
	/**
	 * 多选删除
	 * @return
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData delete(HttpServletRequest request,Integer[] checkbox) {

		SimpleHandler handler = new SimpleHandler(request) {

			
			@Override
			protected void doHandle(ResponseData responseData) throws Exception {
				jurisdictionService.delete(checkbox);
			}
		};

		// 返回处理结果（json 格式）
		return handler.handle();
	}

	 /**
	 * 跳转到编辑权限的页面，并根据id获取内容（编辑）
	 *
	 * @return
	 */
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String editJurisdiction(Model model, @PathVariable Integer id) {
		model.addAttribute("jurisdiction", jurisdictionService.get(id));
		return "/jurisdiction/edit";
	}

	 /**
	 * 保存编辑过的权限信息（保存）
	 *
	 * @return
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData updateJurisdiction(HttpServletRequest request, Jurisdiction jurisdiction) {
		SimpleHandler handler = new SimpleHandler(request) {

			@Override
			protected void doHandle(ResponseData responseData) throws Exception {
				jurisdictionService.updateJurisdiction(jurisdiction);
			}
		};

		// 返回处理结果（json 格式）
		return handler.handle();
	}

}
