package org.sync.ganpan.model.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.sync.ganpan.model.vo.ChangeMngVO;
import org.sync.ganpan.model.vo.SignBoardVO;
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
		return template.selectList("changeMng.showChangeMngListEachBoard", argMap);
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

	@Override
	public List<ChangeMngVO> showTotalChangeMngList(SignBoardVO svo) {
		return template.selectList("changeMng.showTotalChangeMngList", svo);
	}

	@Override
	public int getTotalChangeMngCountEachBoard(Map<String, Object> argMap) {
		return template.selectOne("changeMng.getTotalChangeMngCount", argMap);
	}
}// class ChangeMngDAOImpl
