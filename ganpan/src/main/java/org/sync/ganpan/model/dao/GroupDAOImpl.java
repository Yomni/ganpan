package org.sync.ganpan.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.sync.ganpan.model.vo.InvitationMngVO;
import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.SignBoardVO;

@Repository
public class GroupDAOImpl implements GroupDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public void cancelInvitation(InvitationMngVO ivo) {
		template.delete("invitationMng.deleteInvitationMng",ivo);
	}

	@Override
	public void inviteWorker(InvitationMngVO ivo) {
		template.insert("invitationMng.inviteWorker",ivo);
	}

	@Override
	public List<OrganizationVO> getGroupList(SignBoardVO svo) {
		return template.selectList("group.getGroupList",svo);
	}

	@Override
	public String getNickNameByEmail(String id) {
		return template.selectOne("group.getNickNameByEmail",id);
	}

	@Override
	public int deleteWorker(OrganizationVO ovo) {
		return template.delete("group.deleteWorker",ovo);
	}

	@Override
	public void registerBossNickName(HashMap<String, Object> map) {
		template.insert("group.registerBossNickName", map);
	}
	
	@Override
	public List<HashMap<String, String>> sendInvitationList(SignBoardVO svo) {
		return template.selectList("group.sendInvitationList",svo);
	}

	@Override
	public void leaveOrganization(OrganizationVO ovo) {
		template.delete("group.leaveOrganization",ovo);
	}

}//class GroupDAOImpl
