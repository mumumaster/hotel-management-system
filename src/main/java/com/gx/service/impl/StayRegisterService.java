package com.gx.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gx.dao.StayRegisterDao;
import com.gx.page.Page;
import com.gx.po.StayRegisterPo;

@Transactional
@Service(value="stayRegisterService")
public class StayRegisterService implements com.gx.service.StayRegisterService {

	@Autowired
	private StayRegisterDao stayRegisterDao;
	
	@Override
	public int insertAll(StayRegisterPo stayRegisterPo) {
		return stayRegisterDao.insertAll(stayRegisterPo);
	}

	@Override
	public Page<StayRegisterPo> pageFuzzyselectOne(int receiveTargeTypeID, 
			int isBillID,String roomNumber,Page<StayRegisterPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<StayRegisterPo> list=stayRegisterDao.pageFuzzyselectOne(receiveTargeTypeID, isBillID, roomNumber,start, vo.getPageSize());
		vo.setResult(list);
		int count=stayRegisterDao.countFuzzyselectOne(receiveTargeTypeID, isBillID,roomNumber);
		vo.setTotal(count);
		return vo;
	}

	@Override
	public StayRegisterPo selectById(Integer id) {
		return this.stayRegisterDao.selectById(id);
	}

	@Override
	public int insertStayregisterdetails(int stayRegisterID, int passengerID) {
		return stayRegisterDao.insertStayregisterdetails(stayRegisterID, passengerID);
	}

	@Override
	public int insertDeposit(StayRegisterPo stayRegisterPo) {
		return stayRegisterDao.insertDeposit(stayRegisterPo);
	}

	@Override
	public List<StayRegisterPo> selectDepositById(int id) {
		return stayRegisterDao.selectDepositById(id);
	}

	@Override
	public int insertConsumptiondetails(StayRegisterPo stayRegisterPo) {
		return stayRegisterDao.insertConsumptiondetails(stayRegisterPo);
	}

	@Override
	public Page<StayRegisterPo> pageConsumption(int consumptionStayRegisterID,Page<StayRegisterPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<StayRegisterPo> list=stayRegisterDao.pageConsumption(consumptionStayRegisterID, start, vo.getPageSize());
		vo.setResult(list);
		int count=stayRegisterDao.countConsumption(consumptionStayRegisterID);
		vo.setTotal(count);
		return vo;
	}

	@Override
	public int deleteConsumption(Integer id) {
		return stayRegisterDao.deleteConsumption(id);
	}

	@Override
	public int updateSumConst(int id, Double sumConst) {
		return stayRegisterDao.updateSumConst(id, sumConst);
	}

	@Override
	public List<StayRegisterPo> selectMoney(int id) {
		return stayRegisterDao.selectMoney(id);
	}

	@Override
	public List<StayRegisterPo> selectChangRoom(int id) {
		return stayRegisterDao.selectChangRoom(id);
	}

	@Override
	public List<StayRegisterPo> selectAll() {
		return stayRegisterDao.selectAll();
	}

	@Override
	public int updateRemind(int id, int remind) {
		return stayRegisterDao.updateRemind(id, remind);
	}

	@Override
	public int updateChangRoom(StayRegisterPo stayRegisterPo) {
		return stayRegisterDao.updateChangRoom(stayRegisterPo);
	}

	@Override
	public int pay(int id, String remarks, Timestamp payTime, int payWay) {
		return stayRegisterDao.pay(id, remarks, payTime, payWay);
	}

	@Override
	public Page<StayRegisterPo> pageFuzzyselectTwo(int receiveTargetID,
			int isBillID, String roomNumber, Page<StayRegisterPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<StayRegisterPo> list=stayRegisterDao.pageFuzzyselectTwo(receiveTargetID, isBillID, roomNumber,start, vo.getPageSize());
		vo.setResult(list);
		int count=stayRegisterDao.countFuzzyselectTwo(receiveTargetID, isBillID, roomNumber);
		vo.setTotal(count);
		return vo;
	}

	@Override
	public List<StayRegisterPo> selectFormTeamId(int receiveTargetID,
			int isBillID) {
		return this.stayRegisterDao.selectFormTeamId(receiveTargetID, isBillID);
	}

	@Override
	public List<StayRegisterPo> selectTeamDeposit(int receiveTargetID) {
		return this.stayRegisterDao.selectTeamDeposit(receiveTargetID);
	}

	@Override
	public List<StayRegisterPo> selectTeamConsumption(int receiveTargetID) {
		return this.stayRegisterDao.selectTeamConsumption(receiveTargetID);
	}

	@Override
	public List<StayRegisterPo> ajaxSelectTeamRoom(int receiveTargetID,
			String roomNumber) {
		return this.stayRegisterDao.ajaxSelectTeamRoom(receiveTargetID, roomNumber);
	}

