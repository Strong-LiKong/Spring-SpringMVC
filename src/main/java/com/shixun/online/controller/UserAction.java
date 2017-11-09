package com.shixun.online.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.shixun.online.commons.BaseController;
import com.shixun.online.commons.PageShow;
import com.shixun.online.commons.ResponseData;
import com.shixun.online.commons.SimpleHandler;
import com.shixun.online.model.User;
import com.shixun.online.service.DepartmentService;
import com.shixun.online.service.RoleService;
import com.shixun.online.service.UserService;

@Controller
@RequestMapping("/user")
public class UserAction extends BaseController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;
    
    @Autowired
    private DepartmentService departmentService;

   
    /**
     *  查询用户
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model, HttpSession session, @RequestParam(value = "pageNow", defaultValue = "1", required = false) int pageNow, @RequestParam(value = "pageSize", defaultValue = "10", required = false) int pageSize) {
        logger.debug("查询用户列表 pageNow:" + pageNow + " pageSize:" + pageSize);

        model.addAttribute("users", userService.getUser(pageNow, pageSize));
        PageShow page = new PageShow(pageNow, userService.getSize(), pageSize);
        // 保存到request

        model.addAttribute("page", page);

        return "user/list";
    }

    /**
     *  添加用户
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData addAccount(User account) {
        SimpleHandler handler = new SimpleHandler(request) {

            @Override
            protected void doHandle(ResponseData responseData) throws Exception {
                userService.save(account);
            }
        };

        // 返回处理结果（json 格式）
        return handler.handle();
    }

    /**
     *  跳转到添加用户
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String toAddAccount(Model model) {
        model.addAttribute("roles", roleService.getRoles());
        model.addAttribute("departments",departmentService.getDepartments());

        return "user/add";
    }

    /**
     *  删除用户
     * @return
     */
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ResponseData removeAccount(@PathVariable Integer id) {

        SimpleHandler handler = new SimpleHandler(request) {

            @Override
            protected void doHandle(ResponseData responseData) throws Exception {
                userService.delete(id);
            }
        };

        // 返回处理结果（json 格式）
        return handler.handle();
    }
    
	/**
	 * 删除多个
	 */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData delete(Integer[] checkbox) {
        logger.info("删除多个：" + checkbox);
        SimpleHandler handler = new SimpleHandler(request) {
            @Override
            protected void doHandle(ResponseData responseData) throws Exception {
                userService.delete(checkbox);
            }
        };
		return handler.handle();
    }


    /**
     * 跳转到编辑账户界面并根据id获取内容
     */
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String eidtAccount(Model model, @PathVariable Integer id) {
        model.addAttribute("roles", roleService.getRoles());
        model.addAttribute("departments",departmentService.getDepartments());


        if (id != null) {
            model.addAttribute("user", userService.getById(id));
        }
        return "user/edit";
    }

    /**
     * 保存编辑过的用户信息（保存）
     */
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData updateAccount(User administrator) {
        SimpleHandler handler = new SimpleHandler(request) {

            @Override
            protected void doHandle(ResponseData responseData) throws Exception {
                userService.update(administrator);
            }
        };

        // 返回处理结果（json 格式）
        return handler.handle();

    }

    @RequestMapping(value = "/avatar", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData avatar(HttpSession session, MultipartFile avatarFile) {
        SimpleHandler handler = new SimpleHandler(request) {

            @Override
            protected void doHandle(ResponseData responseData) throws Exception {
                userService.uploadAvatar(session, avatarFile, responseData);
            }
        };

        // 返回处理结果（json 格式）
        return handler.handle();
    }
}
