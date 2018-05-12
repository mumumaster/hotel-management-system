package com.gx.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gx.po.StayRegisterPo;


public interface StayRegisterDao {

	public int deleteById(Integer id);
	
	
	public int insertAll(StayRegisterPo stayRegisterPo);
	
	//精确查询
	public	StayRegisterPo selectById(Integer id);  //请注意查询出的结果可能不是一条，会报错 

	
	public int updateById(StayRegisterPo stayRegisterPo);
	
	//新增住宿明细
	public int insertStayregisterdetails(@Param("stayRegisterID")int stayRegisterID, @Param("passengerID")int passengerID);
	
	//新增押金明细
	public int insertDeposit(StayRegisterPo stayRegisterPo);
	
	//查询押金明细
	public List<StayRegisterPo> selectDepositById(int id);
	
	//新增消费明细
	public int insertConsumptiondetails(StayRegisterPo stayRegisterPo);
	
	
	//消费明细分页
	public List<StayRegisterPo> pageConsumption(@Param("consumptionStayRegisterID")int consumptionStayRegisterID,
			@Param("start")int start,@Param("pageSize")int pageSize);
	
	//消费明细分页总条数
	public int countConsumption(int consumptionStayRegisterID);
	
	//消费明细的删除
	public int deleteConsumption(Integer id);
	
	//修改总费用
	public int updateSumConst(@Param("id")int id,@Param("sumConst")Double sumConst);
	
	//查询用于计算房间加商品消费
	public List<StayRegisterPo> selectMoney(int id);
	
	//换房 修改原信息
	public int updateChangRoom(StayRegisterPo stayRegisterPo);
	
	//换房 查看原信息
	public List<StayRegisterPo> selectChangRoom(int id);
	
	public List<StayRegisterPo> selectAll();
	
	//数据统计
	public List<StayRegisterPo> selectShuJuTongJi(@Param("min")Timestamp min, @Param("max")Timestamp max);
	
	//修改提示
	public int updateRemind(@Param("id")int id,@Param("remind")int remind);
	
	//结账 修改原信息
	public int pay(@Param("id")int id,@Param("remarks")String remarks,
			@Param("payTime")Timestamp payTime,@Param("payWay")int payWay);
	
	//根据 团队id来查询 总费用，
	public List<StayRegisterPo> selectFormTeamId(
			@Param("receiveTargetID")int receiveTargetID,@Param("isBillID")int isBillID);
	
	public List<StayRegisterPo> selectFormTeamIdTwo(int isBillID);
	
    //根据 团队id 来查询 押金
	public List<StayRegisterPo> selectTeamDeposit(int receiveTargetID);
	
	//根据团队id 来查询 旅客消费
	public List<StayRegisterPo> selectTeamConsumption(int receiveTargetID);
	
	// Ajax 根据 团队id 和 房间号来查询
	public List<StayRegisterPo> ajaxSelectTeamRoom(@Param("receiveTargetID")int receiveTargetID,
			@Param("roomNumber")String roomNumber);
	
	// Ajax 根据团队 id 和时间段来查询
	public List<StayRegisterPo> ajaxSelectTeamFormTime(@Param("receiveTargetID")int receiveTargetID,
			@Param("min")Timestamp min, @Param("max")Timestamp max);
	
	//根据 团队id 时间段来查询 押金
	public List<StayRegisterPo> ajaxSelectTeamDeposit(@Param("receiveTargetID")int receiveTargetID,
			@Param("min")Timestamp min, @Param("max")Timestamp max);

	//根据团队id 时间段来查询 旅客消费
	public List<StayRegisterPo> ajaxSelectTeamConsumption(@Param("receiveTargetID")int receiveTargetID,
			@Param("min")Timestamp min, @Param("max")Timestamp max);

	
	//根据 住宿登记id 来查询 押金 精简版 用于 转入团队
	public List<StayRegisterPo> selectDepositJinJianBan(int id);
	
	
	//根据 住宿登记id 来查询 消费 精简版 用于 转入团队
	public List<StayRegisterPo> selectConsumptionJinJianBan(int id);
	
