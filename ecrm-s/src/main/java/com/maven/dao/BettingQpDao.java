package com.maven.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.maven.base.dao.BaseDao;
import com.maven.entity.BettingHqAg;
import com.maven.entity.BettingMg;
import com.maven.entity.BettingQp;

@Repository
public interface BettingQpDao extends BaseDao<BettingQp> {


	/**
	 * 获取游戏记录总数之金额统计
	 * @param object
	 * @return
	 */
	Map<String, Object> takeRecordCountMoney(Map<String, Object> object) throws Exception;
}
