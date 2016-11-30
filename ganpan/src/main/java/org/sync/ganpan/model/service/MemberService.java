package org.sync.ganpan.model.service;

import java.util.HashMap;

import org.sync.ganpan.model.vo.MemberVO;

public interface MemberService {
	MemberVO nickNameLogin(HashMap<String, String> map);
	MemberVO eMailLogin(HashMap<String, String> map);
	int nickNameCheck(String nickName);
	int eMailCheck(String eMail);
	void register(MemberVO mvo);
	MemberVO findMemberByEmail(String eMail);
}