package org.sync.ganpan.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.sync.ganpan.model.dao.ChangeMngDAO;

@Service
public class ChangeMngServiceImpl implements ChangeMngService {
	@Resource
	private ChangeMngDAO changeMngDAO;
	

}
