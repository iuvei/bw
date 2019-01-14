package com.maven.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Model class of activity_bet_record.
 * 
 * @author generated by ERMaster
 * @version $Id$
 */
public class ActivityBetRecord implements Serializable {

	/** serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** 主键. */
	private Integer betrecordcode;

	/** 用户编码. */
	private String employeecode;

	/** 定制活动编码. */
	private Integer ecactivitycode;

	/** 充值金额. */
	private Double recharge;
	
	
	/** 需完成打码. */
	private Double mustbet;

	/** 已完成打码. */
	private Double alreadybet;

	/** 是否完成 0未完成 1已完成. */
	private String betrecordstatus;

	/** 创建时间. */
	private Date createtime;

	/** 完成时间. */
	private Date finishtime;
	
	/** 用户账号. */
	private String loginaccount;
	
	/** 企业编码 */
	private String enterprisecode;
	/** 品牌编码. */
	private String brandcode;
	/** 员工上级编码. */
	private String parentemployeecode;
	/** 员工上级账号 */
	private String parentemployeeaccount;
	
	/**
	 * 业务单号
	 */
	private String ordernumber;
	
	/* 页面显示字段 */
	private String activityname;
	/* 页面显示字段 */
	
	/* 如果品牌未设置默认打码，则默认打码为1倍 */
	public static BigDecimal ifnodefaultchip = new BigDecimal(1);
	
	/**
	 * Constructor.
	 */
	public ActivityBetRecord() {
	}
	public Double getRecharge() {
		return recharge;
	}

	public void setRecharge(Double recharge) {
		this.recharge = recharge;
	}

	public enum Enum_betrecordstatus{
		未完成("0","未完成"),
		已完成("1","已完成"),
		;
		public String value;
		public String desc;
		
		private Enum_betrecordstatus(String value,String desc){
			this.value=value;
			this.desc=desc;
		}
	}
	
	public enum Enum_ecactivitycode{
		存款流水(0,"存款所需流水"),
		返水所需流水(-99,"返水所需流水"),
		UNKNOW(-1,"不属于现有活动流水");
		;
		public Integer value;
		public String desc;
		
		private Enum_ecactivitycode(Integer value,String desc){
			this.value=value;
			this.desc=desc;
		}
	}
	
	/**
	 * Set the 主键.
	 * 
	 * @param betrecordcode
	 *            主键
	 */
	public void setBetrecordcode(Integer betrecordcode) {
		this.betrecordcode = betrecordcode;
	}

	/**
	 * Get the 主键.
	 * 
	 * @return 主键
	 */
	public Integer getBetrecordcode() {
		return this.betrecordcode;
	}

	/**
	 * Set the 用户编码.
	 * 
	 * @param employeecode
	 *            用户编码
	 */
	public void setEmployeecode(String employeecode) {
		this.employeecode = employeecode;
	}

	/**
	 * Get the 用户编码.
	 * 
	 * @return 用户编码
	 */
	public String getEmployeecode() {
		return this.employeecode;
	}

	/**
	 * Set the 定制活动编码.
	 * 
	 * @param ecactivitycode
	 *            定制活动编码
	 */
	public void setEcactivitycode(Integer ecactivitycode) {
		this.ecactivitycode = ecactivitycode;
	}

	/**
	 * Get the 定制活动编码.
	 * 
	 * @return 定制活动编码
	 */
	public Integer getEcactivitycode() {
		return this.ecactivitycode;
	}

	/**
	 * Set the 需完成打码.
	 * 
	 * @param mustbet
	 *            需完成打码
	 */
	public void setMustbet(Double mustbet) {
		this.mustbet = mustbet;
	}

	/**
	 * Get the 需完成打码.
	 * 
	 * @return 需完成打码
	 */
	public Double getMustbet() {
		return this.mustbet;
	}

	/**
	 * Set the 已完成打码.
	 * 
	 * @param alreadybet
	 *            已完成打码
	 */
	public void setAlreadybet(Double alreadybet) {
		this.alreadybet = alreadybet;
	}

	/**
	 * Get the 已完成打码.
	 * 
	 * @return 已完成打码
	 */
	public Double getAlreadybet() {
		return this.alreadybet;
	}

	/**
	 * Set the 是否完成 0未完成 1已完成.
	 * 
	 * @param betrecordstatus
	 *            是否完成 0未完成 1已完成
	 */
	public void setBetrecordstatus(String betrecordstatus) {
		this.betrecordstatus = betrecordstatus;
	}

	/**
	 * Get the 是否完成 0未完成 1已完成.
	 * 
	 * @return 是否完成 0未完成 1已完成
	 */
	public String getBetrecordstatus() {
		return this.betrecordstatus;
	}

	/**
	 * Set the 创建时间.
	 * 
	 * @param createtime
	 *            创建时间
	 */
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	/**
	 * Get the 创建时间.
	 * 
	 * @return 创建时间
	 */
	public Date getCreatetime() {
		return this.createtime;
	}

	/**
	 * Set the 完成时间.
	 * 
	 * @param finishtime
	 *            完成时间
	 */
	public void setFinishtime(Date finishtime) {
		this.finishtime = finishtime;
	}

	/**
	 * Get the 完成时间.
	 * 
	 * @return 完成时间
	 */
	public Date getFinishtime() {
		return this.finishtime;
	}

	public String getLoginaccount() {
		return loginaccount;
	}

	public void setLoginaccount(String loginaccount) {
		this.loginaccount = loginaccount;
	}

	public String getActivityname() {
		return activityname;
	}

	public void setActivityname(String activityname) {
		this.activityname = activityname;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((betrecordcode == null) ? 0 : betrecordcode.hashCode());
		return result;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		ActivityBetRecord other = (ActivityBetRecord) obj;
		if (betrecordcode == null) {
			if (other.betrecordcode != null) {
				return false;
			}
		} else if (!betrecordcode.equals(other.betrecordcode)) {
			return false;
		}
		return true;
	}
	public String getEnterprisecode() {
		return enterprisecode;
	}
	public void setEnterprisecode(String enterprisecode) {
		this.enterprisecode = enterprisecode;
	}
	public String getBrandcode() {
		return brandcode;
	}
	public void setBrandcode(String brandcode) {
		this.brandcode = brandcode;
	}
	public String getParentemployeecode() {
		return parentemployeecode;
	}
	public void setParentemployeecode(String parentemployeecode) {
		this.parentemployeecode = parentemployeecode;
	}
	public String getParentemployeeaccount() {
		return parentemployeeaccount;
	}
	public void setParentemployeeaccount(String parentemployeeaccount) {
		this.parentemployeeaccount = parentemployeeaccount;
	}
	public String getOrdernumber() {
		return ordernumber;
	}
	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
	}
	
}
