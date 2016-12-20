package org.sync.ganpan.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.sync.ganpan.model.vo.InvitationMngVO;
import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.SignBoardVO;

public interface SignBoardDAO {

	int getTotalSignBoardCountByTitle(String title);
	
	int getTotalSignBoardCountByNickName(String nickName);

	int getTotalJoinSignBoardCountByNickName(String nickName);

	List<SignBoardVO> findSignBoardListByTitle(Map<String, Object> tempMap);
	
	int titleCheck(HashMap<String, String> map);

	void createNewGanpan(HashMap<String, Object> map);

	List<SignBoardVO> mySignBoardList(String nickName);
	
	List<SignBoardVO> mySignBoardList(Map<String, Object> tempMap);

	List<SignBoardVO> myJoinSignBoardList(String nickName);

	List<SignBoardVO> myPublicSignBoardList(String nickName);

	List<SignBoardVO> myPublicJoinSignBoardList(String nickName);

	List<SignBoardVO> myPrivateSignBoardList(String nickName);

	List<SignBoardVO> myPrivateJoinSignBoardList(String nickName);
	
	List<SignBoardVO> myJoinSignBoardList(Map<String, Object> tempMap);

	SignBoardVO ganpanSetting(SignBoardVO svo);

	List<InvitationMngVO> invitationList(String nickName);

	void deleteInvitationMng(InvitationMngVO ivo);

	void addOrganization(InvitationMngVO ivo);

	SignBoardVO ganpanSettingPage(SignBoardVO svo);

	void updateSignBoardName(HashMap<String, String> map);

	void updateVisibility(SignBoardVO signBoardVO);

	void deleteSignBoard(SignBoardVO svo);

	void updateSignBoardBoss(OrganizationVO ovo);

	List<InvitationMngVO> invitationList(Map<String, Object> map);

	int getTotalInvitationCount(String nickName);
	
}