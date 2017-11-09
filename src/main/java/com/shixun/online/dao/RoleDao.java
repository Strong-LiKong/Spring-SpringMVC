package com.shixun.online.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shixun.online.model.Jurisdiction;
import com.shixun.online.model.Role;

@Repository("roleDao")
public class RoleDao {

	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * 保存
	 */
	public void saveRole(Role role) {
		Session session = sessionFactory.getCurrentSession();
		role.setCreateDate(new Date());
		session.save(role);
	}

	/**
	 * 更新
	 */
	public void updateRole(Role role) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(role);
	}

	/**
	 * 删除
	 */
	public void removeRole(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Role role = (Role) session.get(Role.class, id);
		session.delete(role);
	}

	/**
	 * 多选删除
	 */
	public void delete(Integer[] checkbox) {
		String hql = "delete from Role where id in (:checkbox)";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameterList("checkbox", checkbox);
		query.executeUpdate();
	}

	/**
	 * 查询role
	 */
	public List<Role> getrole(int pageNow, int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Role order by id desc");
		query.setFirstResult((pageNow - 1) * pageSize);
		query.setMaxResults(pageSize);
		List<Role> listRole = query.list();
		return listRole;
	}

	public List<Role> getRoles() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Role");
		List<Role> listRole = query.list();
		return listRole;
	}

	/**
	 * 分页
	 */
	public int getRoleSize() {
		Session session = sessionFactory.getCurrentSession();
		int size = session.createQuery("from Role").list().size();
		return size;
	}

	/**
	 * 获取权限列表
	 */
	public List<Jurisdiction> getJurisdiction() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Jurisdiction");
		List<Jurisdiction> listJurisdiction = query.list();
		return listJurisdiction;
	}

	/**
	 * 获取id
	 */
	public Role get(Integer id) {
		return (Role) sessionFactory.getCurrentSession().get(Role.class, id);
	}

}
