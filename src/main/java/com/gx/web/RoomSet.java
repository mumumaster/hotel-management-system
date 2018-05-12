package com.gx.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.gx.page.Page;
import com.gx.po.AttributePo;
import com.gx.po.RoomSetPo;
import com.gx.service.AttributeService;
import com.gx.service.RoomSetService;

@Controller
@RequestMapping("/RoomSet")
public class RoomSet {
	
	@Autowired
	private AttributeService attributeService;
	
	@Autowired
	private RoomSetService roomSetService;
	
/*	@RequestMapping("/tolist")
	public ModelAndView tolist(){
		ModelAndView mv=null;
		List<RoomSetPo> list=roomSetService.selectAll();
		mv=new ModelAndView("/roomset/roomset");
		mv.addObject("list",list);
		return mv;
	}*/
	
	//分页和模糊查询
	@RequestMapping("/tolist")
	public ModelAndView list(HttpServletRequest request,Integer currentPage,String txtname){
		ModelAndView mv=null;
		mv=new ModelAndView("/roomset/roomset");
		Page<RoomSetPo> vo=new Page<RoomSetPo>();
		if (currentPage==null) {
			currentPage=1;
		}else if (currentPage==0) {
			currentPage=1;
		}
		if(txtname==null)
		{
			txtname="";
		}
		vo.setCurrentPage(currentPage);
		vo=this.roomSetService.pageFuzzyselect(txtname, vo);
		mv.addObject("list",vo);
		mv.addObject("txtname",txtname);
		return mv;
	}
	

	@RequestMapping("/toadd")
	public ModelAndView toadd(){
		ModelAndView mv=null;
		List<AttributePo> listOne=attributeService.selectGuestRoomLevel();
		List<AttributePo> listTwo=attributeService.selectRoomState();
		mv=new ModelAndView("/roomset/add");
		mv.addObject("listOne",listOne);
		mv.addObject("listTwo",listTwo);
		return mv;
	}
	
	@RequestMapping("/add")
	public ModelAndView add(RoomSetPo roomSetPo){
		ModelAndView mv=null;
		roomSetService.insertAll(roomSetPo);
		mv=new ModelAndView("redirect:/RoomSet/tolist.do");
		return mv;
	}
	
	@RequestMapping("/toupdate")
	public ModelAndView toupdate(int id){
		ModelAndView mv=null;
		List<AttributePo> listOne=attributeService.selectGuestRoomLevel();
		List<AttributePo> listTwo=attributeService.selectRoomState();
		RoomSetPo listPo=roomSetService.selectById(id);
		mv=new ModelAndView("/roomset/update");
		mv.addObject("listOne",listOne);
		mv.addObject("listTwo",listTwo);
		mv.addObject("listPo",listPo);
		return mv;
	}
	
	@RequestMapping("/update")
	public ModelAndView update(RoomSetPo roomSetPo){
		ModelAndView mv=null;
		roomSetService.updateById(roomSetPo);
		mv=new ModelAndView("redirect:/RoomSet/tolist.do");
		return mv;
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(String id){
		ModelAndView mv=null;
		String[] FenGe=id.split(",");
		for (int i = 0; i < FenGe.length; i++) {
			roomSetService.deleteById(Integer.parseInt(FenGe[i]));
		}
		mv=new ModelAndView("redirect:/RoomSet/tolist.do");
		return mv;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/YZ")
	public Object YZ(String roomNumber){
		int YorN=roomSetService.selectYZ(roomNumber);
		Gson gson =new Gson();
		return gson.toJson(YorN);
	}
	
	
}
