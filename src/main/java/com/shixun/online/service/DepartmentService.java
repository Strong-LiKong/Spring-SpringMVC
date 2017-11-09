package com.shixun.online.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shixun.online.dao.DepartmentDao;
import com.shixun.online.model.Department;
import com.shixun.online.model.Role;

@Transactional
@Service("departmentService")
public class DepartmentService {

    @Autowired
    private DepartmentDao departmentDao;

    /**
     *  获取department
     * @param page
     * @param pageSize
     * @return
     */
    public List<Department> getdepartment(int page, int pageSize) {
        List<Department> listDepartment = departmentDao.getdepartment(page, pageSize);
        return listDepartment;
    }
    public List<Department> getDepartments() {
        List<Department> listDepartment = departmentDao.getDepartments();
        return listDepartment;
    }
    /**
     *  分页
     * @return
     */
    public int getDepartmentSize() {
        int departmentSize = departmentDao.getDepartmentSize();
        return departmentSize;
    }

    /**
     *  保存
     * @param department
     */
    public void saveDepartment(Department department) {
        departmentDao.saveDepartment(department);
    }

    /**
     *  删除
     * @param id
     */
    public void removeDepartment(Integer id) {
        Department department = new Department();
        department.setId(id);
        departmentDao.removeDepartment(department);
    }
    
    /**
     *  多选删除
     * @param id
     */
    public void delete(Integer[] checkbox) {
        departmentDao.delete(checkbox);
    }

    /**
     * 获得部门id
     * @param id
     * @return
     */
    public Department get(Integer id) {
        return departmentDao.get(id);
    }

    /**
     * 更新
     * @param department
     * @return
     */
    public Boolean updateDepartment(Department department) {
        if (departmentDao.updateDepartment(department)) {
            return true;
        } else {
            return false;
        }
    }
}
