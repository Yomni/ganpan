package org.sync.ganpan.model.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.sync.ganpan.model.vo.InvitationMngVO;

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

}
