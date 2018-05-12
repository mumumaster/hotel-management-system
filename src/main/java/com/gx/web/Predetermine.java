package com.gx.web;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.gx.dao.PredetermineDao;
import com.gx.page.Page;
import com.gx.po.AttributePo;
import com.gx.po.PassengerPo;
import com.gx.po.PredeterminePo;
import com.gx.po.ReceiveTargetPo;
import com.gx.po.RoomSetPo;
import com.gx.po.StayRegisterPo;
import com.gx.service.AttributeService;
import com.gx.service.PassengerService;
import com.gx.service.PredetermineService;
import com.gx.service.ReceiveTargetService;
import com.gx.service.RoomSetService;
import com.gx.service.StayRegisterService;

@Controller
@RequestMapping("/Predetermine")
public class Predetermine {
	
	@Autowired
	private PassengerService passengerService;
	
	@Autowired
	private ReceiveTargetService receiveTargetService;
	
	@Autowired
	private AttributeService attributeService;
	
	@Autowired
	private RoomSetService roomSetService;
	
	@Autowired
	private PredetermineService predetermineService;
	
	@Autowired
	private StayRegisterService stayRegisterService;
	
	int idP[];     //预订id
	int fangJianId[];
	
	
	@RequestMapping("/tolist")
	public ModelAndView tolist(HttpServletRequest request, Integer currentPage,
			String txtname,Integer state){
		ModelAndView mv=null;
		
		Date date=new Date();
		DateFormat dformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //设置日期格式
		Timestamp timestamp=Timestamp.valueOf(dformat.format(date)) ;  //将当前时间转为字符串
		List<PredeterminePo> list=this.predetermineService.selectAll();
		long shiJianCha;
		for (int i = 0; i < list.size(); i++) {
			Timestamp huoQuShiJian=list.get(i).getArriveTime();           //获取到达时间
			shiJianCha=timestamp.getTime()-huoQuShiJian.getTime();        //计算时间差
			if (shiJianCha>=0) {
				Integer huoQuId=list.get(i).getId();
				this.predetermineService.updateRemind(huoQuId);
			}
		}
		
		if (currentPage==null) {
			currentPage=1;
		}else if (currentPage==0) {
			currentPage=1;
		}
		if (state==null) {
			state=66;
		}
		if(txtname==null)
		{
			txtname="";
		}
		List<AttributePo> listOne=attributeService.selectPredetermineState();
		Page<PredeterminePo> vo=new Page<PredeterminePo>();
		vo.setCurrentPage(currentPage);
		vo=this.predetermineService.pageFuzzyselect(txtname, txtname, state, vo);
		mv=new ModelAndView("/predetermine/list");
		mv.addObject("listOne",listOne);
		mv.addObject("txtname",txtname);
		mv.addObject("state",state);
		mv.addObject("list",vo);
		return mv;
	}
	
	//ajax旅客
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
	@RequestMapping(value="/selectTarget")
	public Object selectTarget(String txtname){
		if (txtname==null) {
			txtname="";
		}
 	   List<ReceiveTargetPo> list=receiveTargetService.ajaxSelect(txtname);
       Gson gson=new Gson();
       return gson.toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="/confirmPassenger")
	public Object confirmPassenger(Integer id){
 	   PassengerPo list=passengerService.selectById(id);
       Gson gson=new Gson();
       return gson.toJson(list.getContactPhoneNumber());
	}
	
	
	//去新增界面
	@RequestMapping("/toadd")
	public ModelAndView toadd(Integer id,String name,Integer type){
		ModelAndView mv=null;
		List<AttributePo> listOne=attributeService.selectPayWay();
		mv=new ModelAndView("/predetermine/add");
		mv.addObject("id",id);
		mv.addObject("name",name);
		mv.addObject("type",type);
		mv.addObject("listOne",listOne);
		return mv;
	}
	
