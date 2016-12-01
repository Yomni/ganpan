package org.sync.ganpan.model.service;

import java.util.List;

import org.sync.ganpan.model.vo.SignBoardVO;

public interface SignBoardService {

	List<SignBoardVO> findSignBoardListByTitle(String title);

}