package org.sync.ganpan.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.sync.ganpan.model.vo.WorkVO;

@Repository
public class WorkDAOImpl implements WorkDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public List<WorkVO> getWorkList(HashMap<String, String> map) {
		return template.selectList("work.getWorkList",map);
	}
	
	

}//class WorkDAOImpl
