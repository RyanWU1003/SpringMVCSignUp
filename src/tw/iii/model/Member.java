package tw.iii.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;
@Entity
@Table(name = "Member")
public class Member {
	@Id
	@Column(name = "ACCOUNT")
	private String account;
	
	@Column(name = "PASSWORD")
	private String password;
	
	@Column(name = "USERNAME")
	private String userName;
	
	@Column(name = "EMAIL")
	private String email;
	
	@Column(name = "PHONE")
	private String phone;
	
	@Column(name = "ADDRESS")
	private String address;
	@DateTimeFormat(pattern = "YYYY-MM-dd")
	@Column(name = "BIRTHDAY")
	private Date birthday;
	
	@Column(name = "GENDER")
	private String gender;
	
//	@OneToMany(fetch = FetchType.LAZY,mappedBy = "member",cascade = CascadeType.ALL)
//	private Set<TradingRecord> tradingRecord = new HashSet<TradingRecord>(); 
	
	public Member() {
		
	}
	public Member(String account,String password,String userName,String email,String phone,String address,Date birthday,String gender) {
		this.account = account;
		this.password = password;
		this.userName = userName;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.birthday = birthday;
		this.gender = gender;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
//	
//	public Set<TradingRecord> getTradingRecord() {
//		return tradingRecord;
//	}
//
//	public void setTradingRecord(Set<TradingRecord> tradingRecord) {
//		this.tradingRecord = tradingRecord;
//	}

}
