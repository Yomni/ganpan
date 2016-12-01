package org.sync.ganpan.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.sync.ganpan.model.dao.SignBoardDAO;
import org.sync.ganpan.model.vo.SignBoardVO;

/**
 * SignBoard의 Business layer를 담당하기 위한 ServiceClass
 * @author JYM
 *
 */
@Service
public class SignBoardServiceImpl implements SignBoardService {
	@Resource
	private SignBoardDAO signBoardDAO;
	
	@Override
	public List<SignBoardVO> findSignBoardListByTitle(String title) {
		return signBoardDAO.findSignBoardListByTitle(title);
	}

}
