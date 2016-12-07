package org.sync.ganpan.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.sync.ganpan.model.dao.HaveBoardDAO;
import org.sync.ganpan.model.dao.SignBoardDAO;
import org.sync.ganpan.model.vo.OrganizationVO;

import org.sync.ganpan.model.dao.WorkDAO;

import org.sync.ganpan.model.vo.HaveBoardVO;


import org.sync.ganpan.model.vo.InvitationMngVO;

import org.sync.ganpan.model.vo.SignBoardVO;
import org.sync.ganpan.model.vo.WorkVO;

/**
 * SignBoard의 Business layer를 담당하기 위한 ServiceClass
 * @author JYM
 *
 */
@Service
public class SignBoardServiceImpl implements SignBoardService {
	@Resource
	private SignBoardDAO signBoardDAO;
	@Resource
	private WorkDAO workDAO;
	@Resource
	private HaveBoardDAO haveBoardDAO;

	@Override
	public Map<String, Object> findSignBoardListByTitle(String title) {
		List<SignBoardVO> tempList = signBoardDAO.findSignBoardListByTitle(title);
		int signBoardCount = tempList.size();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sbList", tempList);
		map.put("signBoardCount", signBoardCount);
		return map;
	}

	@Override
	public int titleCheck(HashMap<String, String> map) {
		return signBoardDAO.titleCheck(map);
	}

	@Override
	@Transactional
	public void createNewGanpan(HashMap<String, Object> map) {
		signBoardDAO.createNewGanpan(map);
		// 여기뿐만 아니라 have_board 테이블에도 삽입해줘야 합니다...
		for (int i = 1; i < 4; i++) {
			map.put("boardNo", i);
			haveBoardDAO.createNewGanpan(map);
		}
	}

	@Override
	public List<SignBoardVO> allSignBoardList(String nickName) {
		return signBoardDAO.allSignBoardList(nickName);
	}

	@Override
	public List<SignBoardVO> mySignBoardList(String nickName) {
		return signBoardDAO.mySignBoardList(nickName);
	}

	@Override
	public List<SignBoardVO> myJoinSignBoardList(String nickName) {
		return signBoardDAO.myJoinSignBoardList(nickName);
	}

	@Override
	@Transactional
	public HashMap<String, List<SignBoardVO>> homeSignBoardList(String nickName) {
		HashMap<String, List<SignBoardVO>> sbMap = new HashMap<String, List<SignBoardVO>>();
		List<SignBoardVO> allList = signBoardDAO.mySignBoardList(nickName);
		List<SignBoardVO> allList2 = signBoardDAO.myJoinSignBoardList(nickName);
		allList.addAll(allList2);
		sbMap.put("allList", allList);
		List<SignBoardVO> publicList = signBoardDAO.myPublicSignBoardList(nickName);
		List<SignBoardVO> publicList2 = signBoardDAO.myPublicJoinSignBoardList(nickName);
		publicList.addAll(publicList2);
		sbMap.put("publicList", publicList);
		List<SignBoardVO> privateList = signBoardDAO.myPrivateSignBoardList(nickName);
		List<SignBoardVO> privateList2 = signBoardDAO.myPrivateJoinSignBoardList(nickName);
		privateList.addAll(privateList2);
		sbMap.put("privateList", privateList);
		return sbMap;
	}

	@Override
	@Transactional
	public SignBoardVO showGanpan(SignBoardVO svo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("signBoardName", svo.getSignBoardName());
		map.put("bossNickName", svo.getBossMemberVO().getNickName());

		map.put("boardNo", "1");
		List<WorkVO> toDoWorkList = workDAO.getWorkList(map);
		map.put("boardNo", "2");
		List<WorkVO> doingWorkList = workDAO.getWorkList(map);
		map.put("boardNo", "3");
		List<WorkVO> doneWorkList = workDAO.getWorkList(map);

		// boardList의 size는 무조건 3(todo, doing, done)
		List<HaveBoardVO> boardList = haveBoardDAO.getHaveBoardList(svo);
		/*for (int i = 0; i < boardList.size(); i++) {
			// boardName이 null값이 불러짐
			System.out.println("-------------------------------");
			System.out.println(boardList.get(i).getBoardGenreVO().getBoardNo());
			System.out.println(boardList.get(i).getBoardGenreVO().getBoardName());
		}*/

		// todo work,doing,done 셋팅
		boardList.get(0).setWorks(toDoWorkList);
		boardList.get(1).setWorks(doingWorkList);
		boardList.get(2).setWorks(doneWorkList);

		svo.setBoardList(boardList);
		return svo;
	}

	@Override
	public List<OrganizationVO> getGroupList(SignBoardVO svo) {
		return signBoardDAO.getGroupList(svo);
	}


	@Override
	public SignBoardVO ganpanSettingPage(SignBoardVO svo) {
		return signBoardDAO.ganpanSettingPage(svo);
	}
	@Override
	public List<InvitationMngVO> invitationList(String nickName) {
		return signBoardDAO.invitationList(nickName);
	}

	@Override
	public void addOrganization(InvitationMngVO ivo) {
		signBoardDAO.addOrganization(ivo);
	}

	@Override
	public void deleteInvitationMng(InvitationMngVO ivo) {
		signBoardDAO.deleteInvitationMng(ivo);
	}

	@Override
	public void updateSignBoardName(HashMap<String, String> map) {
		signBoardDAO.updateSignBoardName(map);
	}

	@Override
	public void updateVisibility(SignBoardVO signBoardVO) {
		signBoardDAO.updateVisibility(signBoardVO);
	}
}
