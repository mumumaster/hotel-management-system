package com.gx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gx.dao.PredetermineDao;
import com.gx.page.Page;
import com.gx.po.PredeterminePo;
import com.gx.service.PredetermineService;

@Transactional
@Service(value="predetermineService")
public class PredetermineServiceImpl implements PredetermineService {

	@Autowired
	private PredetermineDao predetermineDao;
	
	@Override
	public int insertAll(PredeterminePo predeterminePo) {
		return predetermineDao.insertAll(predeterminePo);
	}
	@Override
	public Page<PredeterminePo> pageFuzzyselect(String receiveTeamName,
			String passengerName, int predetermineStateID,
			Page<PredeterminePo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<PredeterminePo> list=predetermineDao.pageFuzzyselect(receiveTeamName,
				passengerName, predetermineStateID, start, vo.getPageSize());
		vo.setResult(list);
		int count=predetermineDao.countFuzzyselect(receiveTeamName, passengerName, predetermineStateID);
		vo.setTotal(count);
		return vo;
	}
	@Override
	public PredeterminePo findById(Integer id) {
		return this.predetermineDao.findById(id);
	}
	@Override
	public List<PredeterminePo> findLvKeId(Integer id) {
		return this.predetermineDao.findLvKeId(id);
	}
	@Override
	public List<PredeterminePo> findTeamId(Integer id) {
		return this.predetermineDao.findTeamId(id);
	}
	@Override
	public int deleteById(Integer id) {
		return this.predetermineDao.deleteById(id);
	}
	@Override
	public List<PredeterminePo> selectAll() {
		return this.predetermineDao.selectAll();
	}
	@Override
	public int updateRemind(Integer id) {
		return this.predetermineDao.updateRemind(id);
	}
	@Override
	public int updatePredetermineStateID(Integer id) {
		return this.predetermineDao.updatePredetermineStateID(id);
	}

}
