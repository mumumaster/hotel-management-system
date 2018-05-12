package com.gx.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gx.page.Page;
import com.gx.po.CommodityPo;

public interface CommodityService {
	
	    public int deleteById(Integer id);
		
		
		public int insertAll(CommodityPo commodityPo);
		
		
		public	CommodityPo selectById(Integer id);

		
		public int updateById(CommodityPo commodityPo);
		
		
		//分页需要
		public Page<CommodityPo> pageFuzzyselect(String commodityName,int commodityTypeID,Page<CommodityPo> vo);
		
		//无分页的模糊查询  非本派所用
		public List<CommodityPo> fuzzySelect(String commodityName,int commodityTypeID);

		//ajax 验证是否存在 此商品
	    public int selectYZ(String commodityName);
}
