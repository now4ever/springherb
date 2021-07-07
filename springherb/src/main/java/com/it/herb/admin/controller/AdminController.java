package com.it.herb.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger
		=LoggerFactory.getLogger(AdminController.class);
	
	
	@RequestMapping("/adminMain")
	public void adminMain() {
		logger.info("관리자 메인 화면");
	}
	
	@GetMapping("/manager/managerWrite")
	public String write() {
		//1
		logger.info("관리자 화면");
		
		//2
		
		//3
		
		return "admin/manager/managerWrite";
	}
	
}








