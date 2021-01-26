package tw.iii.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.iii.model.MemberService;

@Controller
public class LoginController {
	@Autowired
//	@Qualifier("MemberService")
	private MemberService mbrs;
	@RequestMapping(path = "/login.controller",method = RequestMethod.POST)
	public String loginAction(@RequestParam(name = "account") String account,@RequestParam(name = "password") String password,
			Model model,HttpServletRequest req) {
		Map<String, String> errors = new HashMap<String,String>();
		
		boolean isLogin = mbrs.checkLogin(account, password);
		
		if(account==null || account.length()==0) {
			errors.put("account", "請輸入帳號");	
		}
		if(password==null || password.length()==0) {
			errors.put("password", "請確認密碼");	
		}
		
		
		if(isLogin) {
			HttpSession hSession = req.getSession();
			hSession.setAttribute("isLogin", isLogin);
			model.addAttribute("selection","all");

			return "member.jsp";
		}
		model.addAttribute("errors", errors);
		if(errors != null && !errors.isEmpty()) {
			return "index.jsp";
		}
		errors.put("error", "請確認帳號密碼是否正確");
		return"index.jsp";
	}
}
