package com.gx.web;

import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.omg.PortableServer.POA;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.gx.page.Page;
import com.gx.po.AttributePo;
import com.gx.po.CommodityPo;
import com.gx.po.PassengerPo;
import com.gx.po.ReceiveTargetPo;
import com.gx.po.RoomSetPo;
import com.gx.po.StayRegisterPo;
import com.gx.service.AttributeService;
import com.gx.service.CommodityService;
import com.gx.service.PassengerService;
import com.gx.service.ReceiveTargetService;
import com.gx.service.RoomSetService;
import com.gx.service.StayRegisterService;
import com.gx.vo.TeamPayVo;

@Controller
@RequestMapping("/StayRegister")
public class StayRegister {
	
	@Autowired
	private AttributeService attributeService;
	
	@Autowired
	private RoomSetService roomSetService;
	
	@Autowired
	private StayRegisterService stayRegisterService;
	
	@Autowired
	private PassengerService passengerService;
	
	@Autowired
	private CommodityService commodityService;
	
	@Autowired
	private ReceiveTargetService receiveTargetService;
	
	int fangjianId=0;
	String lvkeName="";
	double zhuDianTianShu=0;                      //住店天数
    double shengZhuDianTianShu=0;                 //剩住店天数
	double zhuDianTianShuOne=0;                   //住店天数
    
	//散客的list查询
	@RequestMapping("/tolist")
	public ModelAndView tolist(HttpServletRequest request, Integer currentPage,
			String txtname,Integer LvKeLeiXingId,Integer isBillID){
		ModelAndView mv=null;
		
		List<StayRegisterPo> listAll=stayRegisterService.selectAll();
		Date date=new Date();
		DateFormat dformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //设置日期格式
		Timestamp timestamp=Timestamp.valueOf(dformat.format(date)) ;  //将当前时间转为字符串
		
		int id=0;
		long xiangChaTianShu;
		long days;
		long hours;
		String zhuSu="";
		for (int i = 0; i < listAll.size(); i++) {
			id=listAll.get(i).getId();                                                            //获取ID
			Timestamp registerTime=listAll.get(i).getRegisterTime();                              //获取登记时间
			zhuSu=listAll.get(i).getStayNumber();                                                 //获取登记时间
			
			xiangChaTianShu=timestamp.getTime()-registerTime.getTime();                           //当前时间-登记时间
			days=xiangChaTianShu/(1000 * 60 * 60 * 24);                                           //转化为天
			hours=xiangChaTianShu/(1000 * 60 * 60 )-days*24;                                              //转化为小时
			
			if (Long.parseLong(zhuSu)<=days) {
				if (hours>0) {
					stayRegisterService.updateRemind(id, 1);
				}
			}
		}
		
		List<AttributePo> listOne=attributeService.selectIsPay();
		mv=new ModelAndView("/stayregister/list");
		if (isBillID==null) {
			isBillID=68;
		}
		if (LvKeLeiXingId==null) {
			LvKeLeiXingId=55;
		}
		if (currentPage==null) {
			currentPage=1;
		}else if (currentPage==0) {
			currentPage=1;
		}
		
		Page<StayRegisterPo> vo=new Page<StayRegisterPo>();
		vo.setCurrentPage(currentPage);
		
		if(txtname==null)
		{
			txtname="";
		}
		vo=this.stayRegisterService.pageFuzzyselectOne(LvKeLeiXingId, isBillID, txtname, vo);
		mv.addObject("list",vo);
		mv.addObject("listOne",listOne);
		mv.addObject("LvKeLeiXingId",LvKeLeiXingId);
		mv.addObject("isBillID",isBillID);
		mv.addObject("txtname",txtname);
		return mv;
	}
	
	
	//团队的list查询
	@RequestMapping("/toteamlist")
	public ModelAndView toteamlist(HttpServletRequest request, Integer currentPage,
			String txtname,Integer LvKeLeiXingId,Integer isBillID,Integer tuanDuiID,
			String teamNameId, String teamCodeId, String principalId,
			String contactPhoneNUmberId, String registerTimeId){
		ModelAndView mv=null;
		List<StayRegisterPo> listTeam=null;
		List<StayRegisterPo> listAll=stayRegisterService.selectAll();
		Date date=new Date();
		DateFormat dformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //设置日期格式
		Timestamp timestamp=Timestamp.valueOf(dformat.format(date)) ;  //将当前时间转为字符串
		
		int id=0;
		long xiangChaTianShu;
		long days;
		long hours;
		String zhuSu="";
		double teamSumConst=0;
		for (int i = 0; i < listAll.size(); i++) {
			id=listAll.get(i).getId();                                                            //获取ID
			Timestamp registerTime=listAll.get(i).getRegisterTime();                              //获取登记时间
			zhuSu=listAll.get(i).getStayNumber();                                                 //获取登记时间
			
			xiangChaTianShu=timestamp.getTime()-registerTime.getTime();                           //当前时间-登记时间
			days=xiangChaTianShu/(1000 * 60 * 60 * 24);                                           //转化为天
			hours=xiangChaTianShu/(1000 * 60 * 60 )-days*24;                                              //转化为小时
			
			if (Long.parseLong(zhuSu)<=days) {
				if (hours>0) {
					stayRegisterService.updateRemind(id, 1);
				}
			}
		}
		List<AttributePo> listOne=attributeService.selectIsPay();
		mv=new ModelAndView("/stayregister/list");
		if (isBillID==null) {
			isBillID=68;
		}
		if (LvKeLeiXingId==null) {
			LvKeLeiXingId=56;
		}
		if (tuanDuiID==null) {
			listTeam=this.stayRegisterService.selectFormTeamIdTwo(isBillID);
		}else {
			listTeam=this.stayRegisterService.selectFormTeamId(tuanDuiID, isBillID);
		}
		if (currentPage==null) {
			currentPage=1;
		}else if (currentPage==0) {
			currentPage=1;
		}
		
		for (int i = 0; i < listTeam.size(); i++) {
			teamSumConst+=listTeam.get(i).getSumConst();
		}

		Page<StayRegisterPo> vo=new Page<StayRegisterPo>();
		vo.setCurrentPage(currentPage);
		
		if(txtname==null)
		{
			txtname="";
		}
		if (tuanDuiID==null) {
			vo=this.stayRegisterService.pageFuzzyselectThree(isBillID, txtname, vo);
		}else {
			vo=this.stayRegisterService.pageFuzzyselectTwo(tuanDuiID, isBillID, txtname, vo);
		}
		mv.addObject("list",vo);
		mv.addObject("listOne",listOne);
		mv.addObject("LvKeLeiXingId",LvKeLeiXingId);
		mv.addObject("isBillID",isBillID);
		mv.addObject("txtname",txtname);
		mv.addObject("tuanDui",tuanDuiID);
		mv.addObject("teamNameId",teamNameId);
		mv.addObject("teamCodeId",teamCodeId);
		mv.addObject("principalId",principalId);
		mv.addObject("contactPhoneNUmberId",contactPhoneNUmberId);
		mv.addObject("registerTimeId",registerTimeId);
		mv.addObject("teamSumConst",teamSumConst);
		return mv;
	}
	
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/ajaxSelectTeamSumcont")
	public Object ajaxSelectTeamSumcont(Integer tuanDuiID, Integer isBillID){
		double teamSumConst=0;
		List<StayRegisterPo> listTeam=this.stayRegisterService.selectFormTeamId(tuanDuiID, isBillID);
		for (int i = 0; i < listTeam.size(); i++) {
			teamSumConst+=listTeam.get(i).getSumConst();
		}
       Gson gson=new Gson();
       return gson.toJson(teamSumConst);
	}
	
	
	
