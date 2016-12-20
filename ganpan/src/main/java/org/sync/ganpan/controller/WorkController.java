package org.sync.ganpan.controller;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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
	 * createWork로 갈 때 signBoardVO도 넣어줘서 보내준다.
	 * @author 용민
	 * @param signBoardName
	 * @param bossNickName
	 * @return
	 */
	@RequestMapping("goCreateWork.do")
	public ModelAndView goCreateWork(String signBoardName, String bossNickName) {
		SignBoardVO createSignBoardVO = new SignBoardVO(signBoardName, bossNickName);
		return new ModelAndView("board/create_work", "createSignBoardVO", createSignBoardVO);

	}

	/**
	 * 간판에 작업 추가
	 * @author 용민
	 * @param wvo
	 * @param signBoardName
	 * @param bossNickName
	 * @param workerMemberVO
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST, value = "createWork.do")
	public String createWork(RedirectAttributes redirectAttributes, WorkVO wvo, String signBoardName,
			String bossNickName, String workerNickName) {
		wvo.setOrganizationVO(
				new OrganizationVO(new MemberVO(workerNickName), new SignBoardVO(signBoardName, bossNickName)));
		workService.createWork(wvo);
		redirectAttributes.addAttribute("signBoardName", signBoardName);
		redirectAttributes.addAttribute("bossNickName", bossNickName);
		return "redirect:showSignBoard.do";
	}

	// @RequestMapping(method = RequestMethod.POST, value="moveWork.do")
	// @ResponseBody
	// public boolean moveWork(String){

	/**
	 * @author 민서,용민
	 * @param redirectAttributes
	 * @param workNo
	 * @param bossNickName
	 * @param signBoardName
	 * @return
	 */
	@RequestMapping("deleteWork.do")
	public String deleteWork(RedirectAttributes redirectAttributes, int workNo, String bossNickName,
			String signBoardName) {
		workService.deleteWork(workNo);
		redirectAttributes.addAttribute("signBoardName", signBoardName);
		redirectAttributes.addAttribute("bossNickName", bossNickName);
		return "redirect:showSignBoard.do";
	}

	/**
	 * 작업들의 상세 내용을 수정하는 method
	 * @author 민서,용민
	 * @param redirectAttributes
	 * @param wvo
	 * @param signBoardName
	 * @param bossNickName
	 * @return
	 */
	@RequestMapping(value = "updateWork.do", method = RequestMethod.POST)
	public String updateWork(RedirectAttributes redirectAttributes, WorkVO wvo, String signBoardName,
			String bossNickName) {
		wvo.getOrganizationVO().setSignBoardVO(new SignBoardVO(signBoardName, bossNickName));
		workService.updateWork(wvo);
		redirectAttributes.addAttribute("signBoardName", signBoardName);
		redirectAttributes.addAttribute("bossNickName", bossNickName);
		return "redirect:showSignBoard.do";
	}

	/**
	 * 콘텐츠 작업자로 참여
	 * @author 주선, 민영
	 */
	@RequestMapping("joinAsWorkerByWorkNo.do")
	public String joinAsWorkerByWorkNo(RedirectAttributes redirectAttributes, String signBoardName, String bossNickName,
			String workNo, String nickName) {
		workService.joinAsWorkerByWorkNo(workNo, nickName);
		redirectAttributes.addAttribute("signBoardName", signBoardName);
		redirectAttributes.addAttribute("bossNickName", bossNickName);
		return "redirect:showSignBoard.do";
	}

	/**
	 * Ajax를 이용하여 작업 이동(TO_DO -> DOING, DOING -> DONE) 시 DB에 반영
	 * @author 용민
	 * @param workNo
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST, value = "moveWorkAjax.do")
	@ResponseBody
	public boolean moveWorkAjax(int workNo) {
		// 작업을 이동한 결과를 반환
		return workService.moveWork(workNo);
	}
}
