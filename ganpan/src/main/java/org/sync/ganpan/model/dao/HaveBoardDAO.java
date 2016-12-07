package org.sync.ganpan.model.dao;

import java.util.HashMap;
import java.util.List;

import org.sync.ganpan.model.vo.HaveBoardVO;

public interface HaveBoardDAO {

	List<HaveBoardVO> getHaveBoardList();

	void createNewGanpan(HashMap<String, Object> map);

}