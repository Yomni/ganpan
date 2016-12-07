package org.sync.ganpan.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.SignBoardVO;

@Repository
public class GroupDAOImpl implements GroupDAO {
	@Resource
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<OrganizationVO> getGroupList(SignBoardVO svo) {
		return sqlSessionTemplate.selectList("group.getGroupList",svo);
	}

}//class GroupDAOImpl









