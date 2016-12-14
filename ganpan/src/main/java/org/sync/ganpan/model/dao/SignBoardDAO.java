package org.sync.ganpan.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.sync.ganpan.model.vo.InvitationMngVO;
import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.PagingBean;
import org.sync.ganpan.model.vo.SignBoardVO;

public interface SignBoardDAO {

	int getTotalSignBoardCount(String title);

	List<SignBoardVO> findSignBoardListByTitle(Map<String, Object> tempMap);

	int titleCheck(HashMap<String, String> map);

	void createNewGanpan(HashMap<String, Object> map);

	List<SignBoardVO> mySignBoardList(String nickName);

	List<SignBoardVO> myJoinSignBoardList(String nickName);

	List<SignBoardVO> myPublicSignBoardList(String nickName);

	List<SignBoardVO> myPublicJoinSignBoardList(String nickName);

	List<SignBoardVO> myPrivateSignBoardList(String nickName);

	List<SignBoardVO> myPrivateJoinSignBoardList(String nickName);

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