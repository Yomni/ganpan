package org.sync.ganpan.model.service;

import java.util.List;

import org.sync.ganpan.model.vo.ChangeMngVO;
import org.sync.ganpan.model.vo.SignBoardVO;

public interface ChangeMngService {

	List<ChangeMngVO> showChangeMngList(SignBoardVO svo);

}