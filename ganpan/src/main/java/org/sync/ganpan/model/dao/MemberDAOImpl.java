package org.sync.ganpan.model.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.sync.ganpan.model.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public void register(MemberVO mvo) {
		template.insert("member.register",mvo);
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
	public MemberVO findMemberByEmail(String email) {
		return template.selectOne("member.findMemberByEmail",email);
	}

}
