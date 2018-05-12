package com.gx.service;

import java.util.List;

import com.gx.page.Page;
import com.gx.po.ReceiveTargetPo;;

public interface ReceiveTargetService {

	    public int deleteById(Integer id);
		
		
		public int insertAll(ReceiveTargetPo receiveTargetPo);
		
		
		public	ReceiveTargetPo selectById(Integer id);

		
		public int updateById(ReceiveTargetPo receiveTargetPo);
		
		
		//分页需要
		public Page<ReceiveTargetPo> pageFuzzyselect(String teamName,Page<ReceiveTargetPo> vo);
		
		
		//ajax 验证是否存在 此团队编号
	    public int selectYZ(String teamCode);
		
		
		//ajax查询 预订所用
	    public List<ReceiveTargetPo> ajaxSelect(String teamName);
}
