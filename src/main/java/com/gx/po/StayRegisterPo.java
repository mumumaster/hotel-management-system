package com.gx.po;

import java.sql.Timestamp;

public class StayRegisterPo {

	private Integer id;
	
	private Integer predetermineID;            //预订ID
	
	private Integer rentOutTypeID;             //出租方式ID
	
	private Integer roomID;                    //房间ID
	
	private Integer payWayID;                  //支付方式ID，结账方式ID
	
	private Integer billUnitID;                //结账单位ID
	
	private Integer passengerTypeID;           //旅客类别ID
	
	private Integer receiveTargetID;           //接待对象ID
	
	private Integer deputyID;                  //副ID
	
	private Integer isBillID;                  //结账否
	
	private Timestamp registerTime;            //登记时间
	
	private String stayNumber;                 //住宿天数或小时
	
	private double sumConst;                   //总费用
	
	private String changingRoomNumber;         //换房次数
	
	private double changRoomMoney;             //换房费
	
	private String remarks;                    //备注
	
	private Timestamp payTime;                 //结账时间
	
	private Timestamp changRoomTime;           //换房时间
	
	private Integer remind;                     //结账提示   
	
	
	
	/*----------------------------------------  扩展字段   预订ID  start ----------------------------------------------*/
	
	private Integer predetermineRoomID;            //预订房间ID
	
	private Integer predetermineTargetID;          //预定对象ID
	
	private Integer predeterminePassengerID;       //预订旅客ID
	
	private Integer predeterminePayWayID;          //预订支付方式ID
	
	private Integer predetermineStateID;           //预订状态ID
	
	private Timestamp predetermineArriveTime;      //预订抵达时间
	
	private double predetermineDeposit;            //预订押金
	
	private String predetermineDay;                //预订天数
	
	/*》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》*/
		//预订ID 的扩展字段 房间ID 
		
		private Integer predetermineRoomGuestRoomLevelID;            //预订的房间的客房等级ID
		
		private Integer predetermineRoomStateID;                     //预订的房间的房态ID
		
		private String predetermineRoomNumber;                       //预订的房间的房间号
		
		private String predetermineRoomAmount;                       //预订的房间的床位数
		
		private double predetermineRoomStandardPriceDay;             //预订的房间的标准房价/天
		
		private double predetermineRoomStandardPrice;                //预订的房间的标准房价/小时
		
		private String predetermineRoomMaxDuration;                  //预订的房间的时长限制（小时）
		
		private String predetermineRoomFirstDuration;                //预订的房间的首段时长（小时）
		
		private double predetermineRoomFirstPrice;                   //预订的房间的首段价格
		
		     /*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/	
			  //预订ID 的扩展字段 房间 的 再扩展字段
			
			  private String predetermineRoomGuestRoomLevelName;             //预订的房间的客房等级名称
			 
			  private String predetermineRoomStateName;                      //预订的房间的房态名称
			
		
	  /*》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》*/
		//预订ID 的扩展字段 预定对象ID
		
	    private Integer predetermineReceiveTargeTypeID;            //预定对象的接待对象的对象类别ID
		
		private String predetermineReceivePrincipal;               //预定对象的接待对象的负责人
		
		private String predetermineReceiveTeamName;                //预定对象的接待对象的团队名称
		
		private String predetermineReceiveTeamCode;                //预定对象的接待对象的团队编号
		
		private Timestamp predetermineReceiveRegisterTime;         //预定对象的接待对象的登记时间
		
		private String predetermineReceiveContactPhoneNUmber;             //预定对象的接待对象的联系电话
				
				// 扩展字段   预定对象 的 再扩展字段 接待对象 的再扩展字段
				
				private String predetermineReceiveTargeTypeName;                      //预定对象的接待对象的扩展字段：对象类别名称
			
	/*》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》*/
			
			//预订ID 的扩展字段 预定旅客ID
			private Integer predeterminePassengerPapersID;              //预定的旅客的证件ID
			
			private Integer predeterminePassengerEducationDegreeID;     //预定的旅客的文化程度ID
			
			private Integer predeterminePassengerGenderID;              //预定的旅客的性别ID
			
			private Integer predeterminePassengerPassengerLevelID;      //预定的旅客的旅客级别ID
			
			private Integer predeterminePassengerNationID;              //预定的旅客的民族ID
			
			private Integer predeterminePassengerThingReasonID;         //预定的旅客的事由
	
			private String predeterminePassengerName;                   //预定的旅客的姓名
			
			private String predeterminePassengerPapersNumber;           //预定的旅客的证件号码
			
			private String predeterminePassengerBirthDate;              //预定的旅客的出生日期
			
			private String predeterminePassengerLicenceIssuingAuthorty; //预定的旅客的发证机关
			
			private String predeterminePassengerUnitsOrAddress;         //预定的旅客的单位或住址
			
			private String predeterminePassengerPapersValidity;         //预定的旅客的证件有效期
			
			private String predeterminePassengerProfession;             //预定的旅客的职业
			
			private String predeterminePassengerWhereAreFrom;           //预定的旅客的从何处来
			
			private String predeterminePredeterminePassengerWhereToGo;              //预定的旅客的到哪里去
			
			private String predeterminePassengerContactPhoneNumber;     //预定的旅客的联系电话
			
			private String predeterminePassengerRemarks;                //预定的旅客的备注
					
				/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/	
					//扩展字段
					
