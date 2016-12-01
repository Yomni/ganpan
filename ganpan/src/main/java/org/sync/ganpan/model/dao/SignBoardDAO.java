package org.sync.ganpan.model.dao;

import java.util.HashMap;
import java.util.List;

import org.sync.ganpan.model.vo.SignBoardVO;

public interface SignBoardDAO {

	List<SignBoardVO> findSignBoardListByTitle(String title);

	int titleCheck(HashMap<String, String> map);

	void createNewGanpan(HashMap<String, Object> map);

}