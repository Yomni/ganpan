package org.sync.ganpan.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.sync.ganpan.model.dao.ChangeMngDAO;
import org.sync.ganpan.model.dao.WorkDAO;
import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.WorkVO;

/**
 * WorkService의 Business layer를 담당하기 위한 ServiceClass
 * @author JYM
 *
 */
@Service
public class WorkServiceImpl implements WorkService {
	@Resource
	private WorkDAO workDAO;
	@Resource
	private ChangeMngDAO changeMngDAO;

	@Override
	public int updateWorkerToNull(OrganizationVO ovo) {
		return workDAO.updateWorkerToNull(ovo);
	}

	@Override
	public void createWork(WorkVO wvo) {
		workDAO.createWork(wvo);
		System.out.println(wvo);
		changeMngDAO.insertLogForCreateWork(wvo);

	}

	@Override
	public void deleteWork(int workNo) {
		workDAO.deleteWork(workNo);
	}

	@Override
	public void joinAsWorkerByWorkNo(String workNo, String nickName) {
		int workNo2 = Integer.parseInt(workNo);
		WorkVO wvo = new WorkVO(workNo2, nickName);
		workDAO.joinAsWorkerByWorkNo(wvo);
	}


	@Override
	public boolean moveWork(int workNo) {
		boolean returnFlag = false;
		int result = workDAO.moveWork(workNo);
		if (result == 1)
			returnFlag = true;
		return returnFlag;
	}
	
	@Override
	public void updateWork(WorkVO wvo) {
	    workDAO.updateWork(wvo);
	}
}// class WorkServiceImpl
