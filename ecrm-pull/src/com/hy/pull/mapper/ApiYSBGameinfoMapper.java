package com.hy.pull.mapper;

import java.util.Map;

/**
 * 对应数据api_ysb_gameinfo的操作接
 * @author xiaogao
 */
public interface ApiYSBGameinfoMapper extends BaseMapper{
	
	int deleteBetting(Map<String, Object> entity);
	
	int deleteWinlost(Map<String, Object> entity);
}
