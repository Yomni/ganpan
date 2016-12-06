package org.sync.ganpan.model.dao;

import java.util.HashMap;

//github.com/Yomni/ganpan.git
import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.sync.ganpan.model.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public MemberVO login(HashMap<String, String> map) {
		return template.selectOne("member.login",map);
	}

	@Override
	public void registerMember(MemberVO mvo) {
		template.insert("member.registerMember",mvo);
	}

	@Override
	public int emailCheck(String email) {
		return template.selectOne("member.eMailCheck",email);
	}

	@Override
	public int nickNameCheck(String nickName) {
		return template.selectOne("member.nickNameCheck",nickName);
	}

	@Override
	public MemberVO findMemberByNickName(String nickName) {
		return template.selectOne("member.findMemberByNickName",nickName);
	}

	@Override
	public int updateMember(MemberVO mvo) {
		return template.update("member.updateMember", mvo);
	}

}