	@Override
	public List<StayRegisterPo> ajaxSelectTeamFormTime(int receiveTargetID,
			Timestamp min, Timestamp max) {
		return this.stayRegisterDao.ajaxSelectTeamFormTime(receiveTargetID, min, max);
	}

	@Override
	public List<StayRegisterPo> ajaxSelectTeamDeposit(int receiveTargetID,
			Timestamp min, Timestamp max) {
		return this.stayRegisterDao.ajaxSelectTeamDeposit(receiveTargetID, min, max);
	}

	@Override
	public List<StayRegisterPo> ajaxSelectTeamConsumption(int receiveTargetID,
			Timestamp min, Timestamp max) {
		return this.stayRegisterDao.ajaxSelectTeamConsumption(receiveTargetID, min, max);
	}

	@Override
	public List<StayRegisterPo> selectDepositJinJianBan(int id) {
		return this.stayRegisterDao.selectDepositJinJianBan(id);
	}

	@Override
	public List<StayRegisterPo> selectConsumptionJinJianBan(int id) {
		return this.stayRegisterDao.selectConsumptionJinJianBan(id);
	}

	@Override
	public StayRegisterPo selectInformationXiangQingBan(int id) {
		return this.stayRegisterDao.selectInformationXiangQingBan(id);
	}

	@Override
	public int changOverTeam(int id, int receiveTargetID) {
		return this.stayRegisterDao.changOverTeam(id, receiveTargetID);
	}

	@Override
	public List<StayRegisterPo> selectFormTeamIdTwo(int isBillID) {
		return this.stayRegisterDao.selectFormTeamIdTwo(isBillID);
	}

	@Override
	public Page<StayRegisterPo> pageFuzzyselectThree(int isBillID,
			String roomNumber, Page<StayRegisterPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<StayRegisterPo> list=stayRegisterDao.pageFuzzyselectThree(isBillID, roomNumber,start, vo.getPageSize());
		vo.setResult(list);
		int count=stayRegisterDao.countFuzzyselectThree(isBillID, roomNumber);
		vo.setTotal(count);
		return vo;
	}


	@Override
	public List<StayRegisterPo> selectShuJuTongJi(Timestamp min, Timestamp max) {
		return this.stayRegisterDao.selectShuJuTongJi(min, max);
	}
	
	
	
	
	
	
	
	
	
	
/*-------------------------------------FinancialStatistics--------------------------------------------------------*/

	@Override
	public Page<StayRegisterPo> pageFuzzyselectFour(Page<StayRegisterPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<StayRegisterPo> list=stayRegisterDao.pageFuzzyselectFour(start, vo.getPageSize());
		vo.setResult(list);
		int count=stayRegisterDao.countFuzzyselectFour();
		vo.setTotal(count);
		return vo;
	}

	@Override
	public Page<StayRegisterPo> pageFuzzyselectFive(Timestamp min,
			Timestamp max, Page<StayRegisterPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<StayRegisterPo> list=stayRegisterDao.pageFuzzyselectFive(min, max,start, vo.getPageSize());
		vo.setResult(list);
		int count=stayRegisterDao.countFuzzyselectFive(min, max);
		vo.setTotal(count);
		return vo;
	}

	@Override
	public List<StayRegisterPo> selectPayJingJianBanNot() {
		return this.stayRegisterDao.selectPayJingJianBanNot();
	}

	@Override
	public List<StayRegisterPo> selectPayStayNumberNot() {
		return this.stayRegisterDao.selectPayStayNumberNot();
	}

	@Override
	public List<StayRegisterPo> selectPayXiaoFeiNot() {
		return this.stayRegisterDao.selectPayXiaoFeiNot();
	}

	@Override
	public List<StayRegisterPo> selectPayJingJianBan(Timestamp min,
			Timestamp max) {
		return this.stayRegisterDao.selectPayJingJianBan(min, max);
	}

	@Override
	public List<StayRegisterPo> selectPayStayNumber(Timestamp min, Timestamp max) {
		return this.stayRegisterDao.selectPayStayNumber(min, max);
	}

	@Override
	public List<StayRegisterPo> selectPayXiaoFei(Timestamp min, Timestamp max) {
		return this.stayRegisterDao.selectPayXiaoFei(min, max);
	}

	@Override
	public List<StayRegisterPo> selectAllInformation(int id) {
		return this.stayRegisterDao.selectAllInformation(id);
	}

	@Override
	public List<StayRegisterPo> selectXiaoFeiMingXi(int id) {
		return this.stayRegisterDao.selectXiaoFeiMingXi(id);
	}

	@Override
	public int updateStayRegisterPredetermineID(Integer predetermineID,
			Integer id) {
		return this.stayRegisterDao.updateStayRegisterPredetermineID(predetermineID, id);
	}

	@Override
	public StayRegisterPo selectSumconst(int id) {
		return this.stayRegisterDao.selectSumconst(id);
	}



	

	

}
