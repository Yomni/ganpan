package org.sync.ganpan.model.dao;

import java.util.List;

import org.sync.ganpan.model.vo.ChangeMngVO;
import org.sync.ganpan.model.vo.SignBoardVO;
import org.sync.ganpan.model.vo.WorkVO;

public interface ChangeMngDAO {

	void insertLogForCreateWork(WorkVO wvo);

	List<ChangeMngVO> showChangeMngList(SignBoardVO svo);

}