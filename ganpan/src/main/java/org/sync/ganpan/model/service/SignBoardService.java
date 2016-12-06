package org.sync.ganpan.model.service;

import java.util.HashMap;
import java.util.List;

import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.SignBoardVO;
import org.sync.ganpan.model.vo.WorkVO;

public interface SignBoardService {
	
	// 제목으로 간판 리스트 검색
	List<SignBoardVO> findSignBoardListByTitle(String title);

	// 세션 아이디, 간판 타이틀로 존재 유무 반환
	int titleCheck(HashMap<String, String> map);

	// 간판 생성
	void createNewGanpan(HashMap<String, Object> map);
	
	// 닉네임으로 보스닉네임, 간판 타이틀 반환
	List<SignBoardVO> allSignBoardList(String nickName);

	// 닉네임으로 내가 보스닉네임인 보스닉네임, 간판 타이틀 반환
	List<SignBoardVO> mySignBoardList(String nickName);

	// 닉네임으로 내가 그룹원인 보스닉네임, 간판 타이블 반환
	List<SignBoardVO> myJoinSignBoardList(String nickName);

	List<WorkVO> showContentList(SignBoardVO svo);
	
	// 닉네임으로 전체, 공개, 비공개 간판 리스트 정보 반환
	HashMap<String, List> homeSignBoardList(String nickName);

	//구성원보기 수정중
	List<OrganizationVO> getGroupList(String worker_nickname);

	// 보스닉네임, 간판 타이틀로 보스닉네임, 간판 타이틀, 공개 여부 반환
	SignBoardVO ganpanSettingPage(SignBoardVO svo);

}