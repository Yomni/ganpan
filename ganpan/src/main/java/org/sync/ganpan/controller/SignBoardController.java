package org.sync.ganpan.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.sync.ganpan.model.service.SignBoardService;
import org.sync.ganpan.model.vo.MemberVO;
import org.sync.ganpan.model.vo.SignBoardVO;


/**
 * 간판을 위해 설정하는 Controller
 * @author JYM
 *
 */
@Controller
public class SignBoardController {
	@Resource
	SignBoardService signBoardService;
	
	/**
	 * 칸반 검색
	 * @author Kang
	 */
	@RequestMapping("findSignBoardListByTitle.do")
	public ModelAndView findSignBoardListByTitle(String title) {
		List<SignBoardVO> sbList = signBoardService.findSignBoardListByTitle(title);
		System.out.println(sbList);
		return new ModelAndView("board/search_result", "sbList", sbList);
	}
	
	/**
	 * 새 간판 생성하기
	 * @author 민영
	 */
	@RequestMapping("createNewGanpan.do")
	public ModelAndView createNewGanpan(HttpSession session,String title, String ganpanType){
		MemberVO mvo=(MemberVO) session.getAttribute("mvo");
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("bossNickName", mvo.getNickName());
		map.put("signBoardName", title);
		if(ganpanType.equals("public")){// 간판 공개시 visibility default 0
			map.put("visibility",0);
			signBoardService.createNewGanpan(map);
		}else{
			map.put("visibility",1);
			signBoardService.createNewGanpan(map);
		}
		return new ModelAndView("board/search_result" );
	}
	
	
	/**
	 * 간판 생성시
	 * 소유자의 소유칸판 중 중복되는 타이틀이 있는지 확인
	 * @author 민영
	 */
	@ResponseBody
	@RequestMapping("titleCheckAjax.do")
	public String titleCheckAjax(String title,HttpSession session) {
		MemberVO mvo=(MemberVO) session.getAttribute("mvo");
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("bossNickName", mvo.getNickName());
		map.put("signBoardName", title);
		int count = signBoardService.titleCheck(map);
		return (count == 0) ? "ok" : "fail";
	}
}
