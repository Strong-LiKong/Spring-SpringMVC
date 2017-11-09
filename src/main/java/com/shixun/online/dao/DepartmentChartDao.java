package com.shixun.online.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * userChart dao类
 * 
 * @author May_X
 *
 */
@Repository
public class DepartmentChartDao {

	@Autowired
	private SessionFactory sessionFactory;

	public List<Map<String, Object>> queryDepartmentList() {

		Session session = sessionFactory.getCurrentSession();

		String sql = "select count(1) as `value`,d.departmentName as `name` from  db_user u left join db_department d on d.id=u.departmentId group by u.departmentId ";
		Query quey = session.createSQLQuery(sql);
		quey.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		List<Map<String, Object>> departmentList = quey.list();

		return departmentList;

	}

}
