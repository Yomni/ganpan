
package org.sync.ganpan.model.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.sync.ganpan.model.dao.ChangeMngDAO;
import org.sync.ganpan.model.vo.SignBoardVO;

@Service
public class ChangeMngServiceImpl implements ChangeMngService {
	@Resource
	private ChangeMngDAO changeMngDAO;

	@Override
	public Map<String,Object> showChangeMngList(SignBoardVO svo) {
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> argMap = new HashMap<String,Object>();
		argMap.put("svo", svo);
		argMap.put("boardNo", 1);
		// 1.  to_do의 변경이력들만 뽑아온다.
		// 1 -1. map에 추가.
		map.put("todoChangeMngList", changeMngDAO.showChangeMngList(argMap));
		System.out.println("todoLog 값 : "+map.get("todoChangeMngList"));
		
		
		// 2. doing의 변경이력들만 뽑아온다.
		// 2-1 map에 추가
		argMap.put("boardNo", 2);
		map.put("doingChangeMngList", changeMngDAO.showChangeMngList(argMap));
		System.out.println("doing 값 : "+map.get("doingChangeMngList"));
		
		
		
		// 3. done의 변경이력들만 뽑아온다.
		// 3-1 map에 추가
		// 4. 총 변경이력을 뽑아온다.
		// 4 - 1 map에 추가
		return map;
	}
	

}
