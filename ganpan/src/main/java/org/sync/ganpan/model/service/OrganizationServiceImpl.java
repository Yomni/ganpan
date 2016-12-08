package org.sync.ganpan.model.service;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.sync.ganpan.model.dao.OrganizationDAO;
import org.sync.ganpan.model.dao.WorkDAO;
import org.sync.ganpan.model.vo.InvitationMngVO;
import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.SignBoardVO;

/**
 * Group의 Business layer를 위한 ServiceClass
 * @author JYM
 *
 */
@Service

public class OrganizationServiceImpl implements OrganizationService {
	@Resource
	private OrganizationDAO organizationDAO;
	@Resource
	private WorkDAO workDAO;

	@Override
	public int getJoinedSignBoardCount(String nickName) {
		return organizationDAO.getJoinedSignBoardCount(nickName);
	}

	@Override
	public List<OrganizationVO> getOrganizationSignBoardList(String nickName) {
		return organizationDAO.getOrganizationSignBoardList(nickName);
	}

	@Override
	public void cancelInvitation(InvitationMngVO ivo) {
		organizationDAO.cancelInvitation(ivo);
	}

	@Override
	public void inviteWorker(InvitationMngVO ivo) {
		organizationDAO.inviteWorker(ivo);
	}

	/**
	 *  완료 by dhKim,민서
	 */
	@Override
	public List<OrganizationVO> getOrganizationList(SignBoardVO svo) {
		return organizationDAO.getOrganizationList(svo);
	}

	@Override
	public String getNickNameByEmail(String id) {
		return organizationDAO.getNickNameByEmail(id);
	}

	@Override
	@Transactional
	public void banish(OrganizationVO ovo) {
		// work table에서 worker_nickName -> null로 update
		int updateResult = workDAO.updateWorkerToNull(ovo);
		System.out.println("GroupServiceImple의 work에서 updateResult여부 : " + updateResult);// 1이면
																							// update

		// Organization worker_nickName을 삭제
		int deleteResult = organizationDAO.deleteWorker(ovo);
		System.out.println("GroupServiceImple의 group에서 deleteResult여부 : " + deleteResult);// 1이면
																							// delete

	}

	public List<HashMap<String, String>> sendInvitationList(SignBoardVO svo) {
		return organizationDAO.sendInvitationList(svo);
	}

	@Override
	public void leaveOrganization(OrganizationVO ovo) {
		organizationDAO.leaveOrganization(ovo);
	}
}