	//根据 住宿登记明细id 来查询 详情信息  详情版 用于 转入团队
	public StayRegisterPo selectInformationXiangQingBan(int id);
	
	//根据 住宿登记id 来 转入团队
	public int changOverTeam(@Param("id")int id,@Param("receiveTargetID")int receiveTargetID);
	
	//根据 住宿登记id 来查询 总费用
	public StayRegisterPo selectSumconst(int id);
	
	
	
	
	
	
	
	//分页模糊查询 one
    public List<StayRegisterPo> pageFuzzyselectOne(@Param("receiveTargeTypeID")int receiveTargeTypeID,
    		@Param("isBillID")int isBillID, @Param("roomNumber")String roomNumber ,	
    		@Param("start")int start,@Param("pageSize")int pageSize);
    
	//分页模糊查询 two
    public List<StayRegisterPo> pageFuzzyselectTwo(@Param("receiveTargetID")int receiveTargetID,
    		@Param("isBillID")int isBillID,	@Param("roomNumber")String roomNumber,
    		@Param("start")int start,@Param("pageSize")int pageSize);
    
    //分页模糊查询总条数one
    public int countFuzzyselectOne( @Param("receiveTargeTypeID")int receiveTargeTypeID,
    		@Param("isBillID")int isBillID,@Param("roomNumber")String roomNumber);
  
    //分页模糊查询总条数two
    public int countFuzzyselectTwo(@Param("receiveTargetID")int receiveTargetID,
    		@Param("isBillID")int isBillID,@Param("roomNumber")String roomNumber);
    
   //分页模糊查询 Three
    public List<StayRegisterPo> pageFuzzyselectThree(
    		@Param("isBillID")int isBillID,	@Param("roomNumber")String roomNumber,
    		@Param("start")int start,@Param("pageSize")int pageSize);
    
    //分页模糊查询总条数Three
    public int countFuzzyselectThree(
    		@Param("isBillID")int isBillID,@Param("roomNumber")String roomNumber);
	
    
    
    
    
    
    
    //修改 预定id
    public int updateStayRegisterPredetermineID(
    		@Param("predetermineID")Integer predetermineID,@Param("id")Integer id);
    
    
    
    
    
/*-------------------------------------FinancialStatistics--------------------------------------------------------*/
    
    
  //分页模糊查询 Four
    public List<StayRegisterPo> pageFuzzyselectFour(
    		@Param("start")int start,@Param("pageSize")int pageSize);
    
  //分页模糊查询总条数Four
    public int countFuzzyselectFour();
    
  //分页模糊查询 Five
    public List<StayRegisterPo> pageFuzzyselectFive(@Param("min")Timestamp min,
    		@Param("max")Timestamp max,	@Param("start")int start,@Param("pageSize")int pageSize);
    
   //分页模糊查询总条数 Five
    public int countFuzzyselectFive(@Param("min")Timestamp min, @Param("max")Timestamp max);
    
    //根据 已结账 来查询 总费用 精简版条件 无条件
    public List<StayRegisterPo> selectPayJingJianBanNot();
    
    //根据 已结账 来查询 住店人数。无条件
    public List<StayRegisterPo> selectPayStayNumberNot();
    
    //根据 已结账 来查询 旅客总消费。无条件
    public List<StayRegisterPo> selectPayXiaoFeiNot();
    
    //根据 已结账 来查询 总费用 精简版条件 结账区段
    public List<StayRegisterPo> selectPayJingJianBan(@Param("min")Timestamp min, @Param("max")Timestamp max);
    
    //根据 已结账 来查询 住店人数。条件 结账区段
    public List<StayRegisterPo> selectPayStayNumber(@Param("min")Timestamp min, @Param("max")Timestamp max);
    
    //根据 已结账 来查询 旅客总消费。条件 结账区段
    public List<StayRegisterPo> selectPayXiaoFei(@Param("min")Timestamp min, @Param("max")Timestamp max);
    
    
    //根据 id 查询 很多很多的信息
    public List<StayRegisterPo> selectAllInformation(int id);
    
    public List<StayRegisterPo> selectXiaoFeiMingXi(int id);
}
