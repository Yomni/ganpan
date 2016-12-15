package org.sync.ganpan.model.dao;

import java.util.List;

import org.sync.ganpan.model.vo.ChangeMngVO;
import org.sync.ganpan.model.vo.SignBoardVO;
import org.sync.ganpan.model.vo.WorkVO;

public interface ChangeMngDAO {
	List<ChangeMngVO> showChangeMngList(SignBoardVO svo);

	void insertLogForCreateWork(WorkVO wvo);

	void insertLogForDeleteWork(int workNo);

	void insertLogForMoveWork(int workNo);

	void insertLogForCreateWork(int workNo);

	void insertLogForUpdateWork(WorkVO wvo);
}