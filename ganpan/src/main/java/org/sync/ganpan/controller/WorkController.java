package org.sync.ganpan.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

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
	public ModelAndView createWork(WorkVO wvo, String signBoardName, String bossNickName, String workerNickName) {
		ModelAndView mv = new ModelAndView();
		wvo.setOrganizationVO(
				new OrganizationVO(new MemberVO(workerNickName), new SignBoardVO(signBoardName, bossNickName)));
		workService.createWork(wvo);
		System.out.println(wvo);
		// 한글 적용 ... redirect는 별도의 인코딩 작업이 필요하다.
		try {
			signBoardName = URLEncoder.encode(signBoardName, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		mv.setViewName("redirect:showSignBoard.do?signBoardName=" + signBoardName + "&bossNickName=" + bossNickName);
		return mv;
	}

	// @RequestMapping(method = RequestMethod.POST, value="moveWork.do")
	// @ResponseBody
	// public boolean moveWork(String){
	//
	// }
	/**
	 * 콘텐츠 삭제
	 * @author 민서
	 */
	@RequestMapping("deleteWork.do")
	public String deleteWork(RedirectAttributes redirectAttributes, int workNo, String bossNickName, String signBoardName) {	
		System.out.println("deleteWork.do :" + workNo + bossNickName + signBoardName);
		workService.deleteWork(workNo);
		redirectAttributes.addAttribute("signBoardName", signBoardName);
		redirectAttributes.addAttribute("bossNickName", bossNickName);
		return "redirect:showSignBoard.do";
	}
	/**
	 * 콘텐츠 수정
	 * @author 민서
	 */
	@RequestMapping("updateWork.do")
	public String updateWork(RedirectAttributes redirectAttributes, int workNo, String workName, String workDetails){
		System.out.println("updateWork.do :"  + workNo + workName + workDetails);
		workService.updateWork(workNo);
		redirectAttributes.addAttribute("workName", workName);
		redirectAttributes.addAttribute("workDetails", workDetails);
		return "redirect:showSignBoard.do";
	}
}
