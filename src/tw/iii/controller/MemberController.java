package tw.iii.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.iii.model.Member;
import tw.iii.model.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService mbs;
	

	private Member mb;
	
	private  BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	};
	
	@RequestMapping(path = "/select_member",method = RequestMethod.GET)
	public String selectmember(Model m) {
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		m.addAttribute("selection","all");
		m.addAttribute("memberList",mbs.select(account));
		System.out.println(account);
		return "member";
	}
	@RequestMapping(path = "/checkpassword.controller",method = RequestMethod.POST)
	public String checkpassword(@RequestParam(name = "oldpassword") String oldpwd,
			@RequestParam(name = "newpassword") String newpwd,
			@RequestParam(name = "checkpassword") String checknewpwd) {
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
//		Map<String, String> err = new HashMap<String, String>();
//		mb = mbs.selecter(account);
//		String old = mb.getPassword();
		List<Member> password = mbs.selectOldpwd(account);
		String old =  passwordEncoder().encode(password.toString().trim());
		boolean check =passwordEncoder().matches(oldpwd,old );
		if(check) {
			if(newpwd == checknewpwd) {
				mbs.updatepassword(account, newpwd);
			}
		}
		System.out.println(account);
		System.out.println("-------------");
		System.out.println(old);
		System.out.println(oldpwd);
		System.out.println(check);
		return "index";
	}
	
}
