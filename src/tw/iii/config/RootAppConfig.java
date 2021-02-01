package tw.iii.config;

import java.util.Properties;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jndi.JndiObjectFactoryBean;
//import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
public class RootAppConfig {

	Environment env;

	@Autowired
	public void setEnv(Environment env) {
		this.env = env;
	}

	@Bean
	public DataSource dataSource() throws IllegalArgumentException, NamingException {
		JndiObjectFactoryBean factoryBean = new JndiObjectFactoryBean();
		factoryBean.setJndiName("java:comp/env/connectSQLServerJdbc/OrderService");
		factoryBean.setProxyInterface(DataSource.class);
		factoryBean.setLookupOnStartup(false);
		factoryBean.afterPropertiesSet();
		DataSource ds = (DataSource) factoryBean.getObject();
		System.out.println("ds:"+ds);
		return ds;
		
//		DriverManagerDataSource dataSource = new DriverManagerDataSource();
//		dataSource.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//		dataSource.setUrl("jdbc:sqlserver://localhost:1433;databaseName=Topic");
//		dataSource.setUsername("watcher");
//		dataSource.setPassword("P@ssw0rd");
//		return dataSource;
		
	}
	public Properties hibernateProperties() {
		Properties hProperties = new Properties();
		hProperties.put("hibernate.dialect", org.hibernate.dialect.SQLServerDialect.class);
		hProperties.put("hibernate.current_session_context_class", "thread");
		hProperties.put("hibernate.show_sql", Boolean.TRUE);
		hProperties.put("hibernate.format_sql", Boolean.TRUE);
		return hProperties;
	}

	@Bean(destroyMethod = "destroy")
	public LocalSessionFactoryBean sessionFactory() throws IllegalArgumentException, NamingException {
		LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
		factory.setDataSource(dataSource());
		factory.setPackagesToScan(new String[] { "tw.iii.model" });
		factory.setHibernateProperties(hibernateProperties());
		return factory;
	}

		//交易設定檔
	@Bean(name = "transactionManager")
	@Autowired
	public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager htManager = new HibernateTransactionManager();
		htManager.setSessionFactory(sessionFactory);
		return htManager;
	}
	
//	public Properties javamailProperties(){
//		Properties mailProperties = new Properties();
//		mailProperties.put("mail.smtp.auth", "true");
//		mailProperties.put("mail.smtp.starttls.enable", "true");
//		
//		
//		
//	}
//	public JavaMailSenderImpl mailSender{
//		JavaMailSenderImpl mailutil = new JavaMailSenderImpl();
//		mailutil.setHost("smtp.gmail.com");
//		mailutil.setPort(587);
//		mailutil.setUsername("testw1003@gmail.com");
//		mailutil.setPassword("qwe@258741");
//		mailutil.setJavaMailProperties(javaMailProperties);
//	}
	
}
