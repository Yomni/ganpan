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
import org.sync.ganpan.model.service.OrganizationService;
import org.sync.ganpan.model.service.SignBoardService;
import org.sync.ganpan.model.vo.InvitationMngVO;
import org.sync.ganpan.model.vo.ListVO;
import org.sync.ganpan.model.vo.MemberVO;
import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.SignBoardVO;

/**
 * 간판을 위해 설정하는 Controller
 * @author JYM
 *
 */
@Controller
public class SignBoardController {
	@Resource
	private SignBoardService signBoardService;
	@Resource
	private OrganizationService organizationService;

	/**
	 * 칸반 검색
	 * @author 주선
	 */
	@RequestMapping("findSignBoardListByTitle.do")
	public ModelAndView findSignBoardListByTitle(String title, String pageNo) {
		return new ModelAndView("board/search_result", signBoardService.findSignBoardListByTitle(title, pageNo));
	}

	/**
	 * 새 간판 생성하기
	 * @author 민영
	 */
	@RequestMapping(method = RequestMethod.POST, value = "createNewSignBoard.do")
	public String createNewSignBoard(RedirectAttributes redirectAttributes, String bossNickName, String title,
			String signBoardType) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bossNickName", bossNickName);
		map.put("signBoardName", title);
		if (signBoardType.equals("public")) {// 간판 공개시 visibility default 0
			map.put("visibility", 0);
			signBoardService.createNewGanpan(map);
		} else {
			map.put("visibility", 1);
			signBoardService.createNewGanpan(map);
		}
		redirectAttributes.addAttribute("signBoardName", title);
		redirectAttributes.addAttribute("bossNickName", bossNickName);
		return "redirect:showSignBoard.do";
	}

	/**
	 * 간판 생성시
	 * 소유자의 소유칸판 중 중복되는 타이틀이 있는지 확인
	 * @author 민영
	 */
	@ResponseBody
	@RequestMapping("titleCheckAjax.do")
	public String titleCheckAjax(String title, HttpSession session) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("bossNickName", mvo.getNickName());
		map.put("signBoardName", title);
		int count = signBoardService.titleCheck(map);
		// 조장명과 간판명으로 signBoard 테이블에 존재하는지 체크
		return (count == 0) ? "ok" : "fail";
	}

	/**
	 * 소유 간판 보기
	 * @author 주선, 민영
	 */
	@RequestMapping("mySignBoardList.do")
	public ModelAndView mySignBoardList(HttpSession session, String pageNo) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		ListVO<SignBoardVO> sbListVO = signBoardService.mySignBoardList(mvo.getNickName(), pageNo);
		return new ModelAndView("member/left_template/my_ganpan_list", "sbListVO", sbListVO);
	}

	/**
	 * 참여 간판 보기
	 * @author 주선, 민영
	 */
	@RequestMapping("myJoinSignBoardList.do")
	public ModelAndView myJoinSignBoardList(HttpSession session, String pageNo) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		ListVO<SignBoardVO> sbListVO = signBoardService.myJoinSignBoardList(mvo.getNickName(), pageNo);
		return new ModelAndView("member/left_template/my_join_ganpan_list", "sbListVO", sbListVO);
	}

	/**
	 * 홈에서 보여지는
	 * 간판 리스트 보기(all, public, private)
	 * @author 주선, 민영
	 */
	@RequestMapping("homeSignBoardList.do")
	public ModelAndView homeSignBoardList(HttpSession session) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		String nickName = mvo.getNickName();
		HashMap<String, List<SignBoardVO>> sbMap = signBoardService.homeSignBoardList(nickName);
		return new ModelAndView("home", "sbMap", sbMap);
	}

	/**
	 * 간판 내용 보기(작업들)
	 * @author 동혁, 용민(수정)
	 * @param session
	 * @return
	 */
	@RequestMapping("showSignBoard.do")
	public ModelAndView showSignBoard(String signBoardName, String bossNickName) {
		ModelAndView mv = new ModelAndView();
		SignBoardVO rsvo = new SignBoardVO(signBoardName, bossNickName);
		rsvo = signBoardService.showSignBoard(rsvo);
		List<OrganizationVO> orgList = organizationService.getOrganizationList(rsvo);
		mv.addObject("rsvo", rsvo);
		mv.addObject("orgList", orgList);
		mv.setViewName("board/ganpan");
		return mv;
	}

	/**
	 * ganpan_setting 페이지로 해당 간판 정보를 가지고 이동
	 * @param signBoardName
	 * @param bossNickName
	 * @return
	 */
	@RequestMapping("ganpanSettingPage.do")
	public ModelAndView ganpanSettingPage(String signBoardName, String bossNickName) {
		SignBoardVO svo = new SignBoardVO(signBoardName, bossNickName);
		svo = signBoardService.ganpanSettingPage(svo);
		return new ModelAndView("board/left_template/ganpan_setting", "svo", svo);
	}

	/**
	 * 간판 이름 수정하기
	 * @author 주선, 민영
	 * @return
	 */
	@RequestMapping("updateSignBoardName.do")
	public String updateSignBoardName(RedirectAttributes redirectAttributes, String changeTitle, String signBoardName,
			String bossNickName) {
		HashMap<String, String> map = new HashMap<String, String>();
		// map에 변경할 간판 제목, 기존 간판 제목,  조장 닉네임을 넣어준다
		map.put("changeTitle", changeTitle);
		map.put("signBoardName", signBoardName);
		map.put("bossNickName", bossNickName);
		// sql문으로 이동
		signBoardService.updateSignBoardName(map);
		redirectAttributes.addAttribute("signBoardName", changeTitle);
		redirectAttributes.addAttribute("bossNickName", bossNickName);
		return "redirect:ganpanSettingPage.do";
	}

	@RequestMapping("updateVisibility.do")
	public String updateVisibility(RedirectAttributes redirectAttributes, String signBoardName, String bossNickName,
			String visibility) {
		int visibility2 = 0;
		if (visibility.equals("private")) {
			visibility2 = 1;
		}
		SignBoardVO svo = new SignBoardVO(signBoardName, bossNickName, visibility2);
		signBoardService.updateVisibility(svo);
		redirectAttributes.addAttribute("signBoardName", signBoardName);
		redirectAttributes.addAttribute("bossNickName", bossNickName);
		return "redirect:ganpanSettingPage.do";
	}

	@RequestMapping("deleteSignBoard.do")
	public String deleteSignBoard(RedirectAttributes redirectAttributes, String signBoardName, String bossNickName) {
		SignBoardVO svo = new SignBoardVO(signBoardName, bossNickName);
		signBoardService.deleteSignBoard(svo);
		redirectAttributes.addAttribute("nickName", bossNickName);
		return "redirect:getLoginHome.do";
	}

	/**
	 * 초대 현황 리스트 보기
	 * @author 주선, 민영
	 * @param session
	 * @return
	 */
	@RequestMapping("invitationList.do")
	public ModelAndView invitationList(HttpSession session,String pageNo) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		ListVO<InvitationMngVO> iListVO = signBoardService.invitationList(mvo.getNickName(),pageNo);
		if (iListVO.getList().size() == 0)
			return new ModelAndView("member/left_template/invitation_list_fail");
		else
			return new ModelAndView("member/left_template/invitation_list", "iListVO", iListVO);
	}

	/**
	 * 초대 수락시 그룹에 추가, 초대 이력에서 제거
	 * @author 주선, 민영
	 * @param signBoardName
	 * @param bossNickName
	 * @param session
	 * @return
	 */
	@RequestMapping("acceptInvitation.do")
	public String acceptInvitaton(String signBoardName, String bossNickName, HttpSession session) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		String nickname = mvo.getNickName();
		InvitationMngVO ivo = new InvitationMngVO(signBoardName, bossNickName, nickname);
		signBoardService.addOrganization(ivo);
		signBoardService.deleteInvitationMng(ivo);
		return "redirect:invitationList.do";
	}

	/**
	 * 초대 거절 시, 초대 이력에서 제거
	 * @author 주선, 민영
	 * @param signBoardName
	 * @param bossNickName
	 * @param session
	 * @return
	 */
	@RequestMapping("rejectInvitation.do")
	public String rejectInvitation(String signBoardName, String bossNickName, HttpSession session) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		String nickname = mvo.getNickName();
		InvitationMngVO ivo = new InvitationMngVO(signBoardName, bossNickName, nickname);
		signBoardService.deleteInvitationMng(ivo);
		return "redirect:invitationList.do";
	}

	@RequestMapping("updateSignBoardBoss.do")
	public String updateSignBoardBoss(RedirectAttributes redirectAttributes,
			String signBoardName, String bossNickName, String id) {
		// 만약 위임할 아이디(id)에 @가 포함되어 있다면 이메일로 검색해 별명을 찾아온다
		if (id.contains("@") == true) {
			id = organizationService.getNickNameByEmail(id);
		}
		OrganizationVO ovo = new OrganizationVO(id, signBoardName, bossNickName);
		// 간판 제목(signBoardName)과 조장이름(bossNickName)을 이용해 signboard 테이블을
		// 검색한 후 그 간판의 조장을 위임할 별명(id)로 변경해준다
		signBoardService.updateSignBoardBoss(ovo);
		redirectAttributes.addAttribute("signBoardName", signBoardName);
		redirectAttributes.addAttribute("bossNickName", id);
		return "redirect:showSignBoard.do";
	}

}// class