	@RequestMapping("/toadd")
	public ModelAndView toadd(){
		ModelAndView mv=null;
		mv=new ModelAndView("/stayregister/add");
		return mv;
	}

	
	
/*--------------------------------------- 登记 start------------------------------------------------------------------*/	
	
	//登记
	@RequestMapping("/toregister")
	public ModelAndView toregister(int id,String roomNumber,Integer LvKeLeiXingId){
		ModelAndView mv=null;
		List<AttributePo> listGender=attributeService.selectGender();                      //性别
		List<AttributePo> listNation=attributeService.selectNation();                      //民族
		List<AttributePo> listPassengerLevel=attributeService.selectPassengerLevel();      //旅客级别
		List<AttributePo> listEducationDegree=attributeService.selectEducationDegree();    //文化程度
		List<AttributePo> listPapers=attributeService.selectPapers();                      //证件类型
		List<AttributePo> listThingReason=attributeService.selectThingReason();            //事由
		mv=new ModelAndView("/stayregister/register");
		mv.addObject("roomNumber",roomNumber);
		mv.addObject("stayRegisterId",id);
		mv.addObject("listGender",listGender);
		mv.addObject("listNation",listNation);
		mv.addObject("listPassengerLevel",listPassengerLevel);
		mv.addObject("listEducationDegree",listEducationDegree);
		mv.addObject("listPapers",listPapers);
		mv.addObject("listThingReason",listThingReason);
		mv.addObject("LvKeLeiXingId",LvKeLeiXingId);
		return mv;
	}
	
	
	@RequestMapping("/register")
	public ModelAndView register(PassengerPo passengerPo,Integer LvKeLeiXingId){
		Integer lvkeid=passengerPo.getLvKeID();
		if (lvkeid==null) {
			passengerService.insertAll(passengerPo);
			lvkeid=passengerPo.getId();
		}else {
			passengerPo.setId(passengerPo.getStayRegisterID());
			passengerService.updateById(passengerPo);
		}
		stayRegisterService.insertStayregisterdetails(passengerPo.getStayRegisterID(), lvkeid);
		ModelAndView mv=null;
		mv=new ModelAndView("redirect:/StayRegister/tolist.do?LvKeLeiXingId="+LvKeLeiXingId);
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/selectPassenger")
	public Object selectPassenger(String txtname){
		if(txtname==null){
			txtname="";
		}
		List<PassengerPo> list=passengerService.selectAjaxList(txtname);
       Gson gson=new Gson();
       return gson.toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="/confirmPassenger")
	public Object confirmPassenger(Integer id){
	  PassengerPo list=passengerService.selectById(id);
       Gson gson=new Gson();
       return gson.toJson(list);
	}
/*--------------------------------------- 登记  end ------------------------------------------------------------------*/		
	
	
	
	
	
	
	
/*--------------------------------------- 安排房间 start------------------------------------------------------------------*/	
	
	//安排房间
	@RequestMapping("/toarrangeroom")
	public ModelAndView toarrangeroom(Integer tuanDuiID,Integer LvKeLeiXingId){
		ModelAndView mv=null;
		List<RoomSetPo> list=roomSetService.selectAll();
		List<AttributePo> listPassengerType=attributeService.selectPassengerType();     //旅客类别
		List<AttributePo> listBillUnit=attributeService.selectBillUnit();              //结账单位
		List<AttributePo> listPayWay=attributeService.selectPayWay();                 //结账方式
		List<AttributePo> listRentOutType=attributeService.selectRentOutType();      //出租方式
		mv=new ModelAndView("/stayregister/arrangeroom");
		mv.addObject("listPassengerType",listPassengerType);
		mv.addObject("listBillUnit",listBillUnit);
		mv.addObject("listPayWay",listPayWay);
		mv.addObject("listRentOutType",listRentOutType);
		mv.addObject("list",list);
		mv.addObject("tuanDuiID",tuanDuiID);
		mv.addObject("LvKeLeiXingId",LvKeLeiXingId);
		return mv;
	}
	
	
	@RequestMapping("/arrangeroom")
	public ModelAndView arrangeroom(StayRegisterPo stayRegisterPo,Integer LvKeLeiXingId){
		ModelAndView mv=null;
		stayRegisterPo.setIsBillID(68);
		if (stayRegisterPo.getReceiveTargetID()==null) {
			stayRegisterPo.setReceiveTargetID(2);
		}
		
		int fangJianId=stayRegisterPo.getRoomID();
		RoomSetPo roomSetPo=roomSetService.selectById(fangJianId);                      //根据 房间ID 查询出唯一的数据
		int chuZuFangShiId=stayRegisterPo.getRentOutTypeID();                           //获取 出租方式
		int tianShuOrZhongDian=Integer.parseInt(stayRegisterPo.getStayNumber());       //获取 住店天数/小时
		if(chuZuFangShiId==26){
			double fagnJia=roomSetPo.getStandardPriceDay();                          //获取房价/天
			double sumConst=fagnJia*(tianShuOrZhongDian);                            //房价乘以天数得总费
			stayRegisterPo.setSumConst(sumConst);
		}else if(chuZuFangShiId==25){
			double fagnJia=roomSetPo.getStandardPrice();                                //获取房价/小时
			int zuiDaShiChang=Integer.parseInt(roomSetPo.getMaxDuration());              //获取最大时长
			int shouDuanShiChang=Integer.parseInt(roomSetPo.getFirstDuration());         //获取首段时长
			double shouDuanJiGe=roomSetPo.getFirstPrice();                              //获取首段价格
			if (shouDuanShiChang >= tianShuOrZhongDian) { 
				double sumConst=shouDuanJiGe;                                           //首时段时长大于 他输入的钟点数 
				stayRegisterPo.setSumConst(sumConst);                                    //那么按 首段价格计算
			}else if (shouDuanShiChang <= tianShuOrZhongDian && tianShuOrZhongDian <= zuiDaShiChang) {
				int xiaoShi=tianShuOrZhongDian-shouDuanShiChang;                 //如果输入的钟点数 在 最大时长的范围之内
				double sumConst= shouDuanJiGe+xiaoShi*fagnJia;                   // 且大于等于首段时长 ，那么 计算出
				stayRegisterPo.setSumConst(sumConst);                            // 首段价格 加上 钟点数乘以 多出的每小时价格
			}else if(tianShuOrZhongDian>zuiDaShiChang){
				stayRegisterPo.setSumConst(roomSetPo.getStandardPriceDay()); //假如 输入的钟点数大于最大时长那么 按一天的价格计算
			}
		}
		stayRegisterService.insertAll(stayRegisterPo);
		int id=stayRegisterPo.getId();
		stayRegisterPo.setDepositStayRegisterID(id);
		stayRegisterPo.setDepositRegisterTime(stayRegisterPo.getRegisterTime());
		stayRegisterService.insertDeposit(stayRegisterPo);
		RoomSetPo roomSetPoToRoomState=new RoomSetPo();
		roomSetPoToRoomState.setId(fangJianId);                      //给新的 Po 赋房间ID的值
		roomSetPoToRoomState.setRoomStateID(65);                     //给新的 Po 赋房态的值
		roomSetService.updateByIdToRoomState(roomSetPoToRoomState);  //根据 房间ID 来修改 当前被选中的房间的房态
		mv=new ModelAndView("redirect:/StayRegister/tolist.do?LvKeLeiXingId="+LvKeLeiXingId);
		return mv;
	}
	
	
/*--------------------------------------- 安排房间  end ------------------------------------------------------------------*/	
	
	
	
	
	
	
	
/*--------------------------------------- 换房 start------------------------------------------------------------------*/	
	
	//换房
	@RequestMapping("/tochangroom")
	public ModelAndView tochangroom(Integer id,String lvKeName,Integer LvKeLeiXingId){
		ModelAndView mv=null;
		fangjianId=id;
		lvkeName=lvKeName;
		
		Date date=new Date();
		DateFormat dformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //设置日期格式
		Timestamp timestamp=Timestamp.valueOf(dformat.format(date)) ;  //将当前时间转为字符串
		
		long xiangChaTianShu;                       //相差时间：毫秒
		long days=0;                                  //相差天数
		long hours=0;                                 //相差小时
		long daysOne=0;
		long hourOne=0;
		String zhuSu="";                            //住宿天数或小时
		Timestamp registerTime;                     //登记时间
		double yaJin=0;             				//押金
		double shangPinXiaoFei=0;   				//商品消费
		double zhuSuFei=0;        				    //住宿费
		double fangJia=0;         				    //房价
		int chuZuFangShi=0;      				    //出租方式
		String huanFangShiJian;                     //换房时间
		List<StayRegisterPo> list=stayRegisterService.selectChangRoom(id);
		List<StayRegisterPo> listSource=stayRegisterService.selectMoney(id);
		registerTime=list.get(0).getRegisterTime();                                    //获取登记时间
		zhuSu=list.get(0).getStayNumber();                                             //获取住宿天数或小时
		fangJia=list.get(0).getRoomStandardPriceDay();                                 //获取房价/天
		chuZuFangShi=list.get(0).getRentOutTypeID();                                   //获取出租方式
		huanFangShiJian=String.valueOf(list.get(0).getChangRoomTime());                //获取换房时间
		if (huanFangShiJian=="" || huanFangShiJian=="null") {
			xiangChaTianShu=timestamp.getTime()-registerTime.getTime();                    //当前时间-登记时间
			days=xiangChaTianShu/(1000 * 60 * 60 * 24);                                    //转化为天
			hours=xiangChaTianShu/(1000 * 60 * 60 )-days*24;                               //转化为24小时之内
			if(chuZuFangShi==26){
				if(hours<6){
					zhuSuFei=days*fangJia;
					zhuDianTianShu=days;
				}
				if (hours>=6 & hours<=15) {
					zhuSuFei=days*fangJia+(0.5*fangJia);
					zhuDianTianShu=days+0.5;
				}else if(hours>15){
					zhuSuFei=(days+1)*fangJia;
					zhuDianTianShu=days+1;
				}
			}else if(chuZuFangShi==25){
				
			}
			shengZhuDianTianShu=Integer.parseInt(zhuSu)-zhuDianTianShu;
		}else {
			xiangChaTianShu=timestamp.getTime()-registerTime.getTime();                    //当前时间-登记时间
			days=xiangChaTianShu/(1000 * 60 * 60 * 24);                                    //转化为天
			hours=xiangChaTianShu/(1000 * 60 * 60 )-days*24;                               //转化为24小时之内
			
			xiangChaTianShu=timestamp.getTime()-Timestamp.valueOf(huanFangShiJian).getTime();//当前时间-上一次换房时间
			daysOne=xiangChaTianShu/(1000 * 60 * 60 * 24);                          //转化为天
			hourOne=xiangChaTianShu/(1000 * 60 * 60 )-days*24;                      //转化为24小时之内
			if(chuZuFangShi==26){
				if(hourOne<6){
					zhuSuFei=daysOne*fangJia;
					zhuDianTianShuOne=daysOne;
				}
				if (hourOne>=6 & hourOne<=15) {
					zhuSuFei=daysOne*fangJia+(0.5*fangJia);
					zhuDianTianShuOne=daysOne+0.5;
				}else if(hourOne>15){
					zhuSuFei=(daysOne+1)*fangJia;
					zhuDianTianShuOne=daysOne+1;
				}
				if(hours<6){
					zhuDianTianShu=days;
				}
				if (hours>=6 & hours<=15) {
					zhuDianTianShu=days+0.5;
				}else if(hours>15){
					zhuDianTianShu=days+1;
				}
			}else if(chuZuFangShi==25){
				
			}
			shengZhuDianTianShu=Integer.parseInt(zhuSu)-zhuDianTianShuOne-zhuDianTianShu;
		}
		
		for (int i = 0; i < list.size(); i++) {
			yaJin+=list.get(i).getDeposit();
		}
		for (int i = 0; i < listSource.size(); i++) {
			shangPinXiaoFei+=listSource.get(i).getConsumptionMoney();
		}
		
		mv=new ModelAndView("/stayregister/changroom");
		mv.addObject("lvKeName",lvKeName);
		mv.addObject("list",list);
		mv.addObject("yaJin",yaJin);
		mv.addObject("shangPinXiaoFei",shangPinXiaoFei);
		mv.addObject("zhuSuFei",zhuSuFei);
		mv.addObject("stayId",id);
		mv.addObject("zhuDianTianShu",zhuDianTianShu);
		mv.addObject("timestamp",timestamp);
		mv.addObject("LvKeLeiXingId",LvKeLeiXingId);
		return mv;
	}
	
	
	@RequestMapping("/confirmChangRoom")
	public ModelAndView confirmChangRoom(Integer id, Integer roomId, Double changRoomMoney, 
			Timestamp changRoomTime,Integer LvKeLeiXingId){
		ModelAndView mv=null;
		int chuZuFangShi=0;      				    //出租方式
		String huanFangCiShu="";                    //换房次数
		double fangJiaDay=0;                          //房价/天
		double fangJiaHour=0;                         //房价/小时
		double zongFeiYong=0;                         //总费用
		int zhuDianShiJian;                         //住店时间
		int jiuFangJianId=0;                        //旧房间id
		double JiuHuanFanFei;                       //旧换房费
		double shangPinXiaoFei=0;                   //商品消费
        int zuiDaShiChang=0;                        //新最大时长限制
        int shouDuanShiChang=0;                     //新首段时长
        double shouDuanJiaGe=0;                     //新首段价格
		List<StayRegisterPo> list=stayRegisterService.selectChangRoom(id);
		RoomSetPo roomSetPo=roomSetService.selectById(roomId);
		List<StayRegisterPo> listShangPin=stayRegisterService.selectMoney(id);
		chuZuFangShi=list.get(0).getRentOutTypeID();                                   //获取出租方式
		zhuDianShiJian=Integer.parseInt(list.get(0).getStayNumber());                  //获取住店时间
		huanFangCiShu=list.get(0).getChangingRoomNumber();                             //获取换房次数
		jiuFangJianId=list.get(0).getRoomID();                                         //获取旧房间id
		JiuHuanFanFei=list.get(0).getChangRoomMoney();                                 //获取旧换房费
		
		fangJiaDay=roomSetPo.getStandardPriceDay();                                    //获取新房价/天
		fangJiaHour=roomSetPo.getStandardPrice();                                      //获取新房价/小时
		zuiDaShiChang=Integer.parseInt(roomSetPo.getMaxDuration());                    //获取新最大时长
		shouDuanShiChang=Integer.parseInt(roomSetPo.getFirstDuration());               //获取新首段时长
		shouDuanJiaGe=roomSetPo.getFirstPrice();                                       //获取新首段价格
		for (int i = 0; i < listShangPin.size(); i++) {
			shangPinXiaoFei+=listShangPin.get(i).getConsumptionMoney();
		}
		if (chuZuFangShi==26) {
			zongFeiYong=JiuHuanFanFei+changRoomMoney+shangPinXiaoFei+shengZhuDianTianShu*fangJiaDay;
		}else if(chuZuFangShi==25){
			if (shouDuanShiChang>zhuDianShiJian) {
				zongFeiYong=JiuHuanFanFei+changRoomMoney+shangPinXiaoFei+shouDuanJiaGe;
			}else if(zhuDianShiJian>=shouDuanShiChang & zhuDianShiJian<=zuiDaShiChang){
				double jiSuan=(zhuDianShiJian-shouDuanShiChang)*fangJiaHour;
				zongFeiYong=JiuHuanFanFei+changRoomMoney+shangPinXiaoFei+shouDuanJiaGe+jiSuan;
			}else {
				zongFeiYong=JiuHuanFanFei+changRoomMoney+shangPinXiaoFei+fangJiaDay;
			}
		}
		if (huanFangCiShu==null || huanFangCiShu=="") {
			huanFangCiShu="1";
		}else{
			huanFangCiShu=String.valueOf(Integer.parseInt(huanFangCiShu)+1);
		}
		StayRegisterPo stayRegisterPo=new StayRegisterPo();
		RoomSetPo roomOne=new RoomSetPo();
		RoomSetPo roomTwo=new RoomSetPo();
		stayRegisterPo.setId(id);
		stayRegisterPo.setRoomID(roomId);
		stayRegisterPo.setSumConst(zongFeiYong);
		stayRegisterPo.setChangingRoomNumber(huanFangCiShu);
		stayRegisterPo.setChangRoomMoney(changRoomMoney+JiuHuanFanFei);
		stayRegisterPo.setChangRoomTime(changRoomTime);
		roomOne.setId(jiuFangJianId);
		roomOne.setRoomStateID(1);
		roomTwo.setId(roomId);
		roomTwo.setRoomStateID(65);
		
		roomSetService.updateByIdToRoomState(roomOne);
		roomSetService.updateByIdToRoomState(roomTwo);
		stayRegisterService.updateChangRoom(stayRegisterPo);
		
		mv=new ModelAndView("redirect:/StayRegister/tolist.do?LvKeLeiXingId="+LvKeLeiXingId);
		return mv;
	}
		
	@ResponseBody
	@RequestMapping(value="/changRoomSelectPassenger")
	public Object changRoomSelectPassenger(String roomNumber){
	   if(roomNumber==null){
		   roomNumber="";
	   }
	   List<RoomSetPo> list=roomSetService.selectInformation(roomNumber);
       Gson gson=new Gson();
       return gson.toJson(list);
	}
	
/*--------------------------------------- 换房  end ------------------------------------------------------------------*/		
	
	
	
	
	
	
	
/*--------------------------------------- 押金 start------------------------------------------------------------------*/	
	
	
	@RequestMapping("/todeposit")
	public ModelAndView todeposit(Integer id,String lvKeName,Integer LvKeLeiXingId){
		ModelAndView mv=null;
		fangjianId=id;
		lvkeName=lvKeName;
		List<StayRegisterPo> list=stayRegisterService.selectDepositById(id);
		List<AttributePo> list2=attributeService.selectPayWay();
		mv=new ModelAndView("/stayregister/deposit");
		mv.addObject("list",list);
		mv.addObject("listTwo",list2);
		mv.addObject("lvKeName",lvKeName);
		mv.addObject("stayId",id);
		mv.addObject("LvKeLeiXingId",LvKeLeiXingId);
		return mv;
	}
	
	@RequestMapping("/deposit")
	public ModelAndView deposit(StayRegisterPo stayRegisterPo,Integer LvKeLeiXingId){
		ModelAndView mv=null;
		Date date=new Date();
		DateFormat dformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //设置日期格式
		Timestamp timestamp=Timestamp.valueOf(dformat.format(date)) ;  //将当前时间转为字符串
		stayRegisterPo.setDepositRegisterTime(timestamp);
		mv=new ModelAndView("redirect:/StayRegister/todeposit.do?id="+fangjianId);
        mv.addObject("lvKeName", lvkeName);
        mv.addObject("LvKeLeiXingId",LvKeLeiXingId);
		stayRegisterService.insertDeposit(stayRegisterPo);		
		return mv;
	}
	
/*--------------------------------------- 押金  end ------------------------------------------------------------------*/	

	
	
	

	
/*--------------------------------------- 消费明细 start------------------------------------------------------------------*/	
	
	@RequestMapping("/toconsumption")
	public ModelAndView toconsumption(Integer id,String lvKeName,Integer currentPage,
			Integer LvKeLeiXingId,Integer isBillID){
		ModelAndView mv=null;
		fangjianId=id;
		lvkeName=lvKeName;
		Page<StayRegisterPo> vo=new Page<StayRegisterPo>();
		if (currentPage==null) {
			currentPage=1;
		}else if (currentPage==0) {
			currentPage=1;
		}
		vo.setCurrentPage(currentPage);
		List<AttributePo> listOne=attributeService.selectCommodityType();
		vo=this.stayRegisterService.pageConsumption(id, vo);
		mv=new ModelAndView("/stayregister/consumption");
		mv.addObject("listOne",listOne);
		mv.addObject("stayId",id);
		mv.addObject("lvKeName",lvKeName);
		mv.addObject("list",vo);
		mv.addObject("LvKeLeiXingId",LvKeLeiXingId);
		mv.addObject("isBillID",isBillID);
		return mv;
	}
	
	//新增
	@RequestMapping("/consumption")
	public ModelAndView consumption(String id,String Number,
			int consumptionStayRegisterID,Integer LvKeLeiXingId){
		ModelAndView mv=null;
	    Date date=new Date();
		DateFormat dformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //设置日期格式
		Timestamp timestamp=Timestamp.valueOf(dformat.format(date)) ;  //将当前时间转为字符串

		String[] FenGeId=id.split(",");
		String[] FenGeNumber=Number.split(",");
		StayRegisterPo stayRegisterPo=new StayRegisterPo();
		for (int i = 0; i < FenGeId.length; i++) {
			CommodityPo commodityPo=commodityService.selectById(Integer.parseInt(FenGeId[i]));
			stayRegisterPo.setConsumptionCommodityID(Integer.parseInt(FenGeId[i]));
			stayRegisterPo.setConsumptionStayRegisterID(consumptionStayRegisterID);
			stayRegisterPo.setConsumptionNumber(FenGeNumber[i]);
			stayRegisterPo.setConsumptionTime(timestamp);
			double money=Integer.parseInt(FenGeNumber[i])*(Double.parseDouble(commodityPo.getSalePrice()));
			stayRegisterPo.setConsumptionMoney(money);
			stayRegisterService.insertConsumptiondetails(stayRegisterPo);
		}
		
		List<StayRegisterPo> listSource=stayRegisterService.selectMoney(consumptionStayRegisterID);
		int chuZuFangShiId=listSource.get(0).getRentOutTypeID();                                      //出租方式ID
		int zhuDianShiChang=Integer.parseInt(listSource.get(0).getStayNumber());                    //住店时长     
		double fangJiaTian=listSource.get(0).getRoomStandardPriceDay();                             //房价/天
		double fangJia=listSource.get(0).getRoomStandardPrice();                                    //房价/小时
		int zuiDaShiChang=Integer.parseInt(listSource.get(0).getRoomMaxDuration());                 //最大时长
		int shouDuanShiChang=Integer.parseInt(listSource.get(0).getRoomFirstDuration());            //首段时长
		double shouDuanJiaGe=listSource.get(0).getRoomFirstPrice();                                 //首段价格
		double xiaoFeiJiaGe=0;
		double zhuSuFei=0;
		if(chuZuFangShiId==26){
		    zhuSuFei=fangJiaTian*zhuDianShiChang;                                      //房价乘以天数得总费
		}else if(chuZuFangShiId==25){
			if (shouDuanShiChang >= zhuDianShiChang) { 
				zhuSuFei=shouDuanJiaGe;                              //首时段时长大于 他输入的钟点数     那么按 首段价格计算
			}else if (shouDuanShiChang <= zhuDianShiChang && zhuDianShiChang <= zuiDaShiChang) {
				int xiaoShi=zhuDianShiChang-shouDuanShiChang;                 //如果输入的钟点数 在 最大时长的范围之内
				zhuSuFei= shouDuanJiaGe+xiaoShi*fangJia;                   // 且大于等于首段时长 ，那么 计算出
			}else if(zhuDianShiChang>zuiDaShiChang){
				zhuSuFei=fangJiaTian;                                     //假如 输入的钟点数大于最大时长那么 按一天的价格计算
			}
		}
		for (int i = 0; i < listSource.size(); i++) {
			xiaoFeiJiaGe+=listSource.get(i).getConsumptionMoney();
		}
		double zongFeiYong=xiaoFeiJiaGe+zhuSuFei;
		stayRegisterService.updateSumConst(consumptionStayRegisterID, zongFeiYong);
		
		mv=new ModelAndView("redirect:/StayRegister/toconsumption.do?id="+fangjianId);
		mv.addObject("lvKeName",lvkeName);
		mv.addObject("LvKeLeiXingId",LvKeLeiXingId);
		return mv;
	}
	
	
	//删除
	@RequestMapping("/consumptionDelete")
	public ModelAndView consumptionDelete(String id,int consumptionStayRegisterID){
		ModelAndView mv=null;
		String[] FenGeId=id.split(",");
		for (int i = 0; i < FenGeId.length; i++) {
			stayRegisterService.deleteConsumption(Integer.parseInt(FenGeId[i]));
		}
		mv=new ModelAndView("redirect:/StayRegister/toconsumption.do?id="+fangjianId);
		mv.addObject("lvKeName",lvkeName);
		
		List<StayRegisterPo> listSource=stayRegisterService.selectMoney(consumptionStayRegisterID);
		int chuZuFangShiId=listSource.get(0).getRentOutTypeID();                                      //出租方式ID
		int zhuDianShiChang=Integer.parseInt(listSource.get(0).getStayNumber());                    //住店时长     
		double fangJiaTian=listSource.get(0).getRoomStandardPriceDay();                             //房价/天
		double fangJia=listSource.get(0).getRoomStandardPrice();                                    //房价/小时
		int zuiDaShiChang=Integer.parseInt(listSource.get(0).getRoomMaxDuration());                 //最大时长
		int shouDuanShiChang=Integer.parseInt(listSource.get(0).getRoomFirstDuration());            //首段时长
		double shouDuanJiaGe=listSource.get(0).getRoomFirstPrice();                                 //首段价格
		double xiaoFeiJiaGe=0;
		double zhuSuFei=0;
		if(chuZuFangShiId==26){
		    zhuSuFei=fangJiaTian*zhuDianShiChang;                                      //房价乘以天数得总费
		}else if(chuZuFangShiId==25){
			if (shouDuanShiChang >= zhuDianShiChang) { 
				zhuSuFei=shouDuanJiaGe;                              //首时段时长大于 他输入的钟点数     那么按 首段价格计算
			}else if (shouDuanShiChang <= zhuDianShiChang && zhuDianShiChang <= zuiDaShiChang) {
				int xiaoShi=zhuDianShiChang-shouDuanShiChang;                 //如果输入的钟点数 在 最大时长的范围之内
				zhuSuFei= shouDuanJiaGe+xiaoShi*fangJia;                   // 且大于等于首段时长 ，那么 计算出
			}else if(zhuDianShiChang>zuiDaShiChang){
				zhuSuFei=fangJiaTian;                                     //假如 输入的钟点数大于最大时长那么 按一天的价格计算
			}
		}
		for (int i = 0; i < listSource.size(); i++) {
			xiaoFeiJiaGe+=listSource.get(i).getConsumptionMoney();
		}
		double zongFeiYong=xiaoFeiJiaGe+zhuSuFei;
		stayRegisterService.updateSumConst(consumptionStayRegisterID, zongFeiYong);
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/tianJiaShangPin")
	public Object tianJiaShangPin(String name,int cboid){
		if(name==null){
			name="";
		}
		List<CommodityPo> listAjax=commodityService.fuzzySelect(name, cboid);
       Gson gson=new Gson();
       return gson.toJson(listAjax);
	}
	
/*--------------------------------------- 消费明细  end ------------------------------------------------------------------*/	
	
	

	
	
/*--------------------------------------- 散客结账 start------------------------------------------------------------------*/		
	
	@RequestMapping("/topay")
	public ModelAndView topay(Integer id,String lvKeName){
		ModelAndView mv=null;
		fangjianId=id;
		lvkeName=lvKeName;
		
		Date date=new Date();
		DateFormat dformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //设置日期格式
		Timestamp timestamp=Timestamp.valueOf(dformat.format(date)) ;  //将当前时间转为字符串
		
		double shangPinXiaoFei=0;
		double yaJin=0;
		double huanFanFei=0;
		double zongFeiYong=0;
		double zhuSuFei=0;
		double yingBuJinE=0;
		
		List<StayRegisterPo> listDeposit=stayRegisterService.selectDepositById(id);
		List<StayRegisterPo> listShangPin=stayRegisterService.selectMoney(id);
		List<AttributePo> listOne=attributeService.selectPayWay();
		
		for (int i = 0; i < listDeposit.size(); i++) {
			yaJin+=listDeposit.get(i).getDeposit();
		}
		for (int i = 0; i < listShangPin.size(); i++) {
			shangPinXiaoFei+=listShangPin.get(i).getConsumptionMoney();
		}
		huanFanFei=listDeposit.get(0).getChangRoomMoney();
		zongFeiYong=listDeposit.get(0).getSumConst();
		zhuSuFei=zongFeiYong-shangPinXiaoFei-huanFanFei;
		yingBuJinE=zongFeiYong-yaJin;
		
		mv=new ModelAndView("/stayregister/pay");
		mv.addObject("stayId",id);
		mv.addObject("lvKeName",lvKeName);
		mv.addObject("listDeposit",listDeposit);
		mv.addObject("listShangPin",listShangPin);
		mv.addObject("zhuSuFei",zhuSuFei);
		mv.addObject("yaJin",yaJin);
		mv.addObject("shangPinXiaoFei",shangPinXiaoFei);
		mv.addObject("yingBuJinE",yingBuJinE);
		mv.addObject("timestamp",timestamp);
		mv.addObject("listOne",listOne);
		return mv;
	}
	
	//结账
	@RequestMapping("/pay")
	public ModelAndView pay(Integer id,String remarks,Timestamp payTime,Integer payWay,Integer roomId){
		ModelAndView mv=null;
		stayRegisterService.pay(id, remarks, payTime, payWay);
		RoomSetPo roomSetPo=new RoomSetPo();
		roomSetPo.setId(roomId);
		roomSetPo.setRoomStateID(1);
		roomSetService.updateByIdToRoomState(roomSetPo);
		mv=new ModelAndView("redirect:/StayRegister/tolist.do?");
		return mv;
	}
	
	
/*--------------------------------------- 散客结账 end------------------------------------------------------------------*/		



	
	
/*--------------------------------------- 批量安排房间 start------------------------------------------------------------------*/			
	//批量安排房间
	@RequestMapping("/tovolumeroom")
	public ModelAndView tovolumeroom(Integer tuanDuiID, String teamName){
		ModelAndView mv=null;
		List<AttributePo> listPassengerType=attributeService.selectPassengerType();     //旅客类别
		List<AttributePo> listBillUnit=attributeService.selectBillUnit();              //结账单位
		List<AttributePo> listPayWay=attributeService.selectPayWay();                 //结账方式
		List<AttributePo> listRentOutType=attributeService.selectRentOutType();      //出租方式
		mv=new ModelAndView("/stayregister/volumeroom");
		mv.addObject("listPassengerType",listPassengerType);
		mv.addObject("listBillUnit",listBillUnit);
		mv.addObject("listPayWay",listPayWay);
		mv.addObject("listRentOutType",listRentOutType);
		mv.addObject("tuanDuiID",tuanDuiID);
		mv.addObject("teamName",teamName);
		return mv;
	}
	
	//批量安排房间
	@RequestMapping("/volumeroom")
	public ModelAndView volumeroom(String roomId,StayRegisterPo stayRegisterPo){
		ModelAndView mv=null;
		String[] FenGen=roomId.split(",");
		stayRegisterPo.setIsBillID(68);
		int chuZuFangShiId=stayRegisterPo.getRentOutTypeID();                           //获取 出租方式
		int tianShuOrZhongDian=Integer.parseInt(stayRegisterPo.getStayNumber());       //获取 住店天数/小时
		double yaJin=stayRegisterPo.getDeposit()/FenGen.length;
		stayRegisterPo.setDeposit(yaJin);
		RoomSetPo roomSetPoToRoomState=new RoomSetPo();
		roomSetPoToRoomState.setRoomStateID(65);                     //给新的 Po 赋房态的值
		
		for (int i = 0; i < FenGen.length; i++) {
			RoomSetPo roomSetPo=roomSetService.selectById(Integer.parseInt(FenGen[i]));                      //根据 房间ID 查询出唯一的数据
			if(chuZuFangShiId==26){
				double fagnJia=roomSetPo.getStandardPriceDay();                          //获取房价/天
				double sumConst=fagnJia*(tianShuOrZhongDian);                            //房价乘以天数得总费
				stayRegisterPo.setSumConst(sumConst);
			}else if(chuZuFangShiId==25){
				double fagnJia=roomSetPo.getStandardPrice();                                //获取房价/小时
				int zuiDaShiChang=Integer.parseInt(roomSetPo.getMaxDuration());              //获取最大时长
				int shouDuanShiChang=Integer.parseInt(roomSetPo.getFirstDuration());         //获取首段时长
				double shouDuanJiGe=roomSetPo.getFirstPrice();                              //获取首段价格
				if (shouDuanShiChang >= tianShuOrZhongDian) { 
					double sumConst=shouDuanJiGe;                                           //首时段时长大于 他输入的钟点数 
					stayRegisterPo.setSumConst(sumConst);                                    //那么按 首段价格计算
				}else if (shouDuanShiChang <= tianShuOrZhongDian && tianShuOrZhongDian <= zuiDaShiChang) {
					int xiaoShi=tianShuOrZhongDian-shouDuanShiChang;                 //如果输入的钟点数 在 最大时长的范围之内
					double sumConst= shouDuanJiGe+xiaoShi*fagnJia;                   // 且大于等于首段时长 ，那么 计算出
					stayRegisterPo.setSumConst(sumConst);                            // 首段价格 加上 钟点数乘以 多出的每小时价格
				}else if(tianShuOrZhongDian>zuiDaShiChang){
					stayRegisterPo.setSumConst(roomSetPo.getStandardPriceDay()); //假如 输入的钟点数大于最大时长那么 按一天的价格计算
				}
			}
			stayRegisterPo.setRoomID(Integer.parseInt(FenGen[i]));
			stayRegisterService.insertAll(stayRegisterPo);
			int id=stayRegisterPo.getId();
			stayRegisterPo.setDepositStayRegisterID(id);
			stayRegisterPo.setDepositRegisterTime(stayRegisterPo.getRegisterTime());
			stayRegisterService.insertDeposit(stayRegisterPo);
			roomSetPoToRoomState.setId(Integer.parseInt(FenGen[i]));                      //给新的 Po 赋房间ID的值
			roomSetService.updateByIdToRoomState(roomSetPoToRoomState);  //根据 房间ID 来修改 当前被选中的房间的房态
		}
		mv=new ModelAndView("redirect:/StayRegister/tolist.do?LvKeLeiXingId="+56);
		return mv;
	}
	
	//ajax查询房间信息
	@ResponseBody
	@RequestMapping(value="/ajaxSelectRoom")
	public Object ajaxSelectRoom(String id){
	   List<RoomSetPo> list=new ArrayList<RoomSetPo>();
	   String[] fenGe=id.split(",");
	   for (int i = 0; i < fenGe.length; i++) {
		  RoomSetPo roomSetPo=roomSetService.selectById(Integer.parseInt(fenGe[i]));
		  list.add(roomSetPo);
	   }
       Gson gson=new Gson();
       return gson.toJson(list);
	}
	
/*--------------------------------------- 批量安排房间 end------------------------------------------------------------------*/		
	
	
	
	
	
	
	
	//团队押金
	@RequestMapping("/toteamdeposit")
	public ModelAndView toteamdeposit(){
		ModelAndView mv=null;
		mv=new ModelAndView("/stayregister/teamdeposit");
		return mv;
	}
	
	
	
	
	
	
/*--------------------------------------- 团队结账 start-----------------------------------------------------------------*/			
	
	//团队结账
	@RequestMapping("/toteampay")
	public ModelAndView toteampay(Integer tuanDuiID){
		ModelAndView mv=null;
		TeamPayVo teamPayVo=new TeamPayVo();
		double yaJin=0;
		double xiaoFei=0;
		double huanFangFei=0;
		double zongFeiYong=0;
		double zhuSuFei=0;
		double yingBuJinE=0;
		int fangJianShu=0;
		Date date=new Date();
		DateFormat dformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //设置日期格式
		Timestamp timestamp=Timestamp.valueOf(dformat.format(date)) ;  //将当前时间转为字符串
		List<AttributePo> listPayWay=attributeService.selectPayWay();                 //结账方式
		List<StayRegisterPo> listDeposit=stayRegisterService.selectTeamDeposit(tuanDuiID);
		List<StayRegisterPo> listConsumption=stayRegisterService.selectTeamConsumption(tuanDuiID);
		List<StayRegisterPo> list=stayRegisterService.selectFormTeamId(tuanDuiID, 68);
		for (int i = 0; i < listDeposit.size(); i++) {
			yaJin+=listDeposit.get(i).getDeposit();
		}
		for (int i = 0; i < list.size(); i++) {
			zongFeiYong+=list.get(i).getSumConst();
			huanFangFei+=list.get(i).getChangRoomMoney();
		}
		for (int i = 0; i < listConsumption.size(); i++) {
			xiaoFei+=listConsumption.get(i).getConsumptionMoney();
		}
		fangJianShu=list.size();
		zhuSuFei=zongFeiYong-huanFangFei-xiaoFei;
		yingBuJinE=zongFeiYong-yaJin;
		teamPayVo.setStayMoney(zhuSuFei);
		teamPayVo.setChangRoomMoney(huanFangFei);
		teamPayVo.setOtherMoney(xiaoFei);
		teamPayVo.setPayMoney(zongFeiYong);
		teamPayVo.setDepositMoney(yaJin);
		teamPayVo.setPayRepairMoney(yingBuJinE);
		mv=new ModelAndView("/stayregister/teampay");
		mv.addObject("listPayWay",listPayWay);
		mv.addObject("listConsumption",listConsumption);
		mv.addObject("teamPayVo",teamPayVo);
		mv.addObject("fangJianShu",fangJianShu);
		mv.addObject("timestamp",timestamp);
		mv.addObject("list",list);
		mv.addObject("tuanDuiID",tuanDuiID);
		return mv;
	}
	
	@RequestMapping("teamPay")
	public ModelAndView teamPay( String id,	String remarks, Integer payWay, Timestamp payTime){
		ModelAndView mv=null;
		RoomSetPo roomSetPo=new RoomSetPo();
		roomSetPo.setRoomStateID(1);
		String[] FenGe=id.split(",");
		for (int i = 0; i < FenGe.length; i++) {
			stayRegisterService.pay(Integer.parseInt(FenGe[i]), remarks, payTime, payWay);
			StayRegisterPo stayRegisterPo=stayRegisterService.selectById(Integer.parseInt(FenGe[i]));
			roomSetPo.setId(stayRegisterPo.getRoomID());
			roomSetService.updateByIdToRoomState(roomSetPo);
		}
		mv=new ModelAndView("redirect:/StayRegister/tolist.do?LvKeLeiXingId="+56);
		return mv;
	}
	
	
	//ajax查询房间信息
	@ResponseBody
	@RequestMapping(value="/ajaxTeamSelectRoom")
	public Object ajaxTeamSelectRoom(String roomNumber,Integer receiveTargetID){
	   List<StayRegisterPo> list=new ArrayList<StayRegisterPo>();
	   list=stayRegisterService.ajaxSelectTeamRoom(receiveTargetID, roomNumber);
       Gson gson=new Gson();
       return gson.toJson(list);
	}
	
	//ajax查询房间信息
	@ResponseBody
	@RequestMapping(value="/timeAjaxSelectRoomOne")
	public Object timeAjaxSelectRoomOne(Integer receiveTargetID,String datemin,String datemax){
	   datemin=datemin+" 00:00:00";
	   datemax=datemax+" 23:59:59";
	   Timestamp min=Timestamp.valueOf(datemin);
	   Timestamp max=Timestamp.valueOf(datemax);
	   List<StayRegisterPo> list=new ArrayList<StayRegisterPo>();
	   list=stayRegisterService.ajaxSelectTeamFormTime(receiveTargetID, min, max);
       Gson gson=new Gson();
       return gson.toJson(list);
	}
	
	//ajax查询房间信息
	@ResponseBody
	@RequestMapping(value="/timeAjaxSelectRoomTwo")
	public Object timeAjaxSelectRoomTwo(Integer receiveTargetID,String datemin,String datemax){
		TeamPayVo teamPayVo=new TeamPayVo();
		double yaJin=0;
		double xiaoFei=0;
		double huanFangFei=0;
		double zongFeiYong=0;
		double zhuSuFei=0;
		double yingBuJinE=0;
		int fangJianShu=0;
		datemin=datemin+" 00:00:00";
	    datemax=datemax+" 23:59:59";
	    Timestamp min=Timestamp.valueOf(datemin);
	    Timestamp max=Timestamp.valueOf(datemax);
	    
		List<StayRegisterPo> listDeposit=stayRegisterService.ajaxSelectTeamDeposit(receiveTargetID, min, max);
		List<StayRegisterPo> listConsumption=stayRegisterService.ajaxSelectTeamConsumption(receiveTargetID, min, max);
		List<StayRegisterPo> list=stayRegisterService.ajaxSelectTeamFormTime(receiveTargetID, min, max);
		for (int i = 0; i < listDeposit.size(); i++) {
			yaJin+=listDeposit.get(i).getDeposit();
			huanFangFei+=listDeposit.get(i).getChangRoomMoney();
		}
		for (int i = 0; i < list.size(); i++) {
			zongFeiYong+=list.get(i).getSumConst();
		}
		for (int i = 0; i < listConsumption.size(); i++) {
			xiaoFei+=listConsumption.get(i).getConsumptionMoney();
		}
		fangJianShu=listConsumption.size();
		zhuSuFei=zongFeiYong-huanFangFei-xiaoFei;
		yingBuJinE=zongFeiYong-yaJin;
		teamPayVo.setStayMoney(zhuSuFei);
		teamPayVo.setChangRoomMoney(huanFangFei);
		teamPayVo.setOtherMoney(xiaoFei);
		teamPayVo.setPayMoney(zongFeiYong);
		teamPayVo.setDepositMoney(yaJin);
		teamPayVo.setPayRepairMoney(yingBuJinE);
		Gson gson=new Gson();
		/*List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("canshu", "zhr");
		map.put("teamPayVo", teamPayVo);
		list.add(map);*/
       return gson.toJson(teamPayVo);
	}
	
	
	
	
	//ajax查询房间信息
		@ResponseBody
		@RequestMapping(value="/timeAjaxSelectRoomThree")
		public Object timeAjaxSelectRoomThree(String id,Double zhuSuFei,Double huanFangFei,
				Double qiTaXiaoFei,Double jieZhangJinE,Double yaJin,Double yingBuJinE){
			double ByaJin=0;
			double BxiaoFei=0;
			double BhuanFangFei=0;
			double BzongFeiYong=0;
			double BzhuSuFei=0;
			TeamPayVo teamPayVo=new TeamPayVo();
			String[] FenGeId=id.split(",");
			for (int i = 0; i < FenGeId.length; i++) {
				StayRegisterPo xiangQing=stayRegisterService.selectSumconst(Integer.parseInt(FenGeId[i]));
			    List<StayRegisterPo> yaJinList=stayRegisterService.selectDepositJinJianBan(Integer.parseInt(FenGeId[i]));
			    List<StayRegisterPo> xiaoFeiList=stayRegisterService.selectConsumptionJinJianBan(Integer.parseInt(FenGeId[i]));
			    for (int j = 0; j < yaJinList.size(); j++) {
					ByaJin+=yaJinList.get(j).getDeposit();
				}
			    for (int j = 0; j < xiaoFeiList.size(); j++) {
					BxiaoFei+=xiaoFeiList.get(j).getConsumptionMoney();
				}
			    if(i==0){
			    	BhuanFangFei+=xiangQing.getChangRoomMoney();
				    BzongFeiYong+=xiangQing.getSumConst();
			    }
			}
			
			BzhuSuFei=BzongFeiYong-BhuanFangFei-BxiaoFei;
			
			double JzhuSuFei=zhuSuFei-BzhuSuFei;
			double JhuanFangFei=huanFangFei-BhuanFangFei;
			double JqiTaXiaoFei=qiTaXiaoFei-BxiaoFei;
			double JjieZhangJinE=jieZhangJinE-BzongFeiYong;
			double JyaJin=yaJin-ByaJin;
			double JyingBuJinE=yingBuJinE-(BzongFeiYong-ByaJin);
			teamPayVo.setStayMoney(JzhuSuFei);
			teamPayVo.setChangRoomMoney(JhuanFangFei);
			teamPayVo.setOtherMoney(JqiTaXiaoFei);
			teamPayVo.setPayMoney(JjieZhangJinE);
			teamPayVo.setDepositMoney(JyaJin);
			teamPayVo.setPayRepairMoney(JyingBuJinE);
			Gson gson=new Gson();
			
	       return gson.toJson(teamPayVo);
		}
	
	
/*--------------------------------------- 团队结账 end------------------------------------------------------------------*/		
	
	
	
	
	
	
	
	
	
	
	//转为散客
	@RequestMapping("/toshiftpersonage")
	public ModelAndView toshiftpersonage(Integer id,Integer stayregisterdetailsId){
		ModelAndView mv=null;
		double zhuSuFei=0;
		double huanFangFei=0;
		double qiTaXiaoFei=0;
		double yaJin=0;
		double zongFeiYong=0;
		String txtname="";
		List<StayRegisterPo> listDeposit=stayRegisterService.selectDepositJinJianBan(id);
		List<StayRegisterPo> listXiaoFei=stayRegisterService.selectConsumptionJinJianBan(id);
		StayRegisterPo list=stayRegisterService.selectInformationXiangQingBan(stayregisterdetailsId);
		for (int i = 0; i < listDeposit.size(); i++) {
			yaJin+=listDeposit.get(i).getDeposit();
		}
		for (int i = 0; i < listXiaoFei.size(); i++) {
			qiTaXiaoFei+=listXiaoFei.get(i).getConsumptionMoney();
		}
		zongFeiYong=list.getSumConst();
		huanFangFei=list.getChangRoomMoney();
		zhuSuFei=zongFeiYong-huanFangFei-qiTaXiaoFei;
		mv=new ModelAndView("/stayregister/shiftpersonage");
		mv.addObject("zhuSuFei",zhuSuFei);
		mv.addObject("qiTaXiaoFei",qiTaXiaoFei);
		mv.addObject("yaJin",yaJin);
		mv.addObject("list",list);
		mv.addObject("id",id);
		return mv;
	}
	
	//转入团队
	@RequestMapping("/toshiftteam")
	public ModelAndView toshiftteam(Integer id,Integer stayregisterdetailsId){
		ModelAndView mv=null;
		double zhuSuFei=0;
		double huanFangFei=0;
		double qiTaXiaoFei=0;
		double yaJin=0;
		double zongFeiYong=0;
		String txtname="";
		List<StayRegisterPo> listDeposit=stayRegisterService.selectDepositJinJianBan(id);
		List<StayRegisterPo> listXiaoFei=stayRegisterService.selectConsumptionJinJianBan(id);
		StayRegisterPo list=stayRegisterService.selectInformationXiangQingBan(stayregisterdetailsId);
		List<ReceiveTargetPo> listRT=receiveTargetService.ajaxSelect(txtname);
		for (int i = 0; i < listDeposit.size(); i++) {
			yaJin+=listDeposit.get(i).getDeposit();
		}
		for (int i = 0; i < listXiaoFei.size(); i++) {
			qiTaXiaoFei+=listXiaoFei.get(i).getConsumptionMoney();
		}
		zongFeiYong=list.getSumConst();
		huanFangFei=list.getChangRoomMoney();
		zhuSuFei=zongFeiYong-huanFangFei-qiTaXiaoFei;
		mv=new ModelAndView("/stayregister/shiftteam");
		mv.addObject("zhuSuFei",zhuSuFei);
		mv.addObject("qiTaXiaoFei",qiTaXiaoFei);
		mv.addObject("yaJin",yaJin);
		mv.addObject("list",list);
		mv.addObject("listRT",listRT);
		mv.addObject("id",id);
		return mv;
	}
	
	//转为散客或转入团队
	@RequestMapping("/changOver")
	public ModelAndView changOver(Integer id,Integer receiveTargetID,Integer LvKeLeiXingId){
		ModelAndView mv=null;
		if (receiveTargetID==null) {
			receiveTargetID=2;
		}
		stayRegisterService.changOverTeam(id, receiveTargetID);
		mv=new ModelAndView("redirect:/StayRegister/tolist.do?LvKeLeiXingId="+LvKeLeiXingId);
		return mv;
	}
	
	
	
	
	//ajax 安排房间的房间
	@ResponseBody
	@RequestMapping(value="/guestRoomLevelSelectRoom")
	public Object guestRoomLevelSelectRoom(Integer guestRoomLevelID){
		List<RoomSetPo> list=null;
		if (guestRoomLevelID==0) {
			list=roomSetService.selectAll();
		}else {
			list=roomSetService.levelSelectInformation(guestRoomLevelID);
		}
		Gson gson=new Gson();
       return gson.toJson(list);
	}
	
}
