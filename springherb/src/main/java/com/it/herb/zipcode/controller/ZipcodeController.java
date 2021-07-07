package com.it.herb.zipcode.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.herb.zipcode.model.ZipcodeService;
import com.it.herb.zipcode.model.ZipcodeVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/zipcode")
public class ZipcodeController {
	private Logger logger
		=LoggerFactory.getLogger(ZipcodeController.class);
	
	private final ZipcodeService zipcodeService;
	
	@RequestMapping("/zipcode")
	public String zipcode(@RequestParam(required = false) String dong,
			Model model) {
		//1
		logger.info("우편번호 찾기, 파라미터 dong={}", dong);
		
		//2
		List<ZipcodeVO> list=null;
		if(dong!=null && !dong.isEmpty()) {
			list=zipcodeService.selectZipcode(dong);
			logger.info("우편번호 찾기 조회 결과, list.size={}", list.size());
		}
		
		//3.
		model.addAttribute("list", list);
		
		return "zipcode/zipcode";
	}
	
}





