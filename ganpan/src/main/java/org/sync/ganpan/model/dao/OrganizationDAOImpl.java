package org.sync.ganpan.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.sync.ganpan.model.vo.InvitationMngVO;
import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.SignBoardVO;

@Repository
public class OrganizationDAOImpl implements OrganizationDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public int getJoinedSignBoardCount(String nickName) {
		return template.selectOne("organization.getJoinedSignBoardCount", nickName);
	}

	@Override
	public List<OrganizationVO> getOrganizationSignBoardList(String nickName) {
		return template.selectList("organization.getOrganizationSignBoardList", nickName);
	}

	@Override
	public void cancelInvitation(InvitationMngVO ivo) {
		template.delete("invitationMng.deleteInvitationMng", ivo);
	}

	@Override
	public void inviteWorker(InvitationMngVO ivo) {
		template.insert("invitationMng.inviteWorker", ivo);
	}

	@Override
	public List<OrganizationVO> getOrganizationList(SignBoardVO svo) {
		return template.selectList("organization.getOrganizationList", svo);
	}

	@Override
	public String getNickNameByEmail(String id) {
		return template.selectOne("organization.getNickNameByEmail", id);
	}

	@Override
	public int deleteWorker(OrganizationVO ovo) {
		return template.delete("organization.deleteWorker", ovo);
	}

	@Override
	public void registerBossNickName(HashMap<String, Object> map) {
		template.insert("organization.registerBossNickName", map);
	}

	@Override
	public List<HashMap<String, String>> sendInvitationList(SignBoardVO svo) {
		return template.selectList("organization.sendInvitationList", svo);
	}

	@Override
	public void leaveOrganization(OrganizationVO ovo) {
		template.delete("organization.leaveOrganization", ovo);
	}

	@Override
	public int groupCheck(OrganizationVO ovo) {
		return template.selectOne("organization.groupCheck", ovo);
	}

	@Override
	public int workerSignBoardNameCheck(OrganizationVO ovo) {
		return template.selectOne("organization.workerSignBoardNameCheck", ovo);
	}

	@Override
	public int inviteCheck(OrganizationVO ovo) {
		return template.selectOne("organization.inviteCheck",ovo);
	}

	@Override
	public int getTotalJoinMemberCount(SignBoardVO svo) {
		return template.selectOne("organization.getTotalJoinMemberCount",svo);
	}

	@Override
	public List<OrganizationVO> getOrganizationList(Map<String, Object> map) {
		return template.selectList("organization.getOrganizationListPaging",map);
	}

}// class organizationDAOImpl
