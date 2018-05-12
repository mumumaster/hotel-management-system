package com.gx.po;

import java.sql.Timestamp;

public class PredeterminePo {
	
	private Integer id;
	
	private Integer roomID;                    //房间ID
	
	private Integer predetermineTargetID;      //预订对象ID
	
	private Integer passengerID;               //旅客ID
	
	private Integer payWayID;                  //支付方式ID
	
	private Integer predetermineStateID;       //预订状态ID
	
	private Timestamp arriveTime;              //抵达时间
	
	private double deposit;                    //押金
	
	private String predetermineDay;           //  预定天数
	
	private Integer remind;                   //到时提醒
	
	
	
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

		
		
		
		
/*----------------------------------------  扩展字段   预定对象ID  start ----------------------------------------------*/		
	
      private Integer receiveTargeTypeID;            //预定对象的接待对象的对象类别ID
	
	  private String receivePrincipal;               //预定对象的接待对象的负责人
	
	  private String receiveTeamName;                //预定对象的接待对象的团队名称
	
	  private String receiveTeamCode;                //预定对象的接待对象的团队编号
	
	  private Timestamp receiveRegisterTime;         //预定对象的接待对象的登记时间
	
	  private String receiveContactPhoneNUmber;             //预定对象的接待对象的联系电话
			
			// 扩展字段   预定对象 的 再扩展字段 接待对象 的再扩展字段
			
			private String receiveTargeTypeName;                      //预定对象的接待对象的扩展字段：对象类别名称
/*--------------------------------------------  预定对象ID end ------------------------------------------------------------*/		

	
			
			
/*----------------------------------------  扩展字段  预定旅客ID  start ----------------------------------------------*/			
			
		private Integer passengerPapersID;              //预定的旅客的证件ID
		
		private Integer passengerEducationDegreeID;     //预定的旅客的文化程度ID
		
		private Integer passengerGenderID;              //预定的旅客的性别ID
		
		private Integer passengerLevelID;      //预定的旅客的旅客级别ID
		
		private Integer passengerNationID;              //预定的旅客的民族ID
		
		private Integer passengerThingReasonID;         //预定的旅客的事由

		private String passengerName;                   //预定的旅客的姓名
		
		private String passengerPapersNumber;           //预定的旅客的证件号码
		
		private String passengerBirthDate;              //预定的旅客的出生日期
		
		private String passengerLicenceIssuingAuthorty; //预定的旅客的发证机关
		
		private String passengerUnitsOrAddress;         //预定的旅客的单位或住址
		
		private String passengerPapersValidity;         //预定的旅客的证件有效期
		
		private String passengerProfession;             //预定的旅客的职业
		
		private String passengerWhereAreFrom;           //预定的旅客的从何处来
		
		private String predeterminePassengerWhereToGo;              //预定的旅客的到哪里去
		
		private String passengerContactPhoneNumber;     //预定的旅客的联系电话
		
		private String passengerRemarks;                //预定的旅客的备注
				
				//扩展字段
				
				private String passengerPapersName;             //预定的旅客的证件名称
				
				private String passengerEducationDegreeName;    //预定的旅客的文化程度名称
				
				private String passengerGenderName;             //预定的旅客的姓别
				
				private String passengerLevelName;     //预定的旅客的旅客级别名称
				
				private String passengerNationName;             //预定的旅客的民族名称
				
				private String passengerThingReasonName;        //预定的旅客的民族名称
		
/*--------------------------------------------  预定旅客ID end ------------------------------------------------------------*/		
					
					
    //预订ID 的 扩展字段属性
	
	private String payWayName;                            //预订支付方式名称
	
	private String predetermineStateName;                 //预订状态名称

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRoomID() {
		return roomID;
	}

	public void setRoomID(Integer roomID) {
		this.roomID = roomID;
	}

	public Integer getPredetermineTargetID() {
		return predetermineTargetID;
	}

	public void setPredetermineTargetID(Integer predetermineTargetID) {
		this.predetermineTargetID = predetermineTargetID;
	}

	public Integer getPassengerID() {
		return passengerID;
	}

	public void setPassengerID(Integer passengerID) {
		this.passengerID = passengerID;
	}

	public Integer getPayWayID() {
		return payWayID;
	}

	public void setPayWayID(Integer payWayID) {
		this.payWayID = payWayID;
	}

	public Integer getPredetermineStateID() {
		return predetermineStateID;
	}

	public void setPredetermineStateID(Integer predetermineStateID) {
		this.predetermineStateID = predetermineStateID;
	}

	public Timestamp getArriveTime() {
		return arriveTime;
	}

	public void setArriveTime(Timestamp arriveTime) {
		this.arriveTime = arriveTime;
	}

	public double getDeposit() {
		return deposit;
	}

	public void setDeposit(double deposit) {
		this.deposit = deposit;
	}

	public String getPredetermineDay() {
		return predetermineDay;
	}

	public void setPredetermineDay(String predetermineDay) {
		this.predetermineDay = predetermineDay;
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

	public Integer getPassengerLevelID() {
		return passengerLevelID;
	}

	public void setPassengerLevelID(Integer passengerLevelID) {
		this.passengerLevelID = passengerLevelID;
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

	public String getPredeterminePassengerWhereToGo() {
		return predeterminePassengerWhereToGo;
	}

	public void setPredeterminePassengerWhereToGo(
			String predeterminePassengerWhereToGo) {
		this.predeterminePassengerWhereToGo = predeterminePassengerWhereToGo;
	}

	public String getPassengerContactPhoneNumber() {
		return passengerContactPhoneNumber;
	}

	public void setPassengerContactPhoneNumber(String passengerContactPhoneNumber) {
		this.passengerContactPhoneNumber = passengerContactPhoneNumber;
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

	public String getPassengerLevelName() {
		return passengerLevelName;
	}

	public void setPassengerLevelName(String passengerLevelName) {
		this.passengerLevelName = passengerLevelName;
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

	public String getPayWayName() {
		return payWayName;
	}

	public void setPayWayName(String payWayName) {
		this.payWayName = payWayName;
	}

	public String getPredetermineStateName() {
		return predetermineStateName;
	}

	public void setPredetermineStateName(String predetermineStateName) {
		this.predetermineStateName = predetermineStateName;
	}

	public Integer getRemind() {
		return remind;
	}

	public void setRemind(Integer remind) {
		this.remind = remind;
	}
	
	
}
