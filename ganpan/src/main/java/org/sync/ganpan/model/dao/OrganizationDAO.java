package org.sync.ganpan.model.dao;

import java.util.HashMap;
import java.util.List;

import org.sync.ganpan.model.vo.InvitationMngVO;
import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.SignBoardVO;

public interface OrganizationDAO {

	void cancelInvitation(InvitationMngVO ivo);

	void inviteWorker(InvitationMngVO ivo);

	String getNickNameByEmail(String id);

	int deleteWorker(OrganizationVO ovo);

	void registerBossNickName(HashMap<String, Object> map);

	List<HashMap<String, String>> sendInvitationList(SignBoardVO svo);

	void leaveOrganization(OrganizationVO ovo);

	List<OrganizationVO> getOrganizationSignBoardList(String nickName);

	List<OrganizationVO> getOrganizationList(SignBoardVO svo);

	int getJoinedSignBoardCount(String nickName);

	int groupCheck(OrganizationVO ovo);

	int groupBossCheck(OrganizationVO ovo);
	
}// interface GroupDAO