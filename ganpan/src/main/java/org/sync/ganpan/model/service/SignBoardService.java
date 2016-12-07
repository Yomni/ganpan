package org.sync.ganpan.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.sync.ganpan.model.vo.HaveBoardVO;
import org.sync.ganpan.model.vo.InvitationMngVO;
import org.sync.ganpan.model.vo.SignBoardVO;

public interface SignBoardService {
	
	// 제목으로 간판 리스트 검색
	Map<String, Object> findSignBoardListByTitle(String title);

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
	
	//내 소유 간판으로 이동하고 간판 내 작업을 호출
	SignBoardVO showGanpan(SignBoardVO svo);
	
	// 닉네임으로 전체, 공개, 비공개 간판 리스트 정보 반환
	HashMap<String, List> homeSignBoardList(String nickName);

	// 보스닉네임, 간판 타이틀로 보스닉네임, 간판 타이틀, 공개 여부 반환
	SignBoardVO ganpanSettingPage(SignBoardVO svo);

	// 닉네임으로 초대받은 이력 정보 반환
	List<InvitationMngVO> invitationList(String nickName);

	//
	void addOrganization(InvitationMngVO ivo);

	//
	void deleteInvitationMng(InvitationMngVO ivo);

}