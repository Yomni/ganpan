package org.sync.ganpan.model.service;

import java.util.HashMap;
import java.util.List;

import org.sync.ganpan.model.vo.InvitationMngVO;
import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.SignBoardVO;

public interface OrganizationService {

	void cancelInvitation(InvitationMngVO ivo);

	void inviteWorker(InvitationMngVO ivo);

	String getNickNameByEmail(String id);

	void banish(OrganizationVO ovo);

	List<HashMap<String, String>> sendInvitationList(SignBoardVO svo);

	void leaveOrganization(OrganizationVO ovo);

	/**
	 * 참여 간판을 모두 가져온다.
	 * @author JYM
	 * @param nickName
	 * @return
	 */
	List<OrganizationVO> getOrganizationSignBoardList(String nickName);

	List<OrganizationVO> getOrganizationList(SignBoardVO svo);

	int getJoinedSignBoardCount(String nickName);

	String groupCheck(String id, String signBoardName, String bossNickName);

	String inviteCheck(String id, String signBoardName, String bossNickName);

}