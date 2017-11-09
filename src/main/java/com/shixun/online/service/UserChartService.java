package com.shixun.online.service;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shixun.online.dao.UserChartDao;

/*import com.shixun.online.dao.UserChartDao;*/

/**
 * line图表service 类
 * 
 * @author May_X
 *
 */
@Transactional
@Service("userChartService")
public class UserChartService {
	// 注入图表dao
	@Autowired
	private UserChartDao userChartDao;

	/**
	 * 获取日期和对应的人数
	 * 
	 * @return
	 */
	public List<Map<String, Object>> queryUserList() {
		List<Map<String, Object>> list = userChartDao.queryUserList();
		return list;
	}
}
