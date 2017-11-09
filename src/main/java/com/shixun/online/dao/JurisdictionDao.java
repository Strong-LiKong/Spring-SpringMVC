package com.shixun.online.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shixun.online.model.Jurisdiction;

@Repository("jurisdictionDao")
public class JurisdictionDao {

    @Autowired
    private SessionFactory sessionFactory;

    /**
     * 更新
     */
    public boolean updateJurisdiction(Jurisdiction jurisdiction) {
        try {
            Session session = sessionFactory.getCurrentSession();
            session.saveOrUpdate(jurisdiction);
            return true;
        } catch (Exception e) {
            System.out.println("出现异常!!!");
        }
        return false;
    }

    /**
     * 删除
     */
    public void removeJurisdiction(Integer id) {
        Session session = sessionFactory.getCurrentSession();
        Jurisdiction jurisdiction = (Jurisdiction) session.get(Jurisdiction.class, id);
        session.delete(jurisdiction);
    }
    
    /**
     * 多选删除
     */
    public void delete(Integer[] checkbox) {
    	String hql = "delete from Jurisdiction where id in (:checkbox)";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameterList("checkbox", checkbox);
		query.executeUpdate();
    }
    
    public List<Map<String,Object>> getRoleJurisdictionByJurisdiction(String idsStr){
    	String sql = "select * from db_role_jurisdiction where jurisdiction_id in ("+idsStr+")";
    	 return sessionFactory.getCurrentSession().createSQLQuery(sql).list();
    }


    /**
     * 查询权限列表
     */
    public List<Jurisdiction> getjurisdiction(int pageNow, int pageSize) {
        Session session = sessionFactory.getCurrentSession();

        Query query = session.createQuery("from Jurisdiction order by id desc");
        query.setFirstResult((pageNow - 1) * pageSize);
        query.setMaxResults(pageSize);
        List<Jurisdiction> listJurisdiction = query.list();

        if (listJurisdiction.size() > 0) {
            return listJurisdiction;
        }

        return null;
    }

    /**
     * 分页
     */
    public int getJurisdictionSize() {
        Session session = sessionFactory.getCurrentSession();

        int size = session.createQuery("from Jurisdiction").list().size();

        return size;
    }

    /**
     * 保存权限
     */
    public void saveJurisdiction(Jurisdiction jurisdiction) {
        Session session = sessionFactory.getCurrentSession();
        jurisdiction.setCreateDate(new Date());
        session.save(jurisdiction);
    }

    /**
     * 获取id
     */
    public Jurisdiction get(Integer id) {
        return (Jurisdiction) sessionFactory.getCurrentSession().get(Jurisdiction.class, id);
    }

}
