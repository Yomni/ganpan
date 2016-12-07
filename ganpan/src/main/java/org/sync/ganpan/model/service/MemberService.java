package org.sync.ganpan.model.service;


import java.util.HashMap;

import org.sync.ganpan.model.vo.MemberVO;

public interface MemberService {
	MemberVO login(HashMap<String, String> map);
	int nickNameCheck(String nickName);
	int eMailCheck(String eMail);
	void registerMember(MemberVO mvo);
	MemberVO findMemberByNickName(String nickName);
	int updateMember(MemberVO mvo);
	int idCheck(String id);

}