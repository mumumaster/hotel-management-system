package com.gx.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gx.po.AttributePo;


public interface AttributeDao {
    // 新增商品类别 
	public int insertAll(@Param("newid")int newid, @Param("newname")String newname);
	
	// 删除商品类别 
	public int deleteById(Integer id);
	
	//客房等级
	public List<AttributePo> selectGuestRoomLevel( );
	
	//房态
	public List<AttributePo> selectRoomState( );
	
	//商品类别
	public List<AttributePo> selectCommodityType( );
	
	//计量单位
	public List<AttributePo> selectUOM( );
	
	//查看对象类别
	public List<AttributePo> selectTargetType( );
	
	//查看性别
	public List<AttributePo> selectGender( );
	
	//查看民族
	public List<AttributePo> selectNation( );
	
	//查看旅客级别
	public List<AttributePo> selectPassengerLevel( );
	
	//查看文化程度
	public List<AttributePo> selectEducationDegree( );
	
	//查看证件类型
    public List<AttributePo> selectPapers( );
	
	//查看事由
	public List<AttributePo> selectThingReason( );
	
	//旅客类别
	public List<AttributePo> selectPassengerType( );
	
	//结账单位
	public List<AttributePo> selectBillUnit( );
	
	//结账方式
	public List<AttributePo> selectPayWay( );
	
	//出租方式
	public List<AttributePo> selectRentOutType( );
	
	//结账否
	public List<AttributePo> selectIsPay( );
	
	//预订状态
	public List<AttributePo> selectPredetermineState( );

}