					private String predeterminePassengerPapersName;             //预定的旅客的证件名称
					
					private String predeterminePassengerEducationDegreeName;    //预定的旅客的文化程度名称
					
					private String predeterminePassengerGenderName;             //预定的旅客的姓别
					
					private String predeterminePredeterminePassengerPassengerLevelName;     //预定的旅客的旅客级别名称
					
					private String predeterminePassengerNationName;             //预定的旅客的民族名称
					
					private String predeterminePassengerThingReasonName;        //预定的旅客的民族名称
		
		/*》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》》*/
	    //预订ID 的 扩展字段 的 再扩展字段属性
		
		private String predeterminePayWayName;                //预订支付方式名称
		
		private String predetermineStateName;                 //预订状态名称
		
	/*-------------------------------------------- end ------------------------------------------------------------*/
	
			
	
			
			
			
	
	/*----------------------------------------  扩展字段   房间ID  start ----------------------------------------------*/

	private Integer roomGuestRoomLevelID;            //房间的客房等级ID
	
	private Integer roomStateID;                     //房间的房态ID
	
	private String roomNumber;                       //房间的房间号
	
	private String roomAmount;                       //房间的床位数
	
	private double roomStandardPriceDay;             //房间的标准房价/天
	
	private double roomStandardPrice;                //房间的标准房价/小时
	
	private String roomMaxDuration;                  //房间的时长限制（小时）
	
	private String roomFirstDuration;                //房间的首段时长（小时）
	
	private double roomFirstPrice;                   //房间的首段价格
	
		//房间ID 的扩展字段 房间 的 再扩展字段
		
		private String roomGuestRoomLevelName;             //房间的客房等级名称
		 
		private String roomStateName;                      //房间的房态名称
			
	/*-------------------------------------------- end ------------------------------------------------------------*/	


			
		
			
			
	/*----------------------------------------  扩展字段   接待对象ID  start ----------------------------------------------*/
		
		private Integer receiveTargeTypeID;            //接待对象的对象类别ID
		
		private String receivePrincipal;               //接待对象的负责人
		
		private String receiveTeamName;                //接待对象的团队名称
		
		private String receiveTeamCode;                //接待对象的团队编号
		
		private Timestamp receiveRegisterTime;         //接待对象的登记时间
		
		private String receiveContactPhoneNUmber;             //接待对象的联系电话
		
			// 扩展字段   接待对象 的 再扩展字段
			
			private String receiveTargeTypeName;                      //接待对象的对象类别名称
	
	/*-------------------------------------------- end ------------------------------------------------------------*/	
			
			
			
			
			
			
			
	/*----------------------------------------  扩展字段   属性集合  start ----------------------------------------------*/

	private String rentOutTypeName;             //出租方式名称
	
	private String payWayName;                  //支付方式名称，结账方式名称
	
	private String billUnitName;                //结账单位名称
	
	private String passengerTypeName;           //旅客类别名称
	
	private String isBillName;                  //结账否名称
	
   /*-------------------------------------------- end ------------------------------------------------------------*/	
	
	
	
	
/*----------------------------------------  扩展字段   住宿明细  start ----------------------------------------------*/
	
	private Integer stayregisterdetailsId; 
	

	private Integer stayRegisterID;            //住宿明细的住宿ID
	 
	private Integer passengerID;               //住宿明细的旅客ID
	
	
		//预订ID 的扩展字段 预定旅客ID
		private Integer passengerPapersID;              //住宿明细的旅客的证件ID
		
		private Integer passengerEducationDegreeID;     //住宿明细的旅客的文化程度ID
		
		private Integer passengerGenderID;              //住宿明细的旅客的性别ID
		
		private Integer passengerLevelID;      //住宿明细的旅客的旅客级别ID
		
		private Integer passengerNationID;              //住宿明细的旅客的民族ID
		
		private Integer passengerThingReasonID;         //住宿明细的旅客的事由
	
		private String passengerName;                   //住宿明细的旅客的姓名
		
		private String passengerPapersNumber;           //住宿明细的旅客的证件号码
		
		private String passengerBirthDate;              //住宿明细的旅客的出生日期
		
		private String passengerLicenceIssuingAuthorty; //住宿明细的旅客的发证机关
		
		private String passengerUnitsOrAddress;         //住宿明细的旅客的单位或住址
		
		private String passengerPapersValidity;         //住宿明细的旅客的证件有效期
		
		private String passengerProfession;             //住宿明细的旅客的职业
		
		private String passengerWhereAreFrom;           //住宿明细的旅客的从何处来
		
		private String passengerWhereToGo;              //住宿明细的旅客的到哪里去
		
		private String pssengerContactPhoneNumber;     //住宿明细的旅客的联系电话
		
		private String passengerRemarks;                //住宿明细的旅客的备注
				
			/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/	
				//扩展字段
				
				private String passengerPapersName;             //住宿明细的旅客的证件名称
				
				private String passengerEducationDegreeName;    //住宿明细的旅客的文化程度名称
				
				private String passengerGenderName;             //住宿明细的旅客的姓别
				
				private String passengerLevelName;              //住宿明细的旅客的旅客级别名称
				
				private String passengerNationName;             //住宿明细的旅客的民族名称
				
				private String passengerThingReasonName;        //住宿明细的旅客的民族名称

	/*-------------------------------------------- end ------------------------------------------------------------*/	
				
				
	
/*-------------------------------------------- 押金ID start ------------------------------------------------------------*/
	
