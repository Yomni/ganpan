package org.sync.ganpan.model.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.sync.ganpan.model.dao.SignBoardDAO;
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
	public List<WorkVO> showContentList(SignBoardVO svo) {
		return signBoardDAO.showContentList(svo);
	}

	@Override
	public SignBoardVO ganpanSettingPage(SignBoardVO svo) {
		return null;
	}

}
