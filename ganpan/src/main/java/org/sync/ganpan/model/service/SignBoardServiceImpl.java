package org.sync.ganpan.model.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.sync.ganpan.model.dao.SignBoardDAO;
import org.sync.ganpan.model.vo.SignBoardVO;

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

	@Override
	public List<SignBoardVO> showContentList(String bossNickName, String signBoardName) {
		return signBoardDAO.showContentList(bossNickName,signBoardName);
	}

}
