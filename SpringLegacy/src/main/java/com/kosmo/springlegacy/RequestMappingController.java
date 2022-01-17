package com.kosmo.springlegacy;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RequestMappingController {
	
	//get방식 또는 post방식의 전송을 위한 인덱스 페이지 매핑
	@RequestMapping("/requestMapping/index.do")
	public String rmIndex() {
		return "02RequestMapping/index";
	}
	
	/*
	 단순히 요청명만 매핑하는 경우에는 value, method를 생략할 수 있으나
	 전송방식까지 명시해야할 경우에는 속성을 제거하면 에러가 발생한다.
	 */
	@RequestMapping(value="/requestMapping/getSearch.do",
			method=RequestMethod.GET)
	public String getSearch(HttpServletRequest req, Model model) {
		
		System.out.println("requestMethod.get방식으로 폼값전송");
		
		String sColumn = req.getParameter("searchColumn");
		String sWord = req.getParameter("searchWord");
		
		model.addAttribute("sColumn",sColumn);
		model.addAttribute("sWord",sWord);
		
		return "02RequestMapping/getSearch";
	}
}
