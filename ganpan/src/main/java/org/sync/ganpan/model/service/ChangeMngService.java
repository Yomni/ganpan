package org.sync.ganpan.model.service;

import java.util.List;
import java.util.Map;

import org.sync.ganpan.model.vo.ChangeMngVO;
import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.PagingBean;
import org.sync.ganpan.model.vo.SignBoardVO;

public interface ChangeMngService {

	Map<String, Object> showChangeMngList(SignBoardVO svo, String toDoPageNo, String doingPageNo, String donePageNo);

	PagingBean createPagingBean(Map<String, Object> argMap, String pageNo);

	List<ChangeMngVO> getAllChangeMngListToJoined(List<OrganizationVO> orgList);
}