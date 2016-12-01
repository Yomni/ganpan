package org.sync.ganpan.model.dao;

import java.util.List;

import org.sync.ganpan.model.vo.SignBoardVO;

public interface SignBoardDAO {

	List<SignBoardVO> findSignBoardListByTitle(String title);

}