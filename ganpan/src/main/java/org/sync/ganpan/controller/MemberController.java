package org.sync.ganpan.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String register(MemberVO mvo) {
		memberService.register(mvo);
		return "redirect:registerResultView.do?email=" + mvo.geteMail();
	}
	
	@RequestMapping("registerResultView.do")
	public ModelAndView registerResultView(String email) {
		MemberVO mvo = memberService.findMemberByEmail(email);
		return new ModelAndView("register_result", "memberVO", mvo);
	}
	
	@RequestMapping("eMailCheckAjax.do")
	@ResponseBody
	public String eMailCheckAjax(String eMail) {
		System.out.println(eMail);
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
		System.out.println(map);
		MemberVO mvo = memberService.nickNameLogin(map);
		MemberVO mvo2 = memberService.eMailLogin(map);
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
}
