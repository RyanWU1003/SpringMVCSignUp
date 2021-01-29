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
	//顯示會員資料
	@RequestMapping(path = "/select_member",method = RequestMethod.GET)
	public String selectmember(Model m) {
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		m.addAttribute("selection","all");
		m.addAttribute("memberList",mbs.select(account));
		System.out.println(account);
		return "member";
	}
	
	//更換密碼
	@RequestMapping(path = "/checkpassword.controller",method = RequestMethod.POST)
	public String checkpassword(@RequestParam(name = "oldpassword") String oldpwd,
			@RequestParam(name = "newpassword") String newpwd,
			@RequestParam(name = "checkpassword") String checknewpwd,
			Model m) {
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		Map<String, String> err = new HashMap<String, String>();
		List<Member> password = mbs.selectOldpwd(account);
		String old =  password.toString().trim();		//取出的字串是包含[]的
		old = old.substring(1, old.length() - 1);		//將字串中頭尾去除(即是去除[]),來方便後面進行加密密碼比對
		boolean check =passwordEncoder().matches(oldpwd,old );
//		if(check) {
//			if(newpwd.equals(checknewpwd)) {
//				
//				mbs.updatepassword(account, newpwd);
//			}
//			
//		}
		if(!check) {
			err.put("checkoldpwd", "請輸入正確舊密碼");
		}
		if(!newpwd.equals(checknewpwd)) {
			err.put("newpwderr", "請確認輸入新密碼與確認密碼是否相同");
		}
		m.addAttribute("err",err);
		if(err!=null && !err.isEmpty()) {
			return "changepwd";
		}
		mbs.updatepassword(account, newpwd);
		
//		System.out.println(account);
//		System.out.println("-------------");
//		System.out.println(old);		//old
//		System.out.println(oldpwd);
//		System.out.println(check);
		return "index";
	}
	
}
