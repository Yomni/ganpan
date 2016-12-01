package org.sync.ganpan.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.sync.ganpan.model.service.SignBoardService;
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
}
