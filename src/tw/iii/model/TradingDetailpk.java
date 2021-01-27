package tw.iii.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.stereotype.Component;

@Embeddable
@Component
public class TradingDetailpk implements Serializable{
	private static final long serialVersionUID = 1L;

	@Column(name = "item")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int item;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id")
	private TradingRecord tradingRecord;
	
	
	public TradingDetailpk() {
	}


	public int getItem() {
		return item;
	}


	public void setItem(int item) {
		this.item = item;
	}


	public TradingRecord getTradingRecord() {
		return tradingRecord;
	}


	public void setTradingRecord(TradingRecord tradingRecord) {
		this.tradingRecord = tradingRecord;
	}

}
