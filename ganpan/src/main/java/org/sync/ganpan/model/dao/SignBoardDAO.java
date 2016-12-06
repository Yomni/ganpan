package org.sync.ganpan.model.dao;

import java.util.HashMap;
import java.util.List;

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

	List<SignBoardVO> showContentList(SignBoardVO svo);

	SignBoardVO ganpanSetting(SignBoardVO svo);

}