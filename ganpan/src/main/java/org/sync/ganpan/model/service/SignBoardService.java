package org.sync.ganpan.model.service;

import java.util.HashMap;
import java.util.List;

import org.sync.ganpan.model.vo.SignBoardVO;

public interface SignBoardService {

	List<SignBoardVO> findSignBoardListByTitle(String title);

	int titleCheck(HashMap<String, String> map);

	void createNewGanpan(HashMap<String, Object> map);
	
	List<SignBoardVO> allSignBoardList(String nickName);

	List<SignBoardVO> mySignBoardList(String nickName);

	List<SignBoardVO> myJoinSignBoardList(String nickName);

	List<SignBoardVO> showContentList(String bossNickName, String signBoardName);
	
	HashMap<String, List> homeSignBoardList(String nickName);

}