package org.sync.ganpan.model.dao;

import java.util.HashMap;

//github.com/Yomni/ganpan.git
import org.sync.ganpan.model.vo.MemberVO;

public interface MemberDAO {

	MemberVO nickNameLogin(HashMap<String, String> map);
	MemberVO eMailLogin(HashMap<String, String> map);
	void register(MemberVO vo);
	int emailCheck(String email);
	int nickNameCheck(String nickName);
	MemberVO findMemberByNickName(String nickName);

}