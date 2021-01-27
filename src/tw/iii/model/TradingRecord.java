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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Fetch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Entity
@Table(name="TradingRecord")
public class TradingRecord {
	
	@Id @Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="date")
	private Date date;
	
	@Column(name="total")
	private int total;
	
	@Transient@Column(name="account") 
	private String account;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="account")
	@Autowired
	private Member member;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "pk.tradingRecord",cascade = CascadeType.ALL)
	private Set<TradingDetail> tradingdetail = new HashSet<TradingDetail>();
	
	public TradingRecord() {
		
	}

	public TradingRecord(Date date, int total, String account, Member member,
			Set<TradingDetail> tradingdetail) {
		super();
		this.date = date;
		this.total = total;
		this.account = account;
		this.member = member;
		this.tradingdetail = tradingdetail;
	}

	public int getid() {
		return id;
	}

	public void setiId(int id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Set<TradingDetail> getTradingdetail() {
		return tradingdetail;
	}

	public void setTradingdetail(Set<TradingDetail> tradingdetail) {
		this.tradingdetail = tradingdetail;
	}
	
}
