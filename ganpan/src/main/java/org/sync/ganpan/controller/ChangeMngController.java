package org.sync.ganpan.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.sync.ganpan.model.service.ChangeMngService;
import org.sync.ganpan.model.vo.SignBoardVO;

@Controller
public class ChangeMngController {
	@Resource
	private ChangeMngService changeMngService;
	
	@RequestMapping("change_mng.do")
	public ModelAndView showChangeMng(String signBoardName, String bossNickName){
		ModelAndView mv = new ModelAndView();
		SignBoardVO svo= new SignBoardVO(signBoardName, bossNickName);
		mv.addObject("changeMngMap", changeMngService.showChangeMngList(svo));
		
		return mv;
	}
}//class ChangeMngController



