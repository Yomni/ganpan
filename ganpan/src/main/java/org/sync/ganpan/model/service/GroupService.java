package org.sync.ganpan.model.service;

import java.util.HashMap;
import java.util.List;

import org.sync.ganpan.model.vo.InvitationMngVO;
import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.SignBoardVO;

public interface GroupService {

	void cancelInvitation(InvitationMngVO ivo);

	void inviteWorker(InvitationMngVO ivo);

	List<OrganizationVO> getGroupList(SignBoardVO svo);

	String getNickNameByEmail(String id);

	void banish(OrganizationVO ovo);

	List<HashMap<String, String>> sendInvitationList(SignBoardVO svo);
	
}