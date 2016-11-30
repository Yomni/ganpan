package org.sync.ganpan.controller;


import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.sync.ganpan.model.service.MemberService;
import org.sync.ganpan.model.vo.MemberVO;

/**
 * Member의 제어를 위한 Controller
 * @author JYM
 *
 */
@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	
/****************************************민영**********************************************/
	
	@RequestMapping(value = "register.do", method = RequestMethod.POST)
	public String registerMember(MemberVO mvo) {
		memberService.registerMember(mvo);
		//return "registerResultView.do?nickName=" + mvo.getNickName();
		System.out.println("register method mvo.getNickName() : "+mvo.getNickName());
		return "redirect:registerResultView.do?nickName=" + mvo.getNickName();
	}
	
	@RequestMapping("registerResultView.do")
	public ModelAndView registerResultView(String nickName) {
		System.out.println("받아온 nickName : "+nickName);
		MemberVO mvo = memberService.findMemberByNickName(nickName);
		System.out.println(mvo);
		return new ModelAndView("member/register_result", "mvo", mvo);
	}
	
	@RequestMapping("eMailCheckAjax.do")
	@ResponseBody
	public String eMailCheckAjax(String eMail) {
		int count = memberService.eMailCheck(eMail);
		return (count == 0) ? "ok" : "fail";
	}
	
	@RequestMapping("nickNameCheckAjax.do")
	@ResponseBody
	public String nickNameCheckAjax(String nickName) {
		int count = memberService.nickNameCheck(nickName);
		return (count == 0) ? "ok" : "fail";
	}
	
/******************************************************************************************/
	
	
	/******************************** 주선 **********************************/
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(HttpServletRequest request, String id, String password) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("password", password);
		MemberVO mvo = memberService.nickNameLogin(map);
		MemberVO mvo2 = memberService.eMailLogin(map);
		System.out.println(mvo);
		System.out.println("-------------------");
		System.out.println(mvo2);
		if (mvo != null) {
			request.getSession().setAttribute("mvo", mvo);
			return "redirect:home.do";
		} else if(mvo2 != null){
			System.out.println(mvo2);
			request.getSession().setAttribute("mvo", mvo2);
			return "redirect:home.do";
		} else{
			return "redirect:member/login_fail.do";
		}
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null)
			session.invalidate();
		return "redirect:home.do";
	}
	/************************************************************************/

	/**
	 * 회원 정보 수정
	 * @author 주선,민영
	 */
	@RequestMapping(value = "updateMember.do", method = RequestMethod.POST)
	public String updateMember(HttpServletRequest request, MemberVO mvo) {
		int check = memberService.updateMember(mvo);
		System.out.println(check);
		request.getSession().setAttribute("mvo", mvo);
		//return "registerResultView.do?nickName=" + mvo.getNickName();
		System.out.println("updateMember method mvo.getNickName() : "+mvo.getNickName());
		return "redirect:member/my_info.do";
	}
	
}


	