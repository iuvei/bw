package com.maven.entity;

import java.io.Serializable;

/**
 * Model class of employee_level_condition.
 * 
 * @author generated by ERMaster
 * @version $Id$
 */
public class EmployeeLevelCondition implements Serializable {

	/** serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** 级别条件编码. */
	private String levelconditioncode;

	/** 存款量. */
	private Double depositamount;

	/** 存款次数. */
	private Integer depositnumber;

	/**
	 * Constructor.
	 */
	public EmployeeLevelCondition() {
	}

	/**
	 * Set the 级别条件编码.
	 * 
	 * @param levelconditioncode
	 *            级别条件编码
	 */
	public void setLevelconditioncode(String levelconditioncode) {
		this.levelconditioncode = levelconditioncode;
	}

	/**
	 * Get the 级别条件编码.
	 * 
	 * @return 级别条件编码
	 */
	public String getLevelconditioncode() {
		return this.levelconditioncode;
	}

	/**
	 * Set the 存款量.
	 * 
	 * @param depositamount
	 *            存款量
	 */
	public void setDepositamount(Double depositamount) {
		this.depositamount = depositamount;
	}

	/**
	 * Get the 存款量.
	 * 
	 * @return 存款量
	 */
	public Double getDepositamount() {
		return this.depositamount;
	}

	/**
	 * Set the 存款次数.
	 * 
	 * @param depositnumber
	 *            存款次数
	 */
	public void setDepositnumber(Integer depositnumber) {
		this.depositnumber = depositnumber;
	}

	/**
	 * Get the 存款次数.
	 * 
	 * @return 存款次数
	 */
	public Integer getDepositnumber() {
		return this.depositnumber;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((levelconditioncode == null) ? 0 : levelconditioncode.hashCode());
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
		EmployeeLevelCondition other = (EmployeeLevelCondition) obj;
		if (levelconditioncode == null) {
			if (other.levelconditioncode != null) {
				return false;
			}
		} else if (!levelconditioncode.equals(other.levelconditioncode)) {
			return false;
		}
		return true;
	}

}
