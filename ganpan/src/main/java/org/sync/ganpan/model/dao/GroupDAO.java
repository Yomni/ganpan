package org.sync.ganpan.model.dao;

import org.sync.ganpan.model.vo.InvitationMngVO;

public interface GroupDAO {

	void cancelInvitation(InvitationMngVO ivo);

	void inviteWorker(InvitationMngVO ivo);

}