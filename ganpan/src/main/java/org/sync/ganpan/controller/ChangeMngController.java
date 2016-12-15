package org.sync.ganpan.controller;

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

	@RequestMapping("changeMng.do")
	public ModelAndView showChangeMng(String signBoardName, String bossNickName, String toDoPageNo, String doingPageNo,
			String donePageNo) {
		ModelAndView mv = new ModelAndView();
		SignBoardVO svo = new SignBoardVO(signBoardName, bossNickName);
		mv.setViewName("board/change_mng");
		mv.addObject("signBoardName",signBoardName);
		mv.addObject("bossNickName",bossNickName);
		mv.addObject("changeMngMap", changeMngService.showChangeMngList(svo, toDoPageNo, doingPageNo, donePageNo));
		return mv;
	}
}// class ChangeMngController
