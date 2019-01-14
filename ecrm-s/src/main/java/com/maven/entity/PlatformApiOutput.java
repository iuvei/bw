package com.maven.entity;

import java.io.Serializable;


/**
 * Model class of platform_api_output.
 * 
 * @author generated by ERMaster
 * @version $Id$
 */
public class PlatformApiOutput implements Serializable {

	/** serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** 输出接口编码. */
	private String outputapicode;
	
	/** 企业编码 */
	private String enterprisecode;

	/** 接口地址. */
	private String outputapiurl;

	/** 接口状态 1.可用 0.不可用. */
	private Byte outputapistatus;

	/** ASE Key. */
	private String apikey1;

	/** MD5 Key. */
	private String apikey2;

	/** 接口用户. */
	private String apiuser;

	/** 接口用户密码. */
	private String apipassword;

	/** 接口备注. */
	private String apicomment;
	
	/* 查询条件:开始条数*/
	private Integer start;
	/* 查询条件:查询条数 */
	private Integer limit;

	/**
	 * Constructor.
	 */
	public PlatformApiOutput() {
	}
	
	/**
	 * @param brandcode
	 */
	public PlatformApiOutput(String enterprisecode,String outputapicode) {
		this.enterprisecode = enterprisecode;
		this.outputapicode = outputapicode;
	}
	
	
	/**
	 * Constructor.
	 */
	public PlatformApiOutput(String brandcode,Byte outputapistatus,String md5key,String deskey) {
		this.outputapistatus = outputapistatus;
		this.apikey1 = md5key;
		this.apikey2 = deskey;
	}

	/**
	 * Set the 输出接口编码.
	 * 
	 * @param outputapicode
	 *            输出接口编码
	 */
	public void setOutputapicode(String outputapicode) {
		this.outputapicode = outputapicode;
	}

	/**
	 * Get the 输出接口编码.
	 * 
	 * @return 输出接口编码
	 */
	public String getOutputapicode() {
		return this.outputapicode;
	}

	public String getEnterprisecode() {
		return enterprisecode;
	}

	public void setEnterprisecode(String enterprisecode) {
		this.enterprisecode = enterprisecode;
	}

	/**
	 * Set the 接口地址.
	 * 
	 * @param outputapiurl
	 *            接口地址
	 */
	public void setOutputapiurl(String outputapiurl) {
		this.outputapiurl = outputapiurl;
	}

	/**
	 * Get the 接口地址.
	 * 
	 * @return 接口地址
	 */
	public String getOutputapiurl() {
		return this.outputapiurl;
	}

	/**
	 * Set the 接口状态 1.可用 0.不可用.
	 * 
	 * @param outputapistatus
	 *            接口状态 1.可用 0.不可用
	 */
	public void setOutputapistatus(Byte outputapistatus) {
		this.outputapistatus = outputapistatus;
	}

	/**
	 * Get the 接口状态 1.可用 0.不可用.
	 * 
	 * @return 接口状态 1.可用 0.不可用
	 */
	public Byte getOutputapistatus() {
		return this.outputapistatus;
	}

	/**
	 * Set the 接口 AES Key 
	 * 
	 * @param  接口 AES Key 
	 */
	public void setApikey1(String apikey1) {
		this.apikey1 = apikey1;
	}

	/**
	 * Get the 接口  ASE Key
	 * 
	 * @return 接口  AES Key 
	 */
	public String getApikey1() {
		return this.apikey1;
	}

	/**
	 * Set the 接口 MD5 Key
	 * 
	 * @param  接口 MD5 Key
	 */
	public void setApikey2(String apikey2) {
		this.apikey2 = apikey2;
	}

	/**
	 * Get the 接口 MD5 Key
	 * 
	 * @return 接口 MD5 Key
	 */
	public String getApikey2() {
		return this.apikey2;
	}

	/**
	 * Set the 接口用户.
	 * 
	 * @param apiuser
	 *            接口用户
	 */
	public void setApiuser(String apiuser) {
		this.apiuser = apiuser;
	}

	/**
	 * Get the 接口用户.
	 * 
	 * @return 接口用户
	 */
	public String getApiuser() {
		return this.apiuser;
	}

	/**
	 * Set the 接口用户密码.
	 * 
	 * @param apipassword
	 *            接口用户密码
	 */
	public void setApipassword(String apipassword) {
		this.apipassword = apipassword;
	}

	/**
	 * Get the 接口用户密码.
	 * 
	 * @return 接口用户密码
	 */
	public String getApipassword() {
		return this.apipassword;
	}

	/**
	 * Set the 接口备注.
	 * 
	 * @param apicomment
	 *            接口备注
	 */
	public void setApicomment(String apicomment) {
		this.apicomment = apicomment;
	}

	/**
	 * Get the 接口备注.
	 * 
	 * @return 接口备注
	 */
	public String getApicomment() {
		return this.apicomment;
	}

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((outputapicode == null) ? 0 : outputapicode.hashCode());
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
		PlatformApiOutput other = (PlatformApiOutput) obj;
		if (outputapicode == null) {
			if (other.outputapicode != null) {
				return false;
			}
		} else if (!outputapicode.equals(other.outputapicode)) {
			return false;
		}
		return true;
	}

}