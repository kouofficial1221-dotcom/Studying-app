package com.kokifujii.studyapp.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginForm {
	
	@GetMapping("/study/Registar")
	public String getHello() {
		return "study/Registar";
	}
}
