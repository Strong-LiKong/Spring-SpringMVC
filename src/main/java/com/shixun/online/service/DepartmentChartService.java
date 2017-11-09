package com.shixun.online.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shixun.online.dao.DepartmentChartDao;

/**
 * line图表service 类
 * 
 * @author May_X
 *
 */
@Service("departmentChartService")
@Transactional
public class DepartmentChartService {
	// 注入图表dao
	@Autowired
	private DepartmentChartDao departmentChartDao;

	/**
	 * 获取每个部门对应人数
	 * 
	 * @return
	 */
	public List<Map<String, Object>> queryDepartmentList() {
		List<Map<String, Object>> departmentList = departmentChartDao.queryDepartmentList();
		return departmentList;
	}

}