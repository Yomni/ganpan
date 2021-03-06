package org.sync.ganpan.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.sync.ganpan.model.service.ChangeMngService;
import org.sync.ganpan.model.service.OrganizationService;
import org.sync.ganpan.model.service.WorkService;
import org.sync.ganpan.model.vo.ChangeMngVO;
import org.sync.ganpan.model.vo.InvitationMngVO;
import org.sync.ganpan.model.vo.ListVO;
import org.sync.ganpan.model.vo.MemberVO;
import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.SignBoardVO;

/**
 * Organization의 제어를 위한 Controller
 * @author JYM
 *
 */
@Controller
public class OrganizationController {
	@Resource
	private OrganizationService organizationService;
	@Resource
	private WorkService workService;
	@Resource
	private ChangeMngService changeMngService;

	/**
	 * 로그인 되었을 때 홈화면 가면 간판리스트 새로 갱신되어야 합니다.
	 * @author 용민
	 * @param nickName
	 * @return
	 */
	@RequestMapping("getLoginHome.do")
	public ModelAndView getLoginHomeSignBoardList(String nickName, String pageNo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		ListVO<OrganizationVO> sListVO = organizationService.getOrganizationSignBoardList(nickName, pageNo);
		if(sListVO.getList().isEmpty() == false) { // 참여 혹은 소유하고있는 간판이 있을 경우
			// 변경이력을 같이 보내준다.
			List<ChangeMngVO> changeList = changeMngService.getAllChangeMngListToJoined(sListVO.getList());
			mv.addObject("changeList",changeList);
		}
		mv.addObject("sListVO", sListVO);
		mv.addObject("signBoardCount", organizationService.getJoinedSignBoardCount(nickName));
		mv.addObject("invitationFlag", organizationService.isInvitedOrganization(nickName));
		return mv;
	}

	/**
	 * 
	 * @param bossNickName
	 * @param signBoardName
	 * @return
	 */
	@RequestMapping("inviteGroupMemberPage.do")
	public ModelAndView inviteGroupMemberPage(String bossNickName, String signBoardName) {
		SignBoardVO svo = new SignBoardVO(signBoardName, bossNickName);
		return new ModelAndView("board/left_template/invite_group_member", "svo", svo);
	}

	/**
	 * 그룹원을 초대
	 * @author 주선, 민영
	 */
	@RequestMapping("inviteWorker.do")
	public String inviteWorker(RedirectAttributes redirectAttributes, String signBoardName, String bossNickName,
			String id, String type) {
		// id는 이메일이나 닉네임
		if (type.equals("email")) {
			id = organizationService.getNickNameByEmail(id);
		}
		InvitationMngVO ivo = new InvitationMngVO(signBoardName, bossNickName, id);
		organizationService.inviteWorker(ivo);
		redirectAttributes.addAttribute("signBoardName", signBoardName);
		redirectAttributes.addAttribute("bossNickName", bossNickName);
		return "redirect:sendInvitationList.do";
	}

	/**
	 * 그룹장이 초대장을 보낸 리스트 보기
	 * @author 주선, 민영
	 * @param redirectAttributes
	 * @param signBoardName
	 * @param bossNickName
	 * @return
	 */
	@RequestMapping("sendInvitationList.do")
	public ModelAndView sendInvitationList(String signBoardName, String bossNickName, String pageNo) {
		ModelAndView mv = new ModelAndView();
		SignBoardVO svo = new SignBoardVO(signBoardName, bossNickName);
		ListVO<HashMap<String, String>> mListVO = organizationService.sendInvitationList(svo, pageNo);
		mv.setViewName("board/left_template/invite_group_member");
		mv.addObject("mListVO", mListVO);
		mv.addObject("svo", svo);
		return mv;
	}

	/**
	 * 그룹장이 보낸 초대를 취소함
	 * @author 민영
	 * @param signBoardName
	 * @param bossNickName
	 * @param nickName
	 * @return
	 */
	@RequestMapping("cancelInvitation.do")
	public String cancelInvitation(RedirectAttributes redirectAttributes, String signBoardName, String bossNickName,
			String nickName) {
		InvitationMngVO ivo = new InvitationMngVO(signBoardName, bossNickName, nickName);
		organizationService.cancelInvitation(ivo);
		redirectAttributes.addAttribute("signBoardName", signBoardName);
		redirectAttributes.addAttribute("bossNickName", bossNickName);
		return "redirect:sendInvitationList.do";
	}

	/**
	 * 참여한 그룹에서 탈퇴 
	 * @author 민영,주선
	 * @param signBoardName
	 * @param bossNickName
	 * @param session
	 * @return
	 */
	@RequestMapping("leaveOrganization.do")
	public String leaveOrganization(String signBoardName, String bossNickName, HttpSession session) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		String workerNickName = mvo.getNickName();
		OrganizationVO ovo = new OrganizationVO(workerNickName, signBoardName, bossNickName);
		organizationService.leaveOrganization(ovo);
		return "redirect:myJoinSignBoardList.do";
	}

	/**
	 * 구성원 보기
	 * @author 민서, 동혁
	 */
	@RequestMapping("goManageSignBoardMember.do")
	public ModelAndView getOrganizationList(String signBoardName, String bossNickName ,String pageNo) {
		ModelAndView mv = new ModelAndView();
		SignBoardVO svo = new SignBoardVO(signBoardName, bossNickName);// ganpan1, kosta1
		ListVO<OrganizationVO> oListVO = organizationService.getOrganizationList(svo,pageNo);
		mv.addObject("svo", svo);
		mv.addObject("oListVO", oListVO);
		mv.setViewName("board/left_template/manage_organization_member");
		return mv;
	}

	/**
	 * 그룹원 보기 
	 * @author 민영
	 * @param request
	 * @return
	 */
	@RequestMapping("showMemberList.do")
	public ModelAndView showMemberList(String signBoardName, String bossNickName, String pageNo) {
		ModelAndView mv = new ModelAndView();
		SignBoardVO svo = new SignBoardVO(signBoardName, bossNickName);// ganpan1, kosta1
		ListVO<OrganizationVO> oListVO=organizationService.getOrganizationList(svo,pageNo);
		mv.addObject("svo", svo);
		mv.addObject("oListVO", oListVO);
		mv.setViewName("board/organization_member_list");
		return mv;
	}

	/**
	 * @author 동혁
	 * @param request
	 * @return
	 */
	@RequestMapping("banish.do")
	public String banish(String workerNickName, String signBoardName, String bossNickName, RedirectAttributes redirectAttributes) {
		MemberVO workerMemberVO = new MemberVO(workerNickName);
		SignBoardVO signBoardVO = new SignBoardVO(signBoardName, bossNickName);
		OrganizationVO ovo = new OrganizationVO(workerMemberVO, signBoardVO);
		// 그룹에서 강제퇴장!
		organizationService.banish(ovo);
		redirectAttributes.addAttribute("signBoardName", signBoardName);
		redirectAttributes.addAttribute("bossNickName", bossNickName);
		// 다시 getOrganizationList로 보내줘야 한다.
		return "redirect:goManageSignBoardMember.do";
	}
	
	/**
	 * @author 주선
	 * @param signBoardName
	 * @param bossNickName
	 * @param id
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST, value = "groupCheckAjax.do")
	@ResponseBody
	public String groupCheckAjax(String signBoardName, String bossNickName, String id) {
		return organizationService.groupCheck(id, signBoardName, bossNickName);
	}
}// class OrganizationController
