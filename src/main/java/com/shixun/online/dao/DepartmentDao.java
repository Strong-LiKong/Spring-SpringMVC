package com.shixun.online.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shixun.online.model.Department;

@Repository("departmentDao")
public class DepartmentDao {

	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * 保存
	 */
	public void saveDepartment(Department department) {
		Session session = sessionFactory.getCurrentSession();
		department.setCreateDate(new Date());
		session.save(department);
	}

	/**
	 * 更新
	 */
	public boolean updateDepartment(Department department) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.saveOrUpdate(department);
			return true;
		} catch (Exception e) {
			System.out.println("出现异常!!!");
		}
		return false;
	}

	/**
	 * 删除
	 */
	public void removeDepartment(Department department) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(department);
	}

	/**
	 * 多选删除
	 */
	public void delete(Integer[] checkbox) {
		String hql = "delete from Department where id in (:checkbox)";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameterList("checkbox", checkbox);
		query.executeUpdate();
	}

	/**
	 * 查询department
	 */
	public List<Department> getdepartment(int pageNow, int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Department order by id desc");

		query.setFirstResult((pageNow - 1) * pageSize);
		query.setMaxResults(pageSize);
		List<Department> listDepartment = query.list();

		if (listDepartment.size() > 0) {
			return listDepartment;
		}
		return null;
	}

	public List<Department> getDepartments() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Department");
		List<Department> listDepartment = query.list();
		return listDepartment;
	}

	/**
	 * 分页
	 */
	public int getDepartmentSize() {
		Session session = sessionFactory.getCurrentSession();
		int size = session.createQuery("from Department").list().size();
		return size;
	}

	/**
	 * 获取id
	 */
	public Department get(Integer id) {
		return (Department) sessionFactory.getCurrentSession().get(Department.class, id);
	}

}
