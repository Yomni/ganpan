package org.sync.ganpan.model.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.sync.ganpan.model.vo.ChangeMngVO;
import org.sync.ganpan.model.vo.WorkVO;

@Repository
public class ChangeMngDAOImpl implements ChangeMngDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public void insertLogForCreateWork(WorkVO wvo) {
		template.insert("changeMng.insertLogForCreateWork", wvo);
	}

	@Override
	public void insertLogForDeleteWork(int workNo) {
		template.insert("changeMng.insertLogForDeleteWork", workNo);
	}

	@Override
	public List<ChangeMngVO> showChangeMngList(Map<String, Object> argMap) {
		return template.selectList("changeMng.showChangeMngList", argMap);
	}

	@Override
	public void insertLogForMoveWork(int workNo) {
		template.insert("changeMng.insertLogForMoveWork", workNo);
	}

	@Override
	public void insertLogForCreateWork(int workNo) {
		template.insert("changeMng.insertLogForCreateWorkByMove", workNo);
	}

	@Override
	public void insertLogForUpdateWork(WorkVO wvo) {
		template.insert("changeMng.insertLogForUpdateWork", wvo);
	}

	@Override//여기 할것 20161215_19:03
	public Object showTotalChangeMngList(Map<String, Object> argMap) {
		
		return template.selectList("changeMng.showTotalChangeMngList", argMap);
	}

}// class ChangeMngDAOImpl
