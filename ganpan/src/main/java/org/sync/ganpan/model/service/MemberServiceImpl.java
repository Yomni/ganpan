package org.sync.ganpan.model.service;


import java.util.HashMap;

import javax.annotation.Resource;

//github.com/Yomni/ganpan.git
import org.springframework.stereotype.Service;
import org.sync.ganpan.model.dao.MemberDAO;
import org.sync.ganpan.model.vo.MemberVO;

/**
 * Member의 Business layer를 위한 ServiceClass
 * @author JYM
 *
 */
@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;

	
	public void register(MemberVO mvo){
		memberDAO.register(mvo);
	}
	
	public int eMailCheck(String eMail){
		return memberDAO.emailCheck(eMail);
	}
	
	public int nickNameCheck(String nickName){
		return memberDAO.nickNameCheck(nickName);
	}
	
	public MemberVO findMemberByNickName(String nickName){
		return memberDAO.findMemberByNickName(nickName);
	}

	@Override
	public MemberVO nickNameLogin(HashMap<String, String> map) {
		return memberDAO.nickNameLogin(map);
	}

	@Override
	public MemberVO eMailLogin(HashMap<String, String> map) {
		return memberDAO.eMailLogin(map);
	}
}
