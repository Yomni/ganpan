package org.sync.ganpan.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.sync.ganpan.model.dao.GroupDAO;
import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.SignBoardVO;

/**
 * Group의 Business layer를 위한 ServiceClass
 * @author JYM
 *
 */
@Service
public class GroupServiceImpl implements GroupService {
	@Resource
	private GroupDAO groupDAO;
	/**
	 *  수정중 by dhKim
	 */
	@Override
	public List<OrganizationVO> getGroupList(SignBoardVO svo) {
		return groupDAO.getGroupList(svo);
	}
}
