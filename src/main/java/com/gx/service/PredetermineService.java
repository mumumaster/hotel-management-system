package com.gx.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gx.page.Page;
import com.gx.po.PredeterminePo;

public interface PredetermineService {
	
	//新增预订
	public int insertAll(PredeterminePo predeterminePo);
	
	public Page<PredeterminePo> pageFuzzyselect(String receiveTeamName, String passengerName,
			int predetermineStateID,Page<PredeterminePo> vo);
	
	//id查询
    public PredeterminePo findById(Integer id);
    
    //根据 旅客id 来查询
    public List<PredeterminePo> findLvKeId(Integer id);
    
    //根据 团队id 来查询 
    public List<PredeterminePo> findTeamId(Integer id);
    
    //id删除
    public int deleteById(Integer id);
    
    //查询全部数据 无分页
    public List<PredeterminePo> selectAll();
    
    //修改预订到时提示
    public int updateRemind(Integer id);
    
    //修改预订状态
    public int updatePredetermineStateID(Integer id);

}
