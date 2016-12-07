package org.sync.ganpan.model.dao;

import java.util.List;

import org.sync.ganpan.model.vo.InvitationMngVO;
import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.SignBoardVO;

public interface GroupDAO {
	
	void cancelInvitation(InvitationMngVO ivo);
	
	void inviteWorker(InvitationMngVO ivo);
	
	List<OrganizationVO> getGroupList(SignBoardVO svo);

	String getNickNameByEmail(String id);
	
}//interface GroupDAO
