package com.shixun.online.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shixun.online.commons.BaseController;
import com.shixun.online.commons.ResponseData;
import com.shixun.online.commons.SimpleHandler;
import com.shixun.online.model.User;
import com.shixun.online.service.UserService;

@Controller
public class IndexAction extends BaseController {

	@Autowired
	private UserService userService;

	/**
	 * 跳转到登陆界面
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login/login";
	}

	/**
	 * 跳转到欢迎的界面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public String charts(Model model) {

		return "/welcome/welcome";
	}

	/**
	 * 用户登录
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, HttpSession session, User user) {
		// TODO 需要把登陆方法产生的各种情况描述出来，也就是登陆密码错误，登录名不存在等 -- 需要优化登录处理的逻辑

		if (userService.login(user, session) == 1) {
			return "redirect:/index";
		}

		else if (userService.login(user, session) == 0) {
			model.addAttribute("message", "用户名或密码错误！！请重新输入！！");
			return "login/login";
		} else if (userService.login(user, session) == -2) {
			model.addAttribute("message", "该用户被禁用！！请联系管理员！！");
			return "login/login";
		} else {
			model.addAttribute("message", "该用户不存在！！请注册！！");
			return "login/login";
		}

	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "index";
	}

	/**
	 * 用户注册
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Model model, User user) {
		logger.debug("用户注册 -- username:" + user.getUsername() + "  password:" + user.getPassword());

		if (userService.register(user) == true) {
			model.addAttribute("message1", "注册成功，可以登录！");
			return "login/login";
		} else {
			model.addAttribute("message", "注册失败，该用户已存在！！");
			return "login/login";
		}

	}

	// 跳转到密保界面
	@RequestMapping(value = "/toCheckQuestion", method = RequestMethod.GET)
	public String toCheckQuestion() {
		return "login/forgot";
	}

	// 查询密保及答案
	@RequestMapping(value = "/checkQuestion", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData checkQuestion(User user) {
		SimpleHandler handler = new SimpleHandler(request) {

			@Override
			protected void doHandle(ResponseData responseData) throws Exception {
				int result = userService.checkQuestion(user);
				if (result != 1) {
					responseData.setError("密保输入错误");
				}
			}
		};

		// 返回处理结果（json 格式）
		return handler.handle();
	}

	/**
	 * 首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/ums", method = RequestMethod.GET)
	public String toLogin() {
		return "ums";
	}

	@RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData updatePassword(Model model, String password, String username) {

		SimpleHandler handler = new SimpleHandler(request) {

			@Override
			protected void doHandle(ResponseData responseData) throws Exception {
				boolean result = userService.updatePassword(password, username);
				if (result == false) {
					responseData.setError("修改密码失败！！");
				}
			}
		};
		// 返回处理结果（json 格式）
		return handler.handle();
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		userService.logout(session);
		return "redirect:/login";

	}

}
