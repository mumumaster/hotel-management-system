package com.gx.po;

public class RoomSetPo {
	
	private Integer id;
	
	private Integer guestRoomLevelID;
	
	private Integer roomStateID;
	
	private String roomNumber;
	
	private String roomAmount;
	
	private double standardPriceDay;
	
	private double standardPrice;
	
	private String maxDuration;
	
	private String firstDuration;
	
	private double firstPrice;
	
	
	//拓展字段
	
	private String guestRoomLevelName;
	
	private String roomName;
	
	
	


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getGuestRoomLevelID() {
		return guestRoomLevelID;
	}

	public void setGuestRoomLevelID(Integer guestRoomLevelID) {
		this.guestRoomLevelID = guestRoomLevelID;
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

	public double getStandardPriceDay() {
		return standardPriceDay;
	}

	public void setStandardPriceDay(double standardPriceDay) {
		this.standardPriceDay = standardPriceDay;
	}

	public double getStandardPrice() {
		return standardPrice;
	}

	public void setStandardPrice(double standardPrice) {
		this.standardPrice = standardPrice;
	}

	public String getMaxDuration() {
		return maxDuration;
	}

	public void setMaxDuration(String maxDuration) {
		this.maxDuration = maxDuration;
	}

	public String getFirstDuration() {
		return firstDuration;
	}

	public void setFirstDuration(String firstDuration) {
		this.firstDuration = firstDuration;
	}

	public double getFirstPrice() {
		return firstPrice;
	}

	public void setFirstPrice(double firstPrice) {
		this.firstPrice = firstPrice;
	}
	
	
	
	//拓展字段属性
	
	public String getGuestRoomLevelName() {
		return guestRoomLevelName;
	}
	
	public void setGuestRoomLevelName(String guestRoomLevelName) {
		this.guestRoomLevelName = guestRoomLevelName;
	}
	
	public String getRoomName() {
		return roomName;
	}
	
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	

}
