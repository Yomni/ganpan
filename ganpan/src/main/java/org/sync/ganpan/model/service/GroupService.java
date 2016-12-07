package org.sync.ganpan.model.service;

import java.util.List;

import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.SignBoardVO;

public interface GroupService {
	
	//구성원보기 수정중 by dhKim
	List<OrganizationVO> getGroupList(SignBoardVO svo);
	
}