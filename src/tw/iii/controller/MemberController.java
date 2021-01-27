package tw.iii.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tw.iii.model.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService mbs;
	@RequestMapping(path = "/selectmember",method = RequestMethod.GET)
	public String selectmember(Model m) {
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		m.addAttribute("selection","all");
		m.addAttribute("memberList",mbs.selecter(account));
		System.out.println(account);
		return "member";
	}
	
}
