package com.gx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gx.dao.CommodityDao;
import com.gx.page.Page;
import com.gx.po.CommodityPo;
import com.gx.service.CommodityService;

@Transactional
@Service(value="commodityService")
public class CommodityServiceImpl implements CommodityService {

	@Autowired
	private CommodityDao commodityDao;
	
	@Override
	public int deleteById(Integer id) {
		return commodityDao.deleteById(id);
	}

	@Override
	public int insertAll(CommodityPo commodityPo) {
		return commodityDao.insertAll(commodityPo);
	}

	@Override
	public CommodityPo selectById(Integer id) {
		return commodityDao.selectById(id);
	}

	@Override
	public int updateById(CommodityPo commodityPo) {
		return commodityDao.updateById(commodityPo);
	}

	@Override
	public Page<CommodityPo> pageFuzzyselect(String commodityName,
		int commodityTypeID, Page<CommodityPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<CommodityPo> list=commodityDao.pageFuzzyselect(commodityName, commodityTypeID, start, vo.getPageSize());
		vo.setResult(list);
		int count=commodityDao.countFuzzyselect(commodityName, commodityTypeID);
		vo.setTotal(count);
		return vo;
	}

	@Override
	public List<CommodityPo> fuzzySelect(String commodityName,int commodityTypeID) {
		return commodityDao.fuzzySelect(commodityName, commodityTypeID);
	}

	@Override
	public int selectYZ(String commodityName) {
		return this.commodityDao.selectYZ(commodityName);
	}

}
