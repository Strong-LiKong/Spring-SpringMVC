package com.shixun.online.dao;

import java.util.Date;
import java.util.List;
import java.util.Random;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shixun.online.model.Jurisdiction;
import com.shixun.online.model.Role;
import com.shixun.online.model.User;

@Repository("userDao")
public class UserDao {

	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * 获取登录信息
	 */
	public User login(String username) {
		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery("from User where username=? ");
		query.setParameter(0, username);

		return (User) query.uniqueResult();
	}

	/**
	 * 注册
	 * 
	 * @param administrator
	 * @return
	 */
	public void register(User user) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Role where roleName=?");
		query.setParameter(0, "游客");
		List<Role> list = query.list();

		for (Role role : list) {
			user.setRole(role);
			user.setCreateDate(new Date());
			user.setGender("男");
			user.setState("启用");
		}

		session.save(user);
	}

	/**
	 * 注册前的查询
	 * 
	 * @param administrator
	 * @return
	 */
	public int getAdministrator(String username) {
		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery("from User where username=?");
		query.setParameter(0, username);
		List<User> list = query.list();

		return list.size();
	}

	/**
	 * 保存
	 */
	public User save(User administrator) {
		Session session = sessionFactory.getCurrentSession();

		administrator.setCreateDate(new Date());

		session.saveOrUpdate(administrator);
		return null;
	}

	// 找回密码时查询密保及答案
	public User checkQuestion(String username) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery("from User where username=?");
		query.setParameter(0, username);
		List<User> list = query.list();
		for (User administrator : list) {
			return administrator;
		}

		return null;
	}

	// 修改密码
	public void updatePassword(String newPassword, String username) {

		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery("update User set password=? where username=?");
		query.setParameter(0, newPassword);
		query.setParameter(1, username);
		query.executeUpdate();

	}

	public List<User> getUsers(int pageNow, int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User order by id desc");
		query.setFirstResult((pageNow - 1) * pageSize);
		query.setMaxResults(pageSize);
		return query.list();
	}

	public int getSize() {
		Session session = sessionFactory.getCurrentSession();
		int size = session.createQuery("from User").list().size();
		return size;
	}

	// 单行删除
	public void delete(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		User user = (User) session.get(User.class, id);
		session.delete(user);
	}

	// 多行删除
	public void delete(Integer[] checkbox) {

		String hql = "delete from User where id in (:checkbox)";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameterList("checkbox", checkbox);
		query.executeUpdate();

	}

	// 单行查询，用于编辑
	public User getById(int id) {
		return (User) sessionFactory.getCurrentSession().get(User.class, id);
	}

	// 编辑用户
	public void update(User administrator) {
		sessionFactory.getCurrentSession().update(administrator);
	}

}
