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
		template.delete("changeMng.insertLogForDeleteWork", workNo);
	}

	@Override
	public List<ChangeMngVO> showChangeMngList(SignBoardVO svo) {
		System.out.println("ChangeMngDAOImpl의 svo : "+svo);
		return template.selectList("changeMng.showChangeMngList", svo);
	}

	@Override
	public void insertLogForUpdateWork(WorkVO wvo) {
		template.insert("changeMng.insertLogForUpdateWork",wvo);
	}

}// class ChangeMngDAOImpl
