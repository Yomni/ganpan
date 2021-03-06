package org.sync.ganpan.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.sync.ganpan.model.vo.InvitationMngVO;
import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.SignBoardVO;

@Repository
public class SignBoardDAOImpl implements SignBoardDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public int getTotalSignBoardCountByTitle(String title) {
		return template.selectOne("signBoard.getTotalSignBoardCountByTitle", title);
	}

	@Override
	public int getTotalSignBoardCountByNickName(String nickName) {
		return template.selectOne("signBoard.getTotalSignBoardCountByNickName", nickName);
	}

	@Override
	public int getTotalJoinSignBoardCountByNickName(String nickName) {
		return template.selectOne("signBoard.getTotalJoinSignBoardCountByNickName", nickName);
	}

	@Override
	public List<SignBoardVO> findSignBoardListByTitle(Map<String, Object> tempMap) {
		List<SignBoardVO> sbList = template.selectList("signBoard.findSignBoardListByTitle", tempMap);
		return sbList;
	}

	@Override
	public int titleCheck(HashMap<String, String> map) {
		return template.selectOne("signBoard.titleCheck", map);
	}

	@Override
	public void createNewGanpan(HashMap<String, Object> map) {
		template.insert("signBoard.createNewGanpan", map);
	}

	@Override
	public List<SignBoardVO> mySignBoardList(String nickName) {
		return template.selectList("signBoard.mySignBoardList", nickName);
	}

	@Override
	public List<SignBoardVO> mySignBoardList(Map<String, Object> tempMap) {
		List<SignBoardVO> sbList = template.selectList("signBoard.mySignBoardListPaging", tempMap);
		return sbList;
	}
	@Override
	public List<SignBoardVO> myJoinSignBoardList(String nickName) {
		return template.selectList("signBoard.myJoinSignBoardList", nickName);
	}

	@Override
	public List<SignBoardVO> myJoinSignBoardList(Map<String, Object> tempMap) {
		return template.selectList("signBoard.myJoinSignBoardListPaing", tempMap);
	}

	@Override
	public List<SignBoardVO> myPublicSignBoardList(String nickName) {
		return template.selectList("signBoard.myPublicSignBoardList", nickName);
	}

	@Override
	public List<SignBoardVO> myPublicJoinSignBoardList(String nickName) {
		return template.selectList("signBoard.myPublicJoinSignBoardList", nickName);
	}

	@Override
	public List<SignBoardVO> myPrivateSignBoardList(String nickName) {
		return template.selectList("signBoard.myPrivateSignBoardList", nickName);
	}

	@Override
	public List<SignBoardVO> myPrivateJoinSignBoardList(String nickName) {
		return template.selectList("signBoard.myPrivateJoinSignBoardList", nickName);
	}

	@Override
	public SignBoardVO ganpanSetting(SignBoardVO svo) {
		return template.selectOne("signBoard.ganpanSetting", svo);
	}

	@Override
	public List<InvitationMngVO> invitationList(String nickName) {
		return template.selectList("signBoard.invitationList", nickName);
	}
	
	@Override
	public List<InvitationMngVO> invitationList(Map<String, Object> map) {
		return template.selectList("signBoard.invitationListPaging", map);
	}

	@Override
	public int getTotalInvitationCount(String nickName) {
		return template.selectOne("signBoard.getTotalInvitationCount",nickName);
	}

	@Override
	public void deleteInvitationMng(InvitationMngVO ivo) {
		template.delete("invitationMng.deleteInvitationMng", ivo);
	}

	@Override
	public void addOrganization(InvitationMngVO ivo) {
		template.insert("invitationMng.addOrganization", ivo);
	}

	@Override
	public SignBoardVO ganpanSettingPage(SignBoardVO svo) {
		return template.selectOne("signBoard.ganpanSettingPage", svo);
	}

	@Override
	public void updateSignBoardName(HashMap<String, String> map) {
		template.update("signBoard.updateSignBoardName", map);
	}

	@Override
	public void updateVisibility(SignBoardVO signBoardVO) {
		template.update("signBoard.updateVisibility", signBoardVO);
	}

	@Override
	public void deleteSignBoard(SignBoardVO svo) {
		template.delete("signBoard.deleteSignBoard", svo);
	}

	@Override
	public void updateSignBoardBoss(OrganizationVO ovo) {
		template.update("signBoard.updateSignBoardBoss", ovo);
	}



}// class
