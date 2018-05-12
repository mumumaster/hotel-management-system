package com.gx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gx.dao.PassengerDao;
import com.gx.page.Page;
import com.gx.po.PassengerPo;
import com.gx.po.ReceiveTargetPo;
import com.gx.service.PassengerService;

@Transactional
@Service(value="passengerService")
public class PassengerServiceImpl implements PassengerService {

	@Autowired
	private PassengerDao passengerDao;
	
	@Override
	public int deleteById(Integer id) {
		return passengerDao.deleteById(id);
	}

	@Override
	public int insertAll(PassengerPo passengerPo) {
		return passengerDao.insertAll(passengerPo);
	}

	@Override
	public PassengerPo selectById(Integer id) {
		return passengerDao.selectById(id);
	}

	@Override
	public int updateById(PassengerPo passengerPo) {
		return passengerDao.updateById(passengerPo);
	}

	@Override
	public Page<PassengerPo> pageFuzzyselect(String name, Page<PassengerPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<PassengerPo> list=passengerDao.pageFuzzyselect(name, start, vo.getPageSize());
		vo.setResult(list);
		int count=passengerDao.countFuzzyselect(name);
		vo.setTotal(count);
		return vo;
	}

	@Override
	public List<PassengerPo> selectAll() {
		return passengerDao.selectAll();
	}

	@Override
	public List<PassengerPo> selectAjaxList(String name) {
		return passengerDao.selectAjaxList(name);
	}

	@Override
	public int selectYZ(String papersNumber) {
		return this.passengerDao.selectYZ(papersNumber);
	}

}
