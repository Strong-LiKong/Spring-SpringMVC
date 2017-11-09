package com.shixun.online.service;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shixun.online.dao.RoleDao;
import com.shixun.online.model.Jurisdiction;
import com.shixun.online.model.Role;

@Transactional
@Service("roleService")
public class RoleService {

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private JurisdictionService jurisdictionService;

    /**
     *  获取角色信息
     * @param page
     * @param pageSize
     * @return
     */
    public List<Role> getrole(int page, int pageSize) {
        List<Role> listRole = roleDao.getrole(page, pageSize);
        return listRole;
    }

    public List<Role> getRoles() {
        List<Role> listRole = roleDao.getRoles();
        return listRole;
    }

    /**
     *  分页
     * @return
     */
    public int getRoleSize() {
        int roleSize = roleDao.getRoleSize();
        return roleSize;
    }

    /**
     *  获取权限列表
     * @return
     */
    public List<Jurisdiction> getJurisdiction() {
        List<Jurisdiction> jurisdictions = roleDao.getJurisdiction();
        return jurisdictions;
    }

    public List<Jurisdiction> getJurisdiction(Set<Jurisdiction> roleJurisdictions) {
        List<Jurisdiction> jurisdictions = roleDao.getJurisdiction();
        for (Jurisdiction jurisdiction : jurisdictions) {
            for (Jurisdiction roleJurisdiction : roleJurisdictions) {
                if (jurisdiction.getId() == roleJurisdiction.getId()) {
                    jurisdiction.setFlag(true);
                    break;
                }
            }
        }
        return jurisdictions;
    }

    /**
     *  保存
     * @param role
     */
    public void saveRole(Role role, Integer[] ids) {
        for (Integer id : ids) {
            role.getJurisdictions().add(jurisdictionService.get(id));
        }
        roleDao.saveRole(role);
    }

    /**
     *  删除
     * @param id
     */
    public void removeRole(Integer id) {
        roleDao.removeRole(id);
    }
    
    /**
     *  多选删除
     * @param id
     */
    public void delete(Integer[] checkbox) {
        roleDao.delete(checkbox);
    }

    /**
     *  获取编辑id
     * @param id
     * @return
     */
    public Role get(Integer id) {
        return roleDao.get(id);
    }

    /**
     *  更新
     * @param role
     * @return
     */
    public void updateRole(Role role) {
        roleDao.updateRole(role);
    }

    public void updateRole(Role role, Integer[] ids) {
        for (Integer id : ids) {
            role.getJurisdictions().add(jurisdictionService.get(id));
        }
        roleDao.updateRole(role);
    }
}
