package org.sync.ganpan.model.dao;

import java.util.HashMap;
import java.util.List;

import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.SignBoardVO;

public interface GroupDAO {

	List<OrganizationVO> getGroupList(SignBoardVO svo);

	void registerBossNickName(HashMap<String, Object> map);
	
}//interface GroupDAO
