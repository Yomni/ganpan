package org.sync.ganpan.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.sync.ganpan.model.dao.GroupDAO;
import org.sync.ganpan.model.vo.InvitationMngVO;

/**
 * Group의 Business layer를 위한 ServiceClass
 * @author JYM
 *
 */
@Service
public class GroupServiceImpl implements GroupService {
	@Resource
	private GroupDAO groupDAO;

	@Override
	public void cancelInvitation(InvitationMngVO ivo) {
		groupDAO.cancelInvitation(ivo);
	}

	@Override
	public void inviteWorker(InvitationMngVO ivo) {
		groupDAO.inviteWorker(ivo);
	}

}
