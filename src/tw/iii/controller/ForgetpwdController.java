//package tw.iii.controller;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import tw.iii.model.Member;
//import tw.iii.model.MemberService;
//
//@Controller
//public class ForgetpwdController {
//	@Autowired
//	private MemberService mbs;
//	@RequestMapping(path = "/forgetpwd.controller",method = RequestMethod.POST)
//	public String forgetpwd(@RequestParam(name = "account") String account,@RequestParam(name = "email") String email,Model m) {
//		Map<String, String> err = new HashMap<String,String>();
//		boolean ispwd = mbs.forgetpwd(account, email);
//		if(account == null ||account.length()==0) {
//			err.put("account", "請輸入帳號");
//		}
//		if(email==null || email.length()==0) {
//			err.put("email", "請輸入E-mail");	
//		}
//		if(!ispwd) {
//			err.put("err", "請確認輸入著信箱或帳號是否正確");
//		}
//		
//		return "";
//	}
//}
