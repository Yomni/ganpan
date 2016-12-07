package org.sync.ganpan.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.sync.ganpan.model.vo.InvitationMngVO;
import org.sync.ganpan.model.vo.SignBoardVO;
import org.sync.ganpan.model.vo.WorkVO;

public interface SignBoardDAO {

	List<SignBoardVO> findSignBoardListByTitle(String title);

	int titleCheck(HashMap<String, String> map);

	void createNewGanpan(HashMap<String, Object> map);

	List<SignBoardVO> allSignBoardList(String nickName);

	List<SignBoardVO> mySignBoardList(String nickName);

	List<SignBoardVO> myJoinSignBoardList(String nickName);

	List<SignBoardVO> myPublicSignBoardList(String nickName);

	List<SignBoardVO> myPublicJoinSignBoardList(String nickName);

	List<SignBoardVO> myPrivateSignBoardList(String nickName);

	List<SignBoardVO> myPrivateJoinSignBoardList(String nickName);

	List<WorkVO> showContentList(SignBoardVO svo);

	SignBoardVO ganpanSetting(SignBoardVO svo);

	List<InvitationMngVO> invitationList(String nickName);

	void deleteInvitationMng(InvitationMngVO ivo);

	void addOrganization(InvitationMngVO ivo);

	SignBoardVO ganpanSettingPage(SignBoardVO svo);

	void updateSignBoardName(HashMap<String, String> map);

	void updateVisibility(SignBoardVO signBoardVO);

	void deleteSignBoard(SignBoardVO svo);

}