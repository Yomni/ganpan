package org.sync.ganpan.model.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.sync.ganpan.model.vo.WorkVO;

@Repository
public class ChangeMngDAOImpl implements ChangeMngDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public void insertLog(WorkVO wvo) {
	}
	
	
	
	

}//class ChangeMngDAOImpl
