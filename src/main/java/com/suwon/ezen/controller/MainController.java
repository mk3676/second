package com.suwon.ezen.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/input")
@RestController
public class MainController {
	@GetMapping("/start")
	public ModelAndView start() {
		ModelAndView model = new ModelAndView();
		model.setViewName("test");
		
		return model;
	}
}
