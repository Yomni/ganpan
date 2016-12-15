package org.sync.ganpan.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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
	@Transactional
	public void createWork(WorkVO wvo) {
		workDAO.createWork(wvo);
		changeMngDAO.insertLogForCreateWork(wvo);
	}

	@Override
	@Transactional
	public void deleteWork(int workNo) {
		changeMngDAO.insertLogForDeleteWork(workNo);
		workDAO.deleteWork(workNo);
	}

	@Override
	@Transactional
	public void updateWork(WorkVO wvo) {
		changeMngDAO.insertLogForUpdateWork(wvo);
		workDAO.updateWork(wvo);
	}

	@Override
	@Transactional
	public boolean moveWork(int workNo) {
		boolean returnFlag = false;

		// 변경이력에는 TO_DO -> DOING 시
		// TO_DO변경이력에는 '이동'
		changeMngDAO.insertLogForMoveWork(workNo);

		// 실제로 DB상에서 이동
		int result = workDAO.moveWork(workNo);

		// DOING변경이력에는 '추가'로 저장
		changeMngDAO.insertLogForCreateWork(workNo);

		if (result == 1)
			returnFlag = true;
		return returnFlag;
	}

	@Override
	public void joinAsWorkerByWorkNo(String workNo, String nickName) {
		int workNo2 = Integer.parseInt(workNo);
		WorkVO wvo = new WorkVO(workNo2, nickName);
		workDAO.joinAsWorkerByWorkNo(wvo);
	}

}// class WorkServiceImpl
