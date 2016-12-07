package org.sync.ganpan.model.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.sync.ganpan.model.dao.GroupDAO;
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

public class GroupServiceImpl implements GroupService {
	@Resource
	private GroupDAO groupDAO;
	@Resource
	private WorkDAO workDAO;

	@Override
	public void cancelInvitation(InvitationMngVO ivo) {
		groupDAO.cancelInvitation(ivo);
	}

	@Override
	public void inviteWorker(InvitationMngVO ivo) {
		groupDAO.inviteWorker(ivo);
	}
	/**
	 *  완료 by dhKim,민서
	 */
	@Override
	public List<OrganizationVO> getGroupList(SignBoardVO svo) {
		return groupDAO.getGroupList(svo);
	}

	@Override
	public String getNickNameByEmail(String id) {
		return groupDAO.getNickNameByEmail(id);
	}

	@Override
	@Transactional
	public void banish(OrganizationVO ovo) {
		//work table에서 worker_nickName -> null로 update
		int updateResult=workDAO.updateWorkerToNull(ovo);
		System.out.println("GroupServiceImple의 work에서 updateResult여부 : "+updateResult);//1이면 update
		
		//Organization worker_nickName을 삭제
		int deleteResult=groupDAO.deleteWorker(ovo);
		System.out.println("GroupServiceImple의 group에서 deleteResult여부 : "+deleteResult);//1이면 delete
		
	}
	
	
}//class GroupServiceImpl




