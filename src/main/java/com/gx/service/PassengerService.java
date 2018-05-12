package com.gx.service;

import java.util.List;

import com.gx.page.Page;
import com.gx.po.PassengerPo;

public interface PassengerService {
	
	public int deleteById(Integer id);
	
	
	public int insertAll(PassengerPo passengerPo);
	
	
	public	PassengerPo selectById(Integer id);

	
	public int updateById(PassengerPo passengerPo);
	
	
	//分页需要
	public Page<PassengerPo> pageFuzzyselect(String name,Page<PassengerPo> vo);
	
    //查询所有数据  非本派所用
    public List<PassengerPo> selectAll();
    
    //模糊查询 运用 Ajax 非分页
    public List<PassengerPo> selectAjaxList(String name);
    
  //ajax 验证是否存在 此身份证号码
   public int selectYZ(String papersNumber);

}
