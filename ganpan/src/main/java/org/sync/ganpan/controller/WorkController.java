package org.sync.ganpan.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.sync.ganpan.model.service.WorkService;
import org.sync.ganpan.model.vo.MemberVO;
import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.SignBoardVO;
import org.sync.ganpan.model.vo.WorkVO;

/** 
 * Work(간판에 각 항목에 나타나는 하나의 작업)을 위한 Controller
 * @author JYM
 *
 */
@Controller
public class WorkController {
	@Resource
	private WorkService workService;

	/**
	 * 작업 추가
	 * @author 용민
	 * @param wvo
	 * @param signBoardName
	 * @param bossNickName
	 * @param workerMemberVO
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST, value = "createWork.do")
	public ModelAndView createWork(WorkVO wvo, String signBoardName, String bossNickName, String workerMemberVO) {
		ModelAndView mv = new ModelAndView();
		wvo.setOrganizationVO(
				new OrganizationVO(new MemberVO(workerMemberVO), new SignBoardVO(signBoardName, bossNickName)));
		workService.createWork(wvo);
		mv.setViewName("redirect:showGanpan.do?signBoardName=" + signBoardName + "&bossNickName=" + bossNickName);
		return mv;
	}

//	@RequestMapping(method = RequestMethod.POST, value="moveWork.do")
//	@ResponseBody
//	public boolean moveWork(String){
//		
//	}
}
