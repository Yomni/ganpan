package org.sync.ganpan.model.dao;

import java.util.HashMap;
import java.util.List;

import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.WorkVO;

public interface WorkDAO {

	List<WorkVO> getWorkList(HashMap<String, String> map);

	int updateWorkerToNull(OrganizationVO ovo);

	void createWork(WorkVO wvo);

	void deleteWork(int workNo);

	void updateWorkerToNullByNickName(String nickName);

	void joinAsWorkerByWorkNo(WorkVO wvo);

	int moveWork(int workNo);

	int updateWork(WorkVO wvo);

	
}//interface WorkDAO