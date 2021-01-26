package tw.iii.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.authorizeRequests()
	      .antMatchers("/login").permitAll()
	      .antMatchers("/register.jsp").permitAll()
	      .antMatchers("/css/**").permitAll()
	      .antMatchers("/register.controller").permitAll()
	      .antMatchers("/home").hasAnyRole("USER")
			.anyRequest().authenticated()
			.and()
			
		.formLogin()
			.loginPage("/login")
			.usernameParameter("account")
			.loginProcessingUrl("/perform_login")
			.defaultSuccessUrl("/home", true)
			.failureUrl("/login?error")
			.and()
		.logout()
			.logoutUrl("/perform_logout")
			.logoutSuccessUrl("/login");
	}
	
	@Bean 
	public PasswordEncoder passwordEncoder() { 
	    return new BCryptPasswordEncoder(); 
	}
	@Autowired
	private UserDetailsService demoUserDetailsService;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		System.out.println(passwordEncoder().encode("jojo"));
		auth.userDetailsService(demoUserDetailsService).passwordEncoder(passwordEncoder());		//.userDetailsPasswordManager()
		
//		auth.inMemoryAuthentication()		//由記憶體存取
//		.passwordEncoder(passwordEncoder())
//		.withUser("admin").password(passwordEncoder().encode("admin")).roles("ADMIN")
//		.and()
//		.withUser("ryan").password(passwordEncoder().encode("ryan")).roles("USER");
	
//		userDetailsService()//要實做這個 
	
	}
	
	
}
