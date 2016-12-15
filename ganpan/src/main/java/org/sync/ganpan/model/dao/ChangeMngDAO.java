package org.sync.ganpan.model.dao;

import java.util.List;
import java.util.Map;

import org.sync.ganpan.model.vo.ChangeMngVO;
import org.sync.ganpan.model.vo.WorkVO;

public interface ChangeMngDAO {
	List<ChangeMngVO> showChangeMngList(Map<String, Object> argMap);

	void insertLogForCreateWork(WorkVO wvo);

	void insertLogForDeleteWork(int workNo);

	void insertLogForUpdateWork(WorkVO wvo);
}