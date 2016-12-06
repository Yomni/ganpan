package org.sync.ganpan.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.concurrent.SynchronousQueue;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.sync.ganpan.model.dao.HaveBoardDAO;
import org.sync.ganpan.model.dao.SignBoardDAO;
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
	public List<SignBoardVO> findSignBoardListByTitle(String title) {
		return signBoardDAO.findSignBoardListByTitle(title);
	}

	@Override
	public int titleCheck(HashMap<String, String> map) {
		return signBoardDAO.titleCheck(map);
	}

	@Override
	public void createNewGanpan(HashMap<String, Object> map) {
		signBoardDAO.createNewGanpan(map);
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
	
	public HashMap<String, List> homeSignBoardList(String nickName) {
		HashMap<String, List> sbMap = new HashMap<String, List>();
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
	public SignBoardVO showGanpan(SignBoardVO svo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("signBoardName", svo.getSignBoardName());
		map.put("bossNickName", svo.getBossMemberVO().getNickName());
		System.out.println("map signBaordName : "+map.get("signBoardName")+" "+map.get("bossNickName"));
		
		map.put("boardNo", "1");
		List<WorkVO> toDoWorkList=workDAO.getWorkList(map);
		System.out.println("key가 boardNo 값 : "+map.get("boardNo"));
		for(int i=0; i<toDoWorkList.size(); i++){
			System.out.println(toDoWorkList.get(i).toString());
		}
		
		
		/*map.put("boardNo", "2");
		List<WorkVO> doingWorkList=workDAO.getWorkList(map);
		map.put("boardNo", "3");
		List<WorkVO> doneWorkList=workDAO.getWorkList(map);*/

		List<HaveBoardVO> boardList = haveBoardDAO.getHaveBoardList();
		// boardList의 size는 무조건 3(todo, doing, done)
		// todo work셋팅
		boardList.get(0).setWorks(toDoWorkList);
		
		/*boardList.get(1).setWorks(doingWorkList);
		boardList.get(2).setWorks(doneWorkList);
*/		
//		svo.setBoardList(boardList);
		return svo;
	}

	@Override
	public SignBoardVO ganpanSettingPage(SignBoardVO svo) {
		return null;
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

}



