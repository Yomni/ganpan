package org.sync.ganpan.model.service;

import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.WorkVO;

public interface WorkService {

	int updateWorkerToNull(OrganizationVO ovo);
	void createWork(WorkVO wvo);
	void deleteWork(int workNo);
<<<<<<< HEAD
	void updateWork(int workNo);
=======
	void joinAsWorkerByWorkNo(String workNo, String nickName);
>>>>>>> branch 'master' of https://github.com/Yomni/ganpan.git

}