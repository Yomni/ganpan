package org.sync.ganpan.model.dao;

import java.util.HashMap;
import java.util.List;

import org.sync.ganpan.model.vo.HaveBoardVO;
import org.sync.ganpan.model.vo.SignBoardVO;

public interface HaveBoardDAO {

	List<HaveBoardVO> getHaveBoardList(SignBoardVO svo);

	void createNewGanpan(HashMap<String, Object> map);

}