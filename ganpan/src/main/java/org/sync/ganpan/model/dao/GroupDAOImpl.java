package org.sync.ganpan.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.SignBoardVO;

@Repository
public class GroupDAOImpl implements GroupDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public void registerBossNickName(HashMap<String, Object> map) {
		template.insert("group.registerBossNickName", map)
	}

	@Override
	public List<OrganizationVO> getGroupList(SignBoardVO svo) {
		return template.selectList("group.getGroupList", svo);
	}

}// class GroupDAOImpl
