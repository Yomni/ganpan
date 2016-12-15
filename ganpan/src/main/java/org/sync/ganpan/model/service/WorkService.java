package org.sync.ganpan.model.service;

import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.WorkVO;

public interface WorkService {

	int updateWorkerToNull(OrganizationVO ovo);
	void createWork(WorkVO wvo);
	void deleteWork(int workNo);
	void updateWork(WorkVO wvo);
	void joinAsWorkerByWorkNo(String workNo, String nickName);
	boolean moveWork(int workNo);
	
}