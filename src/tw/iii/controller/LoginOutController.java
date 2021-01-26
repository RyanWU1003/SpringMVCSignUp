package tw.iii.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginOutController {

	@GetMapping("/login_page")
	public String login() {
		return "login";
	}
	@GetMapping("/logout_page")
	public String logout() {
		return "logout";
	}
}