	private Integer depositStayRegisterID;         //押金的住宿登记ID
	
	private Integer depositPayWayID;               //押金的支付ID；
	
	private Timestamp depositRegisterTime;         //押金的登记时间
	
	private double deposit;             //押金
	
	//扩展字段
	private String depositPayWayName;        //押金的支付名称
	
	/*-------------------------------------------- end ------------------------------------------------------------*/
				
	
	
	
				
/*-------------------------------------------- 消费明细 start ------------------------------------------------------------*/			
	
	private Integer consumptionId;                      //消费明细的主键ID
	
	private Integer consumptionStayRegisterID;         //消费明细的住宿登记ID
	
	private Integer consumptionCommodityID;         //消费明细的商品ID
				
	private String consumptionNumber;        //消费明细的消费商品数量	
				
	private double consumptionMoney;             //消费金额
	
	private Timestamp consumptionTime;         //消费明细的消费时间
	
	//消费明细的再扩展字段 商品表
	
		private Integer commodityTypeID;         //消费明细的商品的商品类别ID
		
		private Integer commodityUOMID;         //消费明细的商品的计量单位ID
		
		private String commodityName;        //消费明细的商品的商品名称
		
		private double commoditySalePrice;             //消费明细的商品的销售价格
		
		//消费明细的再扩展字段 商品表 的 再扩展属性
		
		private String commodityTypeName;        //消费明细的商品的商品类别名称
		
		private String commodityUOMName;        //消费明细的商品的计量单位名称
	
	/*-------------------------------------------- end ------------------------------------------------------------*/			
				
		
	
	
	
	
	
	
	
	
	
	
	
				
				
				
				
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPredetermineID() {
		return predetermineID;
	}

	public void setPredetermineID(Integer predetermineID) {
		this.predetermineID = predetermineID;
	}

	public Integer getRentOutTypeID() {
		return rentOutTypeID;
	}

	public void setRentOutTypeID(Integer rentOutTypeID) {
		this.rentOutTypeID = rentOutTypeID;
	}

	public Integer getRoomID() {
		return roomID;
	}

	public void setRoomID(Integer roomID) {
		this.roomID = roomID;
	}

	public Integer getPayWayID() {
		return payWayID;
	}

	public void setPayWayID(Integer payWayID) {
		this.payWayID = payWayID;
	}

	public Integer getBillUnitID() {
		return billUnitID;
	}

	public void setBillUnitID(Integer billUnitID) {
		this.billUnitID = billUnitID;
	}

	public Integer getPassengerTypeID() {
		return passengerTypeID;
	}

	public void setPassengerTypeID(Integer passengerTypeID) {
		this.passengerTypeID = passengerTypeID;
	}

	public Integer getReceiveTargetID() {
		return receiveTargetID;
	}

	public void setReceiveTargetID(Integer receiveTargetID) {
		this.receiveTargetID = receiveTargetID;
	}

	public Integer getDeputyID() {
		return deputyID;
	}

	public void setDeputyID(Integer deputyID) {
		this.deputyID = deputyID;
	}
	

