package com.suwon.ezen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.suwon.ezen.mapper.DataMapper;
import com.suwon.ezen.vo.UserVO;

import lombok.Setter;

@RestController
@RequestMapping("/main/*")
public class MainController {
	@Setter(onMethod_ = @Autowired)
	private DataMapper mapper;
	
	@GetMapping("/start")
	public ModelAndView start(@RequestParam(required = false) String pointer) {
		ModelAndView model = new ModelAndView();
		System.out.println("pointer: " + pointer);
		
		if (pointer != null) {
			System.out.println("여기 들어왔니?");
			UserVO vo = mapper.getUserInfo(pointer);
			model.addObject("info", vo);
		}
		model.setViewName("redirect:/main/displayData");
		
		return model;
	}
	
	@GetMapping("displayData")
	public void displayData() {
		
	}
	
	@GetMapping("/index")
	public void index() {}
	
	@GetMapping("/register")
	public void register() {}
	
}
