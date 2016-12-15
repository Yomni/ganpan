package org.sync.ganpan.model.service;

import java.util.Map;

import org.sync.ganpan.model.vo.SignBoardVO;

public interface ChangeMngService {

	Map<String, Object> showChangeMngList(SignBoardVO svo);

}