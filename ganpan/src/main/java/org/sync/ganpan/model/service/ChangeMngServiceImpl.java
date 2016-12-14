
package org.sync.ganpan.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.sync.ganpan.model.dao.ChangeMngDAO;
import org.sync.ganpan.model.vo.ChangeMngVO;
import org.sync.ganpan.model.vo.SignBoardVO;

@Service
public class ChangeMngServiceImpl implements ChangeMngService {
	@Resource
	private ChangeMngDAO changeMngDAO;

	@Override
	public List<ChangeMngVO>showChangeMngList(SignBoardVO svo) {
		return changeMngDAO.showChangeMngList(svo);
	}
	

}
