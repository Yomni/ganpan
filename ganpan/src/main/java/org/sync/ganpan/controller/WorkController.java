package org.sync.ganpan.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	 * @return
	 */
	@RequestMapping("goCreateWork.do")
	public ModelAndView goCreateWork(String signBoardName, String bossNickName) {
		SignBoardVO createSignBoardVO = new SignBoardVO(signBoardName, bossNickName);
		return new ModelAndView("board/create_work", "createSignBoardVO", createSignBoardVO);

	}

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
	//
	// }

	/**
	 * 회원 탈퇴
	 * @author 주선
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
	 * 콘텐츠 수정
	 * @author 민서,동혁
	 */
	@RequestMapping("updateWork.do")
	public String updateWork(RedirectAttributes redirectAttributes, int workNo, String workName, String workDetails) {
		System.out.println("updateWork.do :" + workNo + workName + workDetails);
		workService.updateWork(workNo);
		redirectAttributes.addAttribute("workName", workName);
		redirectAttributes.addAttribute("workDetails", workDetails);
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
}
