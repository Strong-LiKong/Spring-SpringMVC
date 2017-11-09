package com.shixun.online.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shixun.online.dao.JurisdictionDao;
import com.shixun.online.model.Jurisdiction;

@Transactional
@Service("jurisdictionService")
public class JurisdictionService {

    @Autowired
    private JurisdictionDao jurisdictionDao;

    /**
     *  获取权限列表
     * @param page
     * @param pageSize
     * @return
     */
    public List<Jurisdiction> getjurisdiction(int page, int pageSize) {
        List<Jurisdiction> listJurisdiction = jurisdictionDao.getjurisdiction(page, pageSize);
        return listJurisdiction;
    }

    /**
     *  分页
     * @return
     */
    public int getJurisdictionSize() {
        int jurisdictionSize = jurisdictionDao.getJurisdictionSize();
        return jurisdictionSize;
    }

    /**
     *  保存
     * @param jurisdiction
     */
    public void saveJurisdiction(Jurisdiction jurisdiction) {
        jurisdictionDao.saveJurisdiction(jurisdiction);
    }

    /**
     *  删除
     * @param id
     */
    public void removeJurisdiction(Integer id) {
        jurisdictionDao.removeJurisdiction(id);
    }
    
    /**
     *  多选删除
     * @param id
     */
    public void delete(Integer[] checkbox) {
    	String ids="";
    	
    	for (Integer integer : checkbox) {
			ids += integer+",";
		}
    	
    	ids = ids.substring(0, ids.length()-1);
    	
    	// 查询数据库看有没有中间表关联
    	List<Map<String, Object>> roleJurisdictionByJurisdiction = jurisdictionDao.getRoleJurisdictionByJurisdiction(ids);
    	System.out.println("roleJurisdictionByJurisdiction:"+roleJurisdictionByJurisdiction);
    	if(roleJurisdictionByJurisdiction != null&&roleJurisdictionByJurisdiction.size()>0){
    		throw new RuntimeException("权限有关联，不能删除");
    	}
    	jurisdictionDao.delete(checkbox);
    	
    	
    }


    /**
     *  获取编辑id
     * @param id
     * @return
     */
    public Jurisdiction get(Integer id) {
        return jurisdictionDao.get(id);
    }

    /**
     *  更新
     * @param jurisdiction
     * @return
     */
    public boolean updateJurisdiction(Jurisdiction jurisdiction) {
        if (jurisdictionDao.updateJurisdiction(jurisdiction)) {
            return true;
        } else {
            return false;
        }
    }
}
