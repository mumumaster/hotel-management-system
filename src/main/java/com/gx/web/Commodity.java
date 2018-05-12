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
import com.gx.po.CommodityPo;
import com.gx.po.RoomSetPo;
import com.gx.service.AttributeService;
import com.gx.service.CommodityService;

@Controller
@RequestMapping("/Commodity")
public class Commodity {

	@Autowired
	private CommodityService commodityService;
	
	@Autowired
	private AttributeService attributeService;
	
//	@RequestMapping("/tolist")
//	public ModelAndView tolist(){
//		ModelAndView mv=null;
//		mv=new ModelAndView("/commodity/list");
//		return mv;
//	}
	
	//分页和模糊查询
		@RequestMapping("/tolist")
		public ModelAndView list(HttpServletRequest request, Integer currentPage, String txtname,Integer commodityTypeID){
			ModelAndView mv=null;
			List<AttributePo> listOne=attributeService.selectCommodityType();
			mv=new ModelAndView("/commodity/list");
			Page<CommodityPo> vo=new Page<CommodityPo>();
			if (commodityTypeID==null) {
				commodityTypeID=16;
			}
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
			vo=this.commodityService.pageFuzzyselect(txtname,commodityTypeID, vo);
			mv.addObject("list",vo);
			mv.addObject("txtname",txtname);
			mv.addObject("listOne",listOne);
			mv.addObject("commodityType",commodityTypeID);
			return mv;
		}
		
		
		@RequestMapping("/toadd")
		public ModelAndView toadd(){
			ModelAndView mv=null;
			List<AttributePo> listOne=attributeService.selectUOM();
			List<AttributePo> listTwo=attributeService.selectCommodityType();
			mv=new ModelAndView("/commodity/add");
			mv.addObject("listOne",listOne);
			mv.addObject("listTwo",listTwo);
			return mv;
		}
		
		@RequestMapping("/add")
		public ModelAndView add(CommodityPo commodityPo){
			ModelAndView mv=null;
			commodityService.insertAll(commodityPo);
			mv=new ModelAndView("redirect:/Commodity/tolist.do");
			return mv;
		}
		
		@RequestMapping("/toupdate")
		public ModelAndView toupdate(int id){
			ModelAndView mv=null;
			List<AttributePo> listOne=attributeService.selectUOM();
			List<AttributePo> listTwo=attributeService.selectCommodityType();
			CommodityPo commodityPo=commodityService.selectById(id);
			mv=new ModelAndView("/commodity/update");
			mv.addObject("listOne",listOne);
			mv.addObject("listTwo",listTwo);
			mv.addObject("listPo",commodityPo);
			return mv;
		}
		
		@RequestMapping("/update")
		public ModelAndView update(CommodityPo commodityPo){
			ModelAndView mv=null;
			commodityService.updateById(commodityPo);
			mv=new ModelAndView("redirect:/Commodity/tolist.do");
			return mv;
		}
		
		@RequestMapping("/delete")
		public ModelAndView delete(String id){
			ModelAndView mv=null;
			String[] FenGe=id.split(",");
			for (int i = 0; i < FenGe.length; i++) {
				commodityService.deleteById(Integer.parseInt(FenGe[i]));
			}
			mv=new ModelAndView("redirect:/Commodity/tolist.do");
			return mv;
		}
		
		
		
		
		@RequestMapping("/openwindow")
		public ModelAndView openwindow(){
			ModelAndView mv=null;
			mv=new ModelAndView("/commodity/commoditytype");
			return mv;
		}
		
		@RequestMapping("/newadd")
		public ModelAndView newadd(String txtname){
			ModelAndView mv=null;
			int newid=3;
			attributeService.insertAll(newid,txtname);
			mv=new ModelAndView("redirect:/Commodity/tolist.do");
			return mv;
		}
		
		@RequestMapping("/newdelete")
		public ModelAndView newdelete(String id){
			ModelAndView mv=null;
			String[] FenGe=id.split(",");
			for (int i = 0; i < FenGe.length; i++) {
				attributeService.deleteById(Integer.parseInt(FenGe[i]));
			}
			mv=new ModelAndView("redirect:/Commodity/tolist.do");
			return mv;
		}
		
		
		@ResponseBody
		@RequestMapping(value="/YZ")
		public Object YZ(String commodityName){
			int YorN=commodityService.selectYZ(commodityName);
			Gson gson =new Gson();
			return gson.toJson(YorN);
		}
}