	public Timestamp getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Timestamp registerTime) {
		this.registerTime = registerTime;
	}

	public String getStayNumber() {
		return stayNumber;
	}

	public void setStayNumber(String stayNumber) {
		this.stayNumber = stayNumber;
	}

	public Integer getIsBillID() {
		return isBillID;
	}

	public void setIsBillID(Integer isBillID) {
		this.isBillID = isBillID;
	}

	public double getSumConst() {
		return sumConst;
	}

	public void setSumConst(double sumConst) {
		this.sumConst = sumConst;
	}

	public String getChangingRoomNumber() {
		return changingRoomNumber;
	}

	public void setChangingRoomNumber(String changingRoomNumber) {
		this.changingRoomNumber = changingRoomNumber;
	}

	public double getChangRoomMoney() {
		return changRoomMoney;
	}

	public void setChangRoomMoney(double changRoomMoney) {
		this.changRoomMoney = changRoomMoney;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Timestamp getPayTime() {
		return payTime;
	}

	public void setPayTime(Timestamp payTime) {
		this.payTime = payTime;
	}

	public Integer getPredetermineRoomID() {
		return predetermineRoomID;
	}

	public void setPredetermineRoomID(Integer predetermineRoomID) {
		this.predetermineRoomID = predetermineRoomID;
	}

	public Integer getPredetermineTargetID() {
		return predetermineTargetID;
	}

	public void setPredetermineTargetID(Integer predetermineTargetID) {
		this.predetermineTargetID = predetermineTargetID;
	}

	public Integer getPredeterminePassengerID() {
		return predeterminePassengerID;
	}

	public void setPredeterminePassengerID(Integer predeterminePassengerID) {
		this.predeterminePassengerID = predeterminePassengerID;
	}

	public Integer getPredeterminePayWayID() {
		return predeterminePayWayID;
	}

	public void setPredeterminePayWayID(Integer predeterminePayWayID) {
		this.predeterminePayWayID = predeterminePayWayID;
	}

	public Integer getPredetermineStateID() {
		return predetermineStateID;
	}

	public void setPredetermineStateID(Integer predetermineStateID) {
		this.predetermineStateID = predetermineStateID;
	}

	public Timestamp getPredetermineArriveTime() {
		return predetermineArriveTime;
	}

	public void setPredetermineArriveTime(Timestamp predetermineArriveTime) {
		this.predetermineArriveTime = predetermineArriveTime;
	}

	public double getPredetermineDeposit() {
		return predetermineDeposit;
	}

	public void setPredetermineDeposit(double predetermineDeposit) {
		this.predetermineDeposit = predetermineDeposit;
	}

	public String getPredetermineDay() {
		return predetermineDay;
	}

	public void setPredetermineDay(String predetermineDay) {
		this.predetermineDay = predetermineDay;
	}

	public Integer getPredetermineRoomGuestRoomLevelID() {
		return predetermineRoomGuestRoomLevelID;
	}

	public void setPredetermineRoomGuestRoomLevelID(
			Integer predetermineRoomGuestRoomLevelID) {
		this.predetermineRoomGuestRoomLevelID = predetermineRoomGuestRoomLevelID;
	}

	public Integer getPredetermineRoomStateID() {
		return predetermineRoomStateID;
	}

	public void setPredetermineRoomStateID(Integer predetermineRoomStateID) {
		this.predetermineRoomStateID = predetermineRoomStateID;
	}

	public String getPredetermineRoomNumber() {
		return predetermineRoomNumber;
	}

	public void setPredetermineRoomNumber(String predetermineRoomNumber) {
		this.predetermineRoomNumber = predetermineRoomNumber;
	}

	public String getPredetermineRoomAmount() {
		return predetermineRoomAmount;
	}

	public void setPredetermineRoomAmount(String predetermineRoomAmount) {
		this.predetermineRoomAmount = predetermineRoomAmount;
	}

	public double getPredetermineRoomStandardPriceDay() {
		return predetermineRoomStandardPriceDay;
	}

	public void setPredetermineRoomStandardPriceDay(
			double predetermineRoomStandardPriceDay) {
		this.predetermineRoomStandardPriceDay = predetermineRoomStandardPriceDay;
	}

	public double getPredetermineRoomStandardPrice() {
		return predetermineRoomStandardPrice;
	}

	public void setPredetermineRoomStandardPrice(
			double predetermineRoomStandardPrice) {
		this.predetermineRoomStandardPrice = predetermineRoomStandardPrice;
	}

	public String getPredetermineRoomMaxDuration() {
		return predetermineRoomMaxDuration;
	}

	public void setPredetermineRoomMaxDuration(String predetermineRoomMaxDuration) {
		this.predetermineRoomMaxDuration = predetermineRoomMaxDuration;
	}

	public String getPredetermineRoomFirstDuration() {
		return predetermineRoomFirstDuration;
	}

	public void setPredetermineRoomFirstDuration(
			String predetermineRoomFirstDuration) {
		this.predetermineRoomFirstDuration = predetermineRoomFirstDuration;
	}

	public double getPredetermineRoomFirstPrice() {
		return predetermineRoomFirstPrice;
	}

	public void setPredetermineRoomFirstPrice(double predetermineRoomFirstPrice) {
		this.predetermineRoomFirstPrice = predetermineRoomFirstPrice;
	}

	public String getPredetermineRoomGuestRoomLevelName() {
		return predetermineRoomGuestRoomLevelName;
	}

	public void setPredetermineRoomGuestRoomLevelName(
			String predetermineRoomGuestRoomLevelName) {
		this.predetermineRoomGuestRoomLevelName = predetermineRoomGuestRoomLevelName;
	}

	public String getPredetermineRoomStateName() {
		return predetermineRoomStateName;
	}

	public void setPredetermineRoomStateName(String predetermineRoomStateName) {
		this.predetermineRoomStateName = predetermineRoomStateName;
	}

	public Integer getPredetermineReceiveTargeTypeID() {
		return predetermineReceiveTargeTypeID;
	}

	public void setPredetermineReceiveTargeTypeID(
			Integer predetermineReceiveTargeTypeID) {
		this.predetermineReceiveTargeTypeID = predetermineReceiveTargeTypeID;
	}

	public String getPredetermineReceivePrincipal() {
		return predetermineReceivePrincipal;
	}

	public void setPredetermineReceivePrincipal(String predetermineReceivePrincipal) {
		this.predetermineReceivePrincipal = predetermineReceivePrincipal;
	}

	public String getPredetermineReceiveTeamName() {
		return predetermineReceiveTeamName;
	}

	public void setPredetermineReceiveTeamName(String predetermineReceiveTeamName) {
		this.predetermineReceiveTeamName = predetermineReceiveTeamName;
	}

	public String getPredetermineReceiveTeamCode() {
		return predetermineReceiveTeamCode;
	}

	public void setPredetermineReceiveTeamCode(String predetermineReceiveTeamCode) {
		this.predetermineReceiveTeamCode = predetermineReceiveTeamCode;
	}

	public Timestamp getPredetermineReceiveRegisterTime() {
		return predetermineReceiveRegisterTime;
	}

	public void setPredetermineReceiveRegisterTime(
			Timestamp predetermineReceiveRegisterTime) {
		this.predetermineReceiveRegisterTime = predetermineReceiveRegisterTime;
	}

	public String getPredetermineReceiveContactPhoneNUmber() {
		return predetermineReceiveContactPhoneNUmber;
	}

	public void setPredetermineReceiveContactPhoneNUmber(
			String predetermineReceiveContactPhoneNUmber) {
		this.predetermineReceiveContactPhoneNUmber = predetermineReceiveContactPhoneNUmber;
	}

	public String getPredetermineReceiveTargeTypeName() {
		return predetermineReceiveTargeTypeName;
	}

	public void setPredetermineReceiveTargeTypeName(
			String predetermineReceiveTargeTypeName) {
		this.predetermineReceiveTargeTypeName = predetermineReceiveTargeTypeName;
	}

	public Integer getPredeterminePassengerPapersID() {
		return predeterminePassengerPapersID;
	}

	public void setPredeterminePassengerPapersID(
			Integer predeterminePassengerPapersID) {
		this.predeterminePassengerPapersID = predeterminePassengerPapersID;
	}

	public Integer getPredeterminePassengerEducationDegreeID() {
		return predeterminePassengerEducationDegreeID;
	}

	public void setPredeterminePassengerEducationDegreeID(
			Integer predeterminePassengerEducationDegreeID) {
		this.predeterminePassengerEducationDegreeID = predeterminePassengerEducationDegreeID;
	}

	public Integer getPredeterminePassengerGenderID() {
		return predeterminePassengerGenderID;
	}

	public void setPredeterminePassengerGenderID(
			Integer predeterminePassengerGenderID) {
		this.predeterminePassengerGenderID = predeterminePassengerGenderID;
	}

	public Integer getPredeterminePassengerPassengerLevelID() {
		return predeterminePassengerPassengerLevelID;
	}

	public void setPredeterminePassengerPassengerLevelID(
			Integer predeterminePassengerPassengerLevelID) {
		this.predeterminePassengerPassengerLevelID = predeterminePassengerPassengerLevelID;
	}

	public Integer getPredeterminePassengerNationID() {
		return predeterminePassengerNationID;
	}

	public void setPredeterminePassengerNationID(
			Integer predeterminePassengerNationID) {
		this.predeterminePassengerNationID = predeterminePassengerNationID;
	}

	public Integer getPredeterminePassengerThingReasonID() {
		return predeterminePassengerThingReasonID;
	}

	public void setPredeterminePassengerThingReasonID(
			Integer predeterminePassengerThingReasonID) {
		this.predeterminePassengerThingReasonID = predeterminePassengerThingReasonID;
	}

	public String getPredeterminePassengerName() {
		return predeterminePassengerName;
	}

	public void setPredeterminePassengerName(String predeterminePassengerName) {
		this.predeterminePassengerName = predeterminePassengerName;
	}

	public String getPredeterminePassengerPapersNumber() {
		return predeterminePassengerPapersNumber;
	}

	public void setPredeterminePassengerPapersNumber(
			String predeterminePassengerPapersNumber) {
		this.predeterminePassengerPapersNumber = predeterminePassengerPapersNumber;
	}

	public String getPredeterminePassengerBirthDate() {
		return predeterminePassengerBirthDate;
	}

	public void setPredeterminePassengerBirthDate(
			String predeterminePassengerBirthDate) {
		this.predeterminePassengerBirthDate = predeterminePassengerBirthDate;
	}

	public String getPredeterminePassengerLicenceIssuingAuthorty() {
		return predeterminePassengerLicenceIssuingAuthorty;
	}

	public void setPredeterminePassengerLicenceIssuingAuthorty(
			String predeterminePassengerLicenceIssuingAuthorty) {
		this.predeterminePassengerLicenceIssuingAuthorty = predeterminePassengerLicenceIssuingAuthorty;
	}

	public String getPredeterminePassengerUnitsOrAddress() {
		return predeterminePassengerUnitsOrAddress;
	}

	public void setPredeterminePassengerUnitsOrAddress(
			String predeterminePassengerUnitsOrAddress) {
		this.predeterminePassengerUnitsOrAddress = predeterminePassengerUnitsOrAddress;
	}

	public String getPredeterminePassengerPapersValidity() {
		return predeterminePassengerPapersValidity;
	}

	public void setPredeterminePassengerPapersValidity(
			String predeterminePassengerPapersValidity) {
		this.predeterminePassengerPapersValidity = predeterminePassengerPapersValidity;
	}

	public String getPredeterminePassengerProfession() {
		return predeterminePassengerProfession;
	}

	public void setPredeterminePassengerProfession(
			String predeterminePassengerProfession) {
		this.predeterminePassengerProfession = predeterminePassengerProfession;
	}

	public String getPredeterminePassengerWhereAreFrom() {
		return predeterminePassengerWhereAreFrom;
	}

	public void setPredeterminePassengerWhereAreFrom(
			String predeterminePassengerWhereAreFrom) {
		this.predeterminePassengerWhereAreFrom = predeterminePassengerWhereAreFrom;
	}

	public String getPredeterminePredeterminePassengerWhereToGo() {
		return predeterminePredeterminePassengerWhereToGo;
	}

	public void setPredeterminePredeterminePassengerWhereToGo(
			String predeterminePredeterminePassengerWhereToGo) {
		this.predeterminePredeterminePassengerWhereToGo = predeterminePredeterminePassengerWhereToGo;
	}

	public String getPredeterminePassengerContactPhoneNumber() {
		return predeterminePassengerContactPhoneNumber;
	}

	public void setPredeterminePassengerContactPhoneNumber(
			String predeterminePassengerContactPhoneNumber) {
		this.predeterminePassengerContactPhoneNumber = predeterminePassengerContactPhoneNumber;
	}

	public String getPredeterminePassengerRemarks() {
		return predeterminePassengerRemarks;
	}

	public void setPredeterminePassengerRemarks(String predeterminePassengerRemarks) {
		this.predeterminePassengerRemarks = predeterminePassengerRemarks;
	}

	public String getPredeterminePassengerPapersName() {
		return predeterminePassengerPapersName;
	}

	public void setPredeterminePassengerPapersName(
			String predeterminePassengerPapersName) {
		this.predeterminePassengerPapersName = predeterminePassengerPapersName;
	}

	public String getPredeterminePassengerEducationDegreeName() {
		return predeterminePassengerEducationDegreeName;
	}

	public void setPredeterminePassengerEducationDegreeName(
			String predeterminePassengerEducationDegreeName) {
		this.predeterminePassengerEducationDegreeName = predeterminePassengerEducationDegreeName;
	}

	public String getPredeterminePassengerGenderName() {
		return predeterminePassengerGenderName;
	}

	public void setPredeterminePassengerGenderName(
			String predeterminePassengerGenderName) {
		this.predeterminePassengerGenderName = predeterminePassengerGenderName;
	}

	public String getPredeterminePredeterminePassengerPassengerLevelName() {
		return predeterminePredeterminePassengerPassengerLevelName;
	}

	public void setPredeterminePredeterminePassengerPassengerLevelName(
			String predeterminePredeterminePassengerPassengerLevelName) {
		this.predeterminePredeterminePassengerPassengerLevelName = predeterminePredeterminePassengerPassengerLevelName;
	}

	public String getPredeterminePassengerNationName() {
		return predeterminePassengerNationName;
	}

	public void setPredeterminePassengerNationName(
			String predeterminePassengerNationName) {
		this.predeterminePassengerNationName = predeterminePassengerNationName;
	}

	public String getPredeterminePassengerThingReasonName() {
		return predeterminePassengerThingReasonName;
	}

	public void setPredeterminePassengerThingReasonName(
			String predeterminePassengerThingReasonName) {
		this.predeterminePassengerThingReasonName = predeterminePassengerThingReasonName;
	}

	public String getPredeterminePayWayName() {
		return predeterminePayWayName;
	}

	public void setPredeterminePayWayName(String predeterminePayWayName) {
		this.predeterminePayWayName = predeterminePayWayName;
	}

	public String getPredetermineStateName() {
		return predetermineStateName;
	}

	public void setPredetermineStateName(String predetermineStateName) {
		this.predetermineStateName = predetermineStateName;
	}

	
	public Integer getRoomGuestRoomLevelID() {
		return roomGuestRoomLevelID;
	}

	public void setRoomGuestRoomLevelID(Integer roomGuestRoomLevelID) {
		this.roomGuestRoomLevelID = roomGuestRoomLevelID;
	}

	public Integer getRoomStateID() {
		return roomStateID;
	}

	public void setRoomStateID(Integer roomStateID) {
		this.roomStateID = roomStateID;
	}

	public String getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}

	public String getRoomAmount() {
		return roomAmount;
	}

	public void setRoomAmount(String roomAmount) {
		this.roomAmount = roomAmount;
	}

	public double getRoomStandardPriceDay() {
		return roomStandardPriceDay;
	}

	public void setRoomStandardPriceDay(double roomStandardPriceDay) {
		this.roomStandardPriceDay = roomStandardPriceDay;
	}

	public double getRoomStandardPrice() {
		return roomStandardPrice;
	}

	public void setRoomStandardPrice(double roomStandardPrice) {
		this.roomStandardPrice = roomStandardPrice;
	}

	public String getRoomMaxDuration() {
		return roomMaxDuration;
	}

	public void setRoomMaxDuration(String roomMaxDuration) {
		this.roomMaxDuration = roomMaxDuration;
	}

	public String getRoomFirstDuration() {
		return roomFirstDuration;
	}

	public void setRoomFirstDuration(String roomFirstDuration) {
		this.roomFirstDuration = roomFirstDuration;
	}

	public double getRoomFirstPrice() {
		return roomFirstPrice;
	}

	public void setRoomFirstPrice(double roomFirstPrice) {
		this.roomFirstPrice = roomFirstPrice;
	}

	public String getRoomGuestRoomLevelName() {
		return roomGuestRoomLevelName;
	}

	public void setRoomGuestRoomLevelName(String roomGuestRoomLevelName) {
		this.roomGuestRoomLevelName = roomGuestRoomLevelName;
	}

	public String getRoomStateName() {
		return roomStateName;
	}

	public void setRoomStateName(String roomStateName) {
		this.roomStateName = roomStateName;
	}

	public Integer getReceiveTargeTypeID() {
		return receiveTargeTypeID;
	}

	public void setReceiveTargeTypeID(Integer receiveTargeTypeID) {
		this.receiveTargeTypeID = receiveTargeTypeID;
	}

	public String getReceivePrincipal() {
		return receivePrincipal;
	}

	public void setReceivePrincipal(String receivePrincipal) {
		this.receivePrincipal = receivePrincipal;
	}

	public String getReceiveTeamName() {
		return receiveTeamName;
	}

	public void setReceiveTeamName(String receiveTeamName) {
		this.receiveTeamName = receiveTeamName;
	}

	public String getReceiveTeamCode() {
		return receiveTeamCode;
	}

	public void setReceiveTeamCode(String receiveTeamCode) {
		this.receiveTeamCode = receiveTeamCode;
	}

	public Timestamp getReceiveRegisterTime() {
		return receiveRegisterTime;
	}

	public void setReceiveRegisterTime(Timestamp receiveRegisterTime) {
		this.receiveRegisterTime = receiveRegisterTime;
	}

	public String getReceiveContactPhoneNUmber() {
		return receiveContactPhoneNUmber;
	}

	public void setReceiveContactPhoneNUmber(String receiveContactPhoneNUmber) {
		this.receiveContactPhoneNUmber = receiveContactPhoneNUmber;
	}

	public String getReceiveTargeTypeName() {
		return receiveTargeTypeName;
	}

	public void setReceiveTargeTypeName(String receiveTargeTypeName) {
		this.receiveTargeTypeName = receiveTargeTypeName;
	}

	public String getRentOutTypeName() {
		return rentOutTypeName;
	}

	public void setRentOutTypeName(String rentOutTypeName) {
		this.rentOutTypeName = rentOutTypeName;
	}

	public String getPayWayName() {
		return payWayName;
	}

	public void setPayWayName(String payWayName) {
		this.payWayName = payWayName;
	}

	public String getBillUnitName() {
		return billUnitName;
	}

	public void setBillUnitName(String billUnitName) {
		this.billUnitName = billUnitName;
	}

	public String getPassengerTypeName() {
		return passengerTypeName;
	}

	public void setPassengerTypeName(String passengerTypeName) {
		this.passengerTypeName = passengerTypeName;
	}

	public String getIsBillName() {
		return isBillName;
	}

	public void setIsBillName(String isBillName) {
		this.isBillName = isBillName;
	}

	public Integer getStayRegisterID() {
		return stayRegisterID;
	}

	public void setStayRegisterID(Integer stayRegisterID) {
		this.stayRegisterID = stayRegisterID;
	}

	public Integer getPassengerID() {
		return passengerID;
	}

	public void setPassengerID(Integer passengerID) {
		this.passengerID = passengerID;
	}

	public Integer getPassengerPapersID() {
		return passengerPapersID;
	}

	public void setPassengerPapersID(Integer passengerPapersID) {
		this.passengerPapersID = passengerPapersID;
	}

	public Integer getPassengerEducationDegreeID() {
		return passengerEducationDegreeID;
	}

	public void setPassengerEducationDegreeID(Integer passengerEducationDegreeID) {
		this.passengerEducationDegreeID = passengerEducationDegreeID;
	}

	public Integer getPassengerGenderID() {
		return passengerGenderID;
	}

	public void setPassengerGenderID(Integer passengerGenderID) {
		this.passengerGenderID = passengerGenderID;
	}

	public Integer getPassengerNationID() {
		return passengerNationID;
	}

	public void setPassengerNationID(Integer passengerNationID) {
		this.passengerNationID = passengerNationID;
	}

	public Integer getPassengerThingReasonID() {
		return passengerThingReasonID;
	}

	public void setPassengerThingReasonID(Integer passengerThingReasonID) {
		this.passengerThingReasonID = passengerThingReasonID;
	}

	public String getPassengerName() {
		return passengerName;
	}

	public void setPassengerName(String passengerName) {
		this.passengerName = passengerName;
	}

	public String getPassengerPapersNumber() {
		return passengerPapersNumber;
	}

	public void setPassengerPapersNumber(String passengerPapersNumber) {
		this.passengerPapersNumber = passengerPapersNumber;
	}

	public String getPassengerBirthDate() {
		return passengerBirthDate;
	}

	public void setPassengerBirthDate(String passengerBirthDate) {
		this.passengerBirthDate = passengerBirthDate;
	}

	public String getPassengerLicenceIssuingAuthorty() {
		return passengerLicenceIssuingAuthorty;
	}

	public void setPassengerLicenceIssuingAuthorty(
			String passengerLicenceIssuingAuthorty) {
		this.passengerLicenceIssuingAuthorty = passengerLicenceIssuingAuthorty;
	}

	public String getPassengerUnitsOrAddress() {
		return passengerUnitsOrAddress;
	}

	public void setPassengerUnitsOrAddress(String passengerUnitsOrAddress) {
		this.passengerUnitsOrAddress = passengerUnitsOrAddress;
	}

	public String getPassengerPapersValidity() {
		return passengerPapersValidity;
	}

	public void setPassengerPapersValidity(String passengerPapersValidity) {
		this.passengerPapersValidity = passengerPapersValidity;
	}

	public String getPassengerProfession() {
		return passengerProfession;
	}

	public void setPassengerProfession(String passengerProfession) {
		this.passengerProfession = passengerProfession;
	}

	public String getPassengerWhereAreFrom() {
		return passengerWhereAreFrom;
	}

	public void setPassengerWhereAreFrom(String passengerWhereAreFrom) {
		this.passengerWhereAreFrom = passengerWhereAreFrom;
	}

	public String getPassengerWhereToGo() {
		return passengerWhereToGo;
	}

	public void setPassengerWhereToGo(String passengerWhereToGo) {
		this.passengerWhereToGo = passengerWhereToGo;
	}

	public String getPssengerContactPhoneNumber() {
		return pssengerContactPhoneNumber;
	}

	public void setPssengerContactPhoneNumber(String pssengerContactPhoneNumber) {
		this.pssengerContactPhoneNumber = pssengerContactPhoneNumber;
	}

	public String getPassengerRemarks() {
		return passengerRemarks;
	}

	public void setPassengerRemarks(String passengerRemarks) {
		this.passengerRemarks = passengerRemarks;
	}

	public String getPassengerPapersName() {
		return passengerPapersName;
	}

	public void setPassengerPapersName(String passengerPapersName) {
		this.passengerPapersName = passengerPapersName;
	}

	public String getPassengerEducationDegreeName() {
		return passengerEducationDegreeName;
	}

	public void setPassengerEducationDegreeName(String passengerEducationDegreeName) {
		this.passengerEducationDegreeName = passengerEducationDegreeName;
	}

	public String getPassengerGenderName() {
		return passengerGenderName;
	}

	public void setPassengerGenderName(String passengerGenderName) {
		this.passengerGenderName = passengerGenderName;
	}

	public String getPassengerNationName() {
		return passengerNationName;
	}

	public void setPassengerNationName(String passengerNationName) {
		this.passengerNationName = passengerNationName;
	}

	public String getPassengerThingReasonName() {
		return passengerThingReasonName;
	}

	public void setPassengerThingReasonName(String passengerThingReasonName) {
		this.passengerThingReasonName = passengerThingReasonName;
	}

	public Integer getPassengerLevelID() {
		return passengerLevelID;
	}

	public void setPassengerLevelID(Integer passengerLevelID) {
		this.passengerLevelID = passengerLevelID;
	}

	public String getPassengerLevelName() {
		return passengerLevelName;
	}

	public void setPassengerLevelName(String passengerLevelName) {
		this.passengerLevelName = passengerLevelName;
	}

	public Integer getDepositStayRegisterID() {
		return depositStayRegisterID;
	}

	public void setDepositStayRegisterID(Integer depositStayRegisterID) {
		this.depositStayRegisterID = depositStayRegisterID;
	}

	public Integer getDepositPayWayID() {
		return depositPayWayID;
	}

	public void setDepositPayWayID(Integer depositPayWayID) {
		this.depositPayWayID = depositPayWayID;
	}

	public Timestamp getDepositRegisterTime() {
		return depositRegisterTime;
	}

	public void setDepositRegisterTime(Timestamp depositRegisterTime) {
		this.depositRegisterTime = depositRegisterTime;
	}

	public double getDeposit() {
		return deposit;
	}

	public void setDeposit(double deposit) {
		this.deposit = deposit;
	}

	public String getDepositPayWayName() {
		return depositPayWayName;
	}

	public void setDepositPayWayName(String depositPayWayName) {
		this.depositPayWayName = depositPayWayName;
	}
	
	public Integer getConsumptionId() {
		return consumptionId;
	}

	public void setConsumptionId(Integer consumptionId) {
		this.consumptionId = consumptionId;
	}

	public Integer getConsumptionStayRegisterID() {
		return consumptionStayRegisterID;
	}

	public void setConsumptionStayRegisterID(Integer consumptionStayRegisterID) {
		this.consumptionStayRegisterID = consumptionStayRegisterID;
	}

	public Integer getConsumptionCommodityID() {
		return consumptionCommodityID;
	}

	public void setConsumptionCommodityID(Integer consumptionCommodityID) {
		this.consumptionCommodityID = consumptionCommodityID;
	}

	public String getConsumptionNumber() {
		return consumptionNumber;
	}

	public void setConsumptionNumber(String consumptionNumber) {
		this.consumptionNumber = consumptionNumber;
	}

	public double getConsumptionMoney() {
		return consumptionMoney;
	}

	public void setConsumptionMoney(double consumptionMoney) {
		this.consumptionMoney = consumptionMoney;
	}

	public Timestamp getConsumptionTime() {
		return consumptionTime;
	}

	public void setConsumptionTime(Timestamp consumptionTime) {
		this.consumptionTime = consumptionTime;
	}

	public Integer getCommodityTypeID() {
		return commodityTypeID;
	}

	public void setCommodityTypeID(Integer commodityTypeID) {
		this.commodityTypeID = commodityTypeID;
	}

	public Integer getCommodityUOMID() {
		return commodityUOMID;
	}

	public void setCommodityUOMID(Integer commodityUOMID) {
		this.commodityUOMID = commodityUOMID;
	}

	public String getCommodityName() {
		return commodityName;
	}

	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}

	public double getCommoditySalePrice() {
		return commoditySalePrice;
	}

	public void setCommoditySalePrice(double commoditySalePrice) {
		this.commoditySalePrice = commoditySalePrice;
	}

	public String getCommodityTypeName() {
		return commodityTypeName;
	}

	public void setCommodityTypeName(String commodityTypeName) {
		this.commodityTypeName = commodityTypeName;
	}

	public String getCommodityUOMName() {
		return commodityUOMName;
	}

	public void setCommodityUOMName(String commodityUOMName) {
		this.commodityUOMName = commodityUOMName;
	}

	public Timestamp getChangRoomTime() {
		return changRoomTime;
	}

	public void setChangRoomTime(Timestamp changRoomTime) {
		this.changRoomTime = changRoomTime;
	}

	public Integer getRemind() {
		return remind;
	}

	public void setRemind(Integer remind) {
		this.remind = remind;
	}
	
	public Integer getStayregisterdetailsId() {
		return stayregisterdetailsId;
	}
	
	public void setStayregisterdetailsId(Integer stayregisterdetailsId) {
		this.stayregisterdetailsId = stayregisterdetailsId;
	}
	
	

}