	//新增
	@RequestMapping("/add")
	public ModelAndView add(Integer id,Integer type, String roomIdShuZu,PredeterminePo po,Integer pangduan){
		ModelAndView mv=null;
		if(pangduan!=null){
			for (int i = 0; i < idP.length; i++) {
				predetermineService.deleteById(idP[i]);
			}
			RoomSetPo roomSetPo=new RoomSetPo();
			roomSetPo.setRoomStateID(1);                       //将此房态设置为空房
			for (int i = 0; i < fangJianId.length; i++) {
				
				roomSetPo.setId(fangJianId[i]);
	            roomSetService.updateByIdToRoomState(roomSetPo);    //修改此房态
			}
		}
		String[] FenGe=roomIdShuZu.split(",");             //分割为数组
		int changDu=FenGe.length;                          //获取数组长度
		double yaJin=po.getDeposit();                      //获取押金             
		double yaJinFenGe=yaJin/changDu;                   //得到平均押金
		po.setDeposit(yaJinFenGe);                         //设po的押金
		po.setPredetermineStateID(66);                     //设置预订状态为未按排
		if(type==1){                                       //如果为团队
			po.setPassengerID(0);                          //设置预订旅客id为0
			po.setPredetermineTargetID(id);                //设置团队id
		}else if(type==2){                                 //判断是否为旅客
			po.setPassengerID(id);                         //给预订赋值旅客id
			po.setPredetermineTargetID(2);                 //设置团队id
		}
		RoomSetPo roomSetPo=new RoomSetPo();
		roomSetPo.setRoomStateID(4);                       //设置此房态为预订
		for(int i=0;i<changDu;i++){
			po.setRoomID(Integer.parseInt(FenGe[i]));      //给预订设置房间id
			predetermineService.insertAll(po);             //新增预订单
			roomSetPo.setId(Integer.parseInt(FenGe[i]));   //更改房态的 获取房间id
			roomSetService.updateByIdToRoomState(roomSetPo);//修改房态为预订
		}
		mv=new ModelAndView("redirect:/Predetermine/tolist.do");
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/selectRoom")
	public Object selectRoom(String roomNumber){
	   if(roomNumber==null){
		   roomNumber="";
	   }
	   List<RoomSetPo> list=roomSetService.selectInformation(roomNumber);
       Gson gson=new Gson();
       return gson.toJson(list);
	}
	
	//去修改界面
	@RequestMapping("/toupdate")
	public ModelAndView toupdate(Integer id){
		idP=null;
		fangJianId=null;
		ModelAndView mv=null;
		int idid=0;
		PredeterminePo zuwenPo=predetermineService.findById(id);        //根据预订id来查询预订数据
		int lvKeId=zuwenPo.getPassengerID();                            //获取预订旅客id
		int teamId=zuwenPo.getPredetermineTargetID();                   //获取预订团队id
		List<PredeterminePo> teamList=null;
		List<PredeterminePo> lvKeList=null;
		List<AttributePo> listOne=attributeService.selectPayWay();
		double yaJin=0;
		int zhengShu=0;
		String nameString="";
		List<RoomSetPo> roomSetPolist=new ArrayList<RoomSetPo>();
		RoomSetPo roomSetPo=null;
		int type=0;
		mv=new ModelAndView("/predetermine/update");
		if (lvKeId==0) {
			idid=teamId;
			teamList=predetermineService.findTeamId(teamId);
			idP=new int[teamList.size()];
			fangJianId=new int[teamList.size()];
			for (int i = 0; i < teamList.size(); i++) {
				yaJin+=teamList.get(i).getDeposit();
				roomSetPo=roomSetService.selectById(teamList.get(i).getRoomID());
				roomSetPolist.add(roomSetPo);
				idP[i]=teamList.get(i).getId();
				fangJianId[i]=teamList.get(i).getRoomID();
			}
            zhengShu=(int)yaJin;
            mv.addObject("listList",teamList);
            nameString=teamList.get(0).getReceiveTeamName();
            type=1;
		}else {
			idid=lvKeId;
			lvKeList=predetermineService.findLvKeId(lvKeId);
			idP=new int[lvKeList.size()];
			fangJianId=new int[lvKeList.size()];
			for (int i = 0; i < lvKeList.size(); i++) {
				yaJin+=lvKeList.get(i).getDeposit();
				roomSetPo=roomSetService.selectById(lvKeList.get(i).getRoomID());
				roomSetPolist.add(roomSetPo);
				idP[i]=lvKeList.get(i).getId();
				fangJianId[i]=lvKeList.get(i).getRoomID();
			}
            zhengShu=(int)yaJin;
            mv.addObject("listList",lvKeList);
            nameString=lvKeList.get(0).getPassengerName(); 
            type=2;
		}
		mv.addObject("id",idid);
		mv.addObject("listOne",listOne);
		mv.addObject("roomSetPolist",roomSetPolist);
		mv.addObject("zhengShu",zhengShu);
		mv.addObject("name",nameString);
		mv.addObject("type",type);
		mv.addObject("pangduan",1);
		return mv;
	}
	
	//修改房间，移除房间时更改房态
	/*@RequestMapping("/changRoomState")
	public ModelAndView changRoomState(){
		ModelAndView mv=null;
		
		return mv;
	}*/
	
	
	//修改房间，移除房间时更改房态
	@RequestMapping("/delete")
	public ModelAndView delete(String id){
		ModelAndView mv=null;
		String[] FenGe=id.split(",");
		for (int i = 0; i < FenGe.length; i++) {
			this.predetermineService.deleteById(Integer.parseInt(FenGe[i]));
		}
		mv=new ModelAndView("redirect:/Predetermine/tolist.do");
		return mv;
	}
	
	//修改房间，移除房间时更改房态
	@RequestMapping("/arrangeRoom")
	public ModelAndView arrangeRoom(String id,Integer tiaoZhuang){
		ModelAndView mv=null;
		
		Date date=new Date();
		DateFormat dformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //设置日期格式
		Timestamp timestamp=Timestamp.valueOf(dformat.format(date)) ;  //将当前时间转为字符串
		
		String[] FenGe=id.split(",");                                    //分割到数组
		StayRegisterPo stayRegisterPo=new StayRegisterPo();
		RoomSetPo roomSetPoToRoomState=new RoomSetPo();
		for (int i = 0; i < FenGe.length; i++) {
            this.predetermineService.updatePredetermineStateID(Integer.parseInt(FenGe[i]));              //修改预订状态
            PredeterminePo predeterminePo=this.predetermineService.findById(Integer.parseInt(FenGe[i])); //查询预订信息
            RoomSetPo roomSetPo=this.roomSetService.selectById(predeterminePo.getRoomID());              //查询房间信息
            stayRegisterPo.setRoomID(predeterminePo.getRoomID());                                        //设置房间id
            stayRegisterPo.setRentOutTypeID(26);
            stayRegisterPo.setPassengerTypeID(29);
            if (predeterminePo.getPassengerID()==0) {                              //判断是否为团队还是散客
            	stayRegisterPo.setBillUnitID(28);
			}else {
				stayRegisterPo.setBillUnitID(27);
			}
            stayRegisterPo.setReceiveTargetID(predeterminePo.getPredetermineTargetID());
            stayRegisterPo.setIsBillID(68);
            stayRegisterPo.setRegisterTime(timestamp);
            stayRegisterPo.setStayNumber(predeterminePo.getPredetermineDay());
            stayRegisterPo.setSumConst(roomSetPo.getStandardPriceDay()
            		*Integer.parseInt(predeterminePo.getPredetermineDay()));      //获取房价 乘以 住宿天数
            stayRegisterService.insertAll(stayRegisterPo); //新增成功时，获取刚新增的id。
            Integer stayId=stayRegisterPo.getId();
            stayRegisterService.updateStayRegisterPredetermineID(Integer.parseInt(FenGe[i]), stayId);
            stayRegisterPo.setDepositStayRegisterID(stayId);
    		stayRegisterPo.setDepositRegisterTime(timestamp);
    		stayRegisterPo.setDepositPayWayID(predeterminePo.getPayWayID());
    		stayRegisterPo.setDeposit(predeterminePo.getDeposit());
    		stayRegisterService.insertDeposit(stayRegisterPo);
    		roomSetPoToRoomState.setId(predeterminePo.getRoomID());      //给新的 Po 赋房间ID的值
    		roomSetPoToRoomState.setRoomStateID(65);                     //给新的 Po 赋房态的值
    		roomSetService.updateByIdToRoomState(roomSetPoToRoomState);  //根据 房间ID 来修改 当前被选中的房间的房态
    	}
		if (tiaoZhuang==1) {
			mv=new ModelAndView("redirect:/StayRegister/tolist.do");
		}else if (tiaoZhuang==2){
			
			mv=new ModelAndView("redirect:/Predetermine/tolist.do");
		}
		return mv;
	}
		
		
}
