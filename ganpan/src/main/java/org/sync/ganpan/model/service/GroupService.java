package org.sync.ganpan.model.service;

import org.sync.ganpan.model.vo.InvitationMngVO;

public interface GroupService {

	void cancelInvitation(InvitationMngVO ivo);

	void inviteWorker(InvitationMngVO ivo);

}