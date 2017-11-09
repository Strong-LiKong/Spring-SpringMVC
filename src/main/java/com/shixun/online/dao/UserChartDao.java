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
public class UserChartDao {

	@Autowired
	private SessionFactory sessionFactory;

	public List<Map<String, Object>> queryUserList() {

		Session session = sessionFactory.getCurrentSession();

		String sql = "select count(1),createDate from db_user where DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= createDate group by createDate";
		Query quey = session.createSQLQuery(sql);
		quey.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		List<Map<String, Object>> userList = quey.list();

		return userList;

	}

}
