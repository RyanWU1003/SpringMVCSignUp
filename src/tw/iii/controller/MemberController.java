package tw.iii.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
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
	@RequestMapping(path = "/perform_login", method = RequestMethod.POST)
	public String login() {
		return "login.jsp";
	}
	
	//顯示會員資料
	@RequestMapping(path = "/select_member",method = RequestMethod.GET)
	public String selectmember(Model m) {
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		m.addAttribute("selection","all");
		m.addAttribute("memberList",mbs.select(account));
		System.out.println(account);
		return "member.jsp";
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
			return "changepwd.jsp";
		}
		mbs.updatepassword(account, newpwd);
		
		return "login.jsp";
	}
	
	//更新會員資料取得會員資料		
	@RequestMapping(path = "/updatePage",method = RequestMethod.GET)
	public String updatePag(Model m) {
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		m.addAttribute("selection","update");
		m.addAttribute("memberList",mbs.select(account));
		System.out.println(account);
		return "member.jsp";
	}
	
	
	
	//更新會員資料

	@RequestMapping(path = "/update_member",method = RequestMethod.POST)
	public String updatemember(@RequestParam(name = "username") String username ,
			@RequestParam(name = "email") String email ,
			@RequestParam(name = "phone") String phone ,
			@RequestParam(name = "address") String address ,
			@RequestParam(name = "birthday") String birthday ,
			@RequestParam(name = "gender") String gender ,
			Model m) throws ParseException {
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		mbs.updateAll(account, username, email, phone, address, birthday, gender);
		
		return "member.jsp" ;
	}
	
	
	//忘記密碼寄系統信
	@Autowired
	private JavaMailSender mailsender;
	@RequestMapping(path = "/forgetpwd.controller",method = RequestMethod.POST)
	public String forgetpwd(@RequestParam(name = "account") String account,@RequestParam(name = "email") String email,Model m) {
		Map<String, String> err = new HashMap<String,String>();
		boolean ispwd = mbs.forgetpwd(account, email);
		if(account == null ||account.length()==0) {
			err.put("account", "請輸入帳號");
		}
		if(email==null || email.length()==0) {
			err.put("email", "請輸入E-mail");	
		}
		if(!ispwd) {
			err.put("err", "請確認輸入著信箱或帳號是否正確");
		}
		m.addAttribute("err",err);
		if(err!=null && !err.isEmpty()) {
			return "forgetpwd";
		}
		List<Member> mail=mbs.selectemail(account, email);
		String mail1 = mail.toString().trim();
		mail1 = mail1.substring(1, mail1.length() - 1);
		System.out.println(mail1);
		
		int x = (int) (100+Math.random()*5000);
		String pwd = "asd"+String.valueOf(x);
		System.out.println(pwd);
		
		mbs.updatepassword(account, pwd);
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(mail1);
		message.setSubject("忘記密碼");
		message.setText("你的新密碼為： \n"+pwd+"\n請重新登入後立即更換密碼，保護帳號安全");
		mailsender.send(message);
		
//		String host = "smtp.gmail.com";			//Gmail的TLS or SSL(身分驗證)
//		int port = 587;							//Gmail的TLS/STARTTLS 的Port號
//		final String sendUserMail = "testw1003@gmail.com";
//		final String sendUserpassword = "qwe@258741";
//		
//		Properties props = new Properties();
//		props.put("mail.smtp.host", host);
//		props.put("mail.smtp.auth", "true");		//這個引數設為true，讓伺服器進行認證,認證使用者名稱和密碼是否正確
//		props.put("mail.smtp.starttls.enable", "true");
//		props.put("mail.smtp.port", port);
//		
//		Session session = Session.getInstance(props, new Authenticator() {
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication(sendUserMail, sendUserpassword);//取得寄信信箱/密碼設定
//			}
//		});
//		try {
////			Thread.currentThread().run();
//			Message message = new MimeMessage(session);
//			message.setFrom(new InternetAddress(sendUserMail));//寄信人信箱
//			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mail1));//收信人信箱
//			message.setSubject("忘記密碼");						//寄信標題
//			message.setText("你的新密碼為： \n"+pwd+"\n請重新登入後立即更換密碼，保護帳號安全");				//寄信內容
//			Transport transport = session.getTransport("smtp");
//			transport.connect(host, sendUserMail, sendUserpassword);
//			transport.send(message);
//			System.out.println("寄信成功111");
//			
//		} catch (MessagingException e) {
//			
//			e.printStackTrace();
//			throw new RuntimeException(e);
//		}
		
		return "login.jsp";
	}
	
}
