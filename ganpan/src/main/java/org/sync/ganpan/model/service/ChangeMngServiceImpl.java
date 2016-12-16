package org.sync.ganpan.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.sync.ganpan.model.dao.ChangeMngDAO;
import org.sync.ganpan.model.vo.ChangeMngVO;
import org.sync.ganpan.model.vo.ListVO;
import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.PagingBean;
import org.sync.ganpan.model.vo.SignBoardVO;

@Service
public class ChangeMngServiceImpl implements ChangeMngService {
	@Resource
	private ChangeMngDAO changeMngDAO;

	@Override
	public Map<String, Object> showChangeMngList(SignBoardVO svo, String toDoPageNo, String doingPageNo,
			String donePageNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> argMap = new HashMap<String, Object>();
		argMap.put("svo", svo);

		// 1. to_do의 변경이력들만 뽑아온다.
		// 1 -1. map에 추가.
		// ListVO형태로 넣어줘야함.
		argMap.put("boardNo", 1);
		PagingBean toDoPb = createPagingBean(argMap, toDoPageNo);
		argMap.put("pb", toDoPb);
		ListVO<ChangeMngVO> toDoListVO = new ListVO<ChangeMngVO>(changeMngDAO.showChangeMngList(argMap), toDoPb);
		map.put("toDoListVO", toDoListVO);

		// 2. doing의 변경이력들만 뽑아온다.
		// 2-1 map에 추가
		// ListVO형태로 넣어줘야함.
		argMap.put("boardNo", 2);
		PagingBean doingPb = createPagingBean(argMap, doingPageNo);
		argMap.put("pb", doingPb);
		ListVO<ChangeMngVO> doingListVO = new ListVO<ChangeMngVO>(changeMngDAO.showChangeMngList(argMap), doingPb);
		map.put("doingListVO", doingListVO);

		// 3. done의 변경이력들만 뽑아온다.
		// 3-1 map에 추가
		// ListVO형태로 넣어줘야함.
		argMap.put("boardNo", 3);
		PagingBean donePb = createPagingBean(argMap, donePageNo);
		argMap.put("pb", donePb);
		ListVO<ChangeMngVO> doneListVO = new ListVO<ChangeMngVO>(changeMngDAO.showChangeMngList(argMap), donePb);
		map.put("doneListVO", doneListVO);

		// 4. 총 변경이력을 뽑아온다.
		// 4 - 1 map에 추가
		map.put("totalChangeMngList", changeMngDAO.showTotalChangeMngList(svo));

		return map;
	}

	@Override
	public PagingBean createPagingBean(Map<String, Object> argMap, String pageNo) {
		int totalCount = changeMngDAO.getTotalChangeMngCountEachBoard(argMap);
		PagingBean pb = null;
		if (pageNo == null) {
			pb = new PagingBean(totalCount);
		} else {
			pb = new PagingBean(totalCount, Integer.parseInt(pageNo));
		}
		return pb;
	}

	@Override
	public List<ChangeMngVO> getAllChangeMngListToJoined(List<OrganizationVO> orgList) {
		// 참여 or 가지고 있는 모든 간판의 변경이력들을 출력해야 한다.
		List<ChangeMngVO> changeList = changeMngDAO.getAllChangeMngListToJoined(orgList);
		return changeList;
	}
}
