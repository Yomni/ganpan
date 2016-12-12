package org.sync.ganpan.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
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

	@Override
	public int updateWorkerToNull(OrganizationVO ovo) {
		return workDAO.updateWorkerToNull(ovo);
	}
	@Override
	public void createWork(WorkVO wvo) {
		workDAO.createWork(wvo);
	}
	@Override
	public void deleteWork(int workNo) {
		workDAO.deleteWork(workNo);
	}
	@Override
	public void updateWork(int workNo) {
		workDAO.updateWork(workNo);
	}
}//class WorkServiceImpl
