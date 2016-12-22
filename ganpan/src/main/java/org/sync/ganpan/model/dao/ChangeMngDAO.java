package org.sync.ganpan.model.dao;

import java.util.List;
import java.util.Map;

import org.sync.ganpan.model.vo.ChangeMngVO;
import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.SignBoardVO;
import org.sync.ganpan.model.vo.WorkVO;

public interface ChangeMngDAO {
	List<ChangeMngVO> showChangeMngList(Map<String, Object> argMap);

	void insertLogForCreateWork(WorkVO wvo);

	void insertLogForDeleteWork(int workNo);

	void insertLogForMoveWork(int workNo);

	void insertLogForCreateWork(int workNo);

	void insertLogForUpdateWork(WorkVO wvo);

	List<ChangeMngVO> showTotalChangeMngList(SignBoardVO svo);

	int getTotalChangeMngCountEachBoard(Map<String, Object> argMap);

	List<ChangeMngVO> getAllChangeMngListToJoined(List<OrganizationVO> orgList);

	void deleteSignBoard(SignBoardVO svo);
}