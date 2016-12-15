package org.sync.ganpan.model.dao;

import java.util.List;

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
	public void insertLogForMoveWork(int workNo) {
		template.insert("changeMng.insertLogForMoveWork", workNo);
	}
	@Override
	public void insertLogForCreateWork(int workNo) {
		template.insert("changeMng.insertLogForCreateWorkByMove", workNo);
	}
	@Override
	public List<ChangeMngVO> showChangeMngList(SignBoardVO svo) {
		return template.selectList("changeMng.showChangeMngList", svo);
	}

}// class ChangeMngDAOImpl
