package com.shixun.online.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.shixun.online.commons.ResponseData;
import com.shixun.online.dao.UserDao;
import com.shixun.online.model.Jurisdiction;
import com.shixun.online.model.User;

@Transactional
@Service("userService")
public class UserService {

	@Autowired
	private UserDao userDao;

	/**
	 * 登陆
	 * 
	 * @param user
	 * @return
	 */
	public int login(User user, HttpSession session) {

		User dbuser = userDao.login(user.getUsername());
		if (dbuser != null) {
			if (dbuser.getState().equals("启用")) {
				if (dbuser.getUsername().equals(user.getUsername())
						&& dbuser.getPassword().equals(user.getPassword())) {

					System.out.println("avatar:" + dbuser.getAvatarPath());
					// 登录成功
					session.setAttribute("currentLoginUser", dbuser);
					// 把权限的set集合转换为list集合，然后就可以排序了
					ArrayList<Jurisdiction> arrayList = new ArrayList<Jurisdiction>(
							dbuser.getRole().getJurisdictions());
					// 排序
					Collections.sort(arrayList, new Comparator<Jurisdiction>() {

						@Override
						public int compare(Jurisdiction o1, Jurisdiction o2) {
							if (o1.getCreateDate().getTime() == o2.getCreateDate().getTime()) {

								if (o1.getId() > o2.getId()) {
									return 1;
								}
								return -1;
							} else if (o1.getCreateDate().getTime() > o2.getCreateDate().getTime()) {
								return 1;
							}
							return -1;
						}
					});

					session.setAttribute("currentJurisdictions", arrayList);
					return 1;
					// 用户名或密码不正确
				} else {
					return 0;
				}
			} else {
				return -2;
			}
		} else {
			// 用户不存在
			return -1;
		}

	}

	//注册
	public boolean register(User user) {
		if (userDao.getAdministrator(user.getUsername()) == 0) {
			userDao.register(user);
			return true;
		}
		return false;
	}

	// 找回密码时查询密保及答案
	public int checkQuestion(User user) {
		User dbuser = userDao.checkQuestion(user.getUsername());
		System.out.println(dbuser);
		if (dbuser.getQuestion().equals(user.getQuestion()) && dbuser.getAnswer().equals(user.getAnswer())) {
			return 1;
		} else {
			return 0;
		}
	}

	// 修改密码
	public boolean updatePassword(String password, String username) {
		User user = userDao.login(username);
		user.setPassword(password);
		userDao.update(user);
		return true;
	}

	public List<User> getUser(int pageNow, int pageSize) {
		return userDao.getUsers(pageNow, pageSize);
	}

	public int getSize() {
		return userDao.getSize();
	}

	/**
	 * 多选删除
	 * 
	 * @param checkbox
	 */
	public void delete(Integer[] checkbox) {
		userDao.delete(checkbox);
	}

	/**
	 * 单选删除
	 * 
	 * @param id
	 */
	public void delete(int id) {
		userDao.delete(id);

	}

	// 编辑时获取单行
	public User getById(int id) {
		return userDao.getById(id);
	}

	// 编辑更新
	public void update(User user) {
		userDao.update(user);
	}

	public void logout(HttpSession session) {
		session.invalidate();
	}

	/**
	 * 头像上传
	 * 
	 * @param session
	 * @param avatarFile
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public void uploadAvatar(HttpSession session, MultipartFile avatarFile, ResponseData responseData)
			throws IllegalStateException, IOException {
		User currentLoginUser = (User) session.getAttribute("currentLoginUser");
		String realPath = session.getServletContext().getRealPath("/resource");
		String pathName = "/avatar/" + avatarFile.getOriginalFilename();
		File file = new File(realPath + pathName);
		file.mkdirs();
		avatarFile.transferTo(file);

		currentLoginUser.setAvatarPath(pathName);
		userDao.save(currentLoginUser);
		responseData.setData(pathName);

	}

	public void save(User user) {
		userDao.save(user);
	}
}
