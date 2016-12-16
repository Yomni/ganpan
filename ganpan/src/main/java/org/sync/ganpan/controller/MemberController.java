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
import org.sync.ganpan.model.service.MemberService;
import org.sync.ganpan.model.service.OrganizationService;
import org.sync.ganpan.model.service.SignBoardService;
import org.sync.ganpan.model.vo.ChangeMngVO;
import org.sync.ganpan.model.vo.ListVO;
import org.sync.ganpan.model.vo.MemberVO;
import org.sync.ganpan.model.vo.OrganizationVO;

/**
 * Member의 제어를 위한 Controller
 * @author JYM
 */
@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	@Resource
	private SignBoardService signBoardService;
	@Resource
	private OrganizationService organizationService;
	@Resource
	private ChangeMngService changeMngService;

	/****************************************민영**********************************************/
	/**
	 * 회원 가입
	 * @author 민영
	 * @param mvo
	 */
	@RequestMapping(value = "register.do", method = RequestMethod.POST)
	public String registerMember(RedirectAttributes redirectAttributes, MemberVO mvo, HttpSession session) {
		memberService.registerMember(mvo);
		session.setAttribute("mvo", mvo);
		redirectAttributes.addAttribute("nickName", mvo.getNickName());
		return "redirect:registerResultView.do";
	}

	/**
	 * home화면에서 회원가입 실패 시 register.jsp로 넘겨주거나 성공시 성공화면으로 전송
	 * @author 용민
	 * @param mvo
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "register_main.do", method = RequestMethod.POST)
	public ModelAndView registerFromIndexMember(MemberVO mvo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		boolean nickNameLengthFlag = false;
		boolean nickNameDuplicateFlag = false;
		boolean eMailDuplicateFlag = false;
		boolean passwordLengthFlag = false;
		if(mvo.getNickName().trim().length() < 2 || mvo.getNickName().trim().length() > 15) {
			nickNameLengthFlag = true; // 길이 
		}
		if(memberService.nickNameCheck(mvo.getNickName()) != 0) { // nickName이 중복
			nickNameDuplicateFlag = true; // nickName 중복됨.
		}
		if(memberService.eMailCheck(mvo.geteMail()) != 0) {
			eMailDuplicateFlag = true;
		}
		if(mvo.getPassword().trim().length() < 6 || mvo.getPassword().trim().length() > 15) {
			passwordLengthFlag = true;
		}
		// 네가지 중 하나라도 true면
		if(nickNameLengthFlag || nickNameDuplicateFlag || eMailDuplicateFlag || passwordLengthFlag) {
			HashMap<String, Boolean> modelMap = new HashMap<String, Boolean>();
			modelMap.put("nickNameLengthFlag", nickNameLengthFlag);
			modelMap.put("nickNameDuplicateFlag", nickNameDuplicateFlag);
			modelMap.put("eMailDuplicateFlag", eMailDuplicateFlag);
			modelMap.put("passwordLengthFlag", passwordLengthFlag);
			mv.setViewName("member/register_form");
			mv.addAllObjects(modelMap);
			mv.addObject("mvo", mvo);
		} else {
			session.setAttribute("mvo", mvo); // login
			// 성공 시 db 반영
			memberService.registerMember(mvo);
			mv.setViewName("redirect:registerResultView.do?nickName=" + mvo.getNickName());
		}
		return mv;
	}

	/**
	 * 회원가입 결과화면으로 이동
	 * @author 민영
	 * @param nickName
	 */
	@RequestMapping("registerResultView.do")
	public ModelAndView registerResultView(String nickName) {
		MemberVO mvo = memberService.findMemberByNickName(nickName);
		return new ModelAndView("member/register_result", "mvo", mvo);
	}

	/**
	 * 회원가입 시 이메일 중복확인
	 * @author 민영
	 * @param eMail
	 */
	@RequestMapping("eMailCheckAjax.do")
	@ResponseBody
	public String eMailCheckAjax(String eMail) {
		int count = memberService.eMailCheck(eMail);
		return (count == 0) ? "ok" : "fail";
	}

	/**
	 * 회원가입 시 닉네임 중복확인
	 * @author 민영
	 */
	@RequestMapping("nickNameCheckAjax.do")
	@ResponseBody
	public String nickNameCheckAjax(String nickName) {
		int count = memberService.nickNameCheck(nickName);
		return (count == 0) ? "ok" : "fail";
	}

	/******************************************************************************************/
	
	/**
	 * 그룹원 초대 시 닉네임, 이메일 확인
	 * @param id
	 * @author 주선, 민영
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST, value="idCheckAjax.do")
	@ResponseBody
	public boolean idCheckAjax(String id){
		int count = memberService.idCheck(id);
		// count가 0이면 해당 회원이 없음
		return (count == 0) ? true : false;
	}

	/******************************** 주선 **********************************/
	/**
	 * 회원 로그인
	 * 로그인 할 때 초대되어있는지 안되있는지 확인
	 * @author 주선,용민(수정)
	 * @param request
	 * @param id
	 * @param password
	 */
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(HttpSession session, String id, String password) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("password", password);
		MemberVO mvo = memberService.login(map);
		if (mvo != null) {
			session.setAttribute("mvo", mvo);
			ListVO<OrganizationVO> sListVO = organizationService.getOrganizationSignBoardList(mvo.getNickName(), null);
			System.out.println(sListVO);
			if(sListVO.getList().isEmpty() == false) { // 참여 혹은 소유하고있는 간판이 있을 경우
				// 변경이력을 같이 보내준다.
				List<ChangeMngVO> changeList = changeMngService.getAllChangeMngListToJoined(sListVO.getList());
				session.setAttribute("changeList", changeList);
			}
			int signBoardCount = organizationService.getJoinedSignBoardCount(mvo.getNickName());
			boolean invitationFlag = organizationService.isInvitedOrganization(mvo.getNickName());
			session.setAttribute("invitationFlag", invitationFlag);
			session.setAttribute("signBoardCount", signBoardCount);
			session.setAttribute("sListVO", sListVO);
			return "redirect:go_home.do";
		} else {
			return "redirect:go_member/login_fail.do";
		}
	}

	/**
	 * 회원 로그아웃
	 * @author 주선
	 * @param request
	 */
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:go_home.do";
	}

	/************************************************************************/

	/**
	 * 회원 정보 수정
	 * @author 주선,민영
	 */
	@RequestMapping(value = "updateMember.do", method = RequestMethod.POST)
	public String updateMember(HttpSession session, MemberVO mvo) {
		memberService.updateMember(mvo);
		session.setAttribute("mvo", mvo);
		return "redirect:go_member/left_template/my_info.do";
	}
	
	/**
	 * @author 주선
	 */
	@RequestMapping(value = "leave.do", method = RequestMethod.POST)
	public String leave(HttpSession session, String password) {
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		String nickName = mvo.getNickName();
		if(memberService.leave(nickName, password) == 0){
			return "redirect:go_member/left_template/leave_fail.do";
		}else{
			session.invalidate();
			return "redirect:go_home.do";
		}
	}
}
