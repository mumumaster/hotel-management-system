package com.gx.web;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gx.page.Page;
import com.gx.po.ReceiveTargetPo;
import com.gx.po.StayRegisterPo;
import com.gx.service.StayRegisterService;

@Controller
@RequestMapping("/FinancialStatistics")
public class FinancialStatistics {
	
	@Autowired
	private StayRegisterService stayRegisterService;
	
	@RequestMapping("/tolist")
	public ModelAndView tolist(String datemin, String datemax,Integer currentPage){
		ModelAndView mv=null;
		int chuZuFangJianShu=0;
		int zhuSuRenShu=0;
		double xiaoFeiJinE=0;
		double JieZhangJinE=0;
		
		if (currentPage==null) {
			currentPage=1;
		}else if (currentPage==0) {
			currentPage=1;
		}
		mv=new ModelAndView("/financialstatistics/financialstatistics");
		Page<StayRegisterPo> vo=new Page<StayRegisterPo>();
		vo.setCurrentPage(currentPage);
		
		if (datemin=="" || datemax=="" || datemin==null || datemax==null) {
			List<StayRegisterPo> listJinE=this.stayRegisterService.selectPayJingJianBanNot();
			for (int i = 0; i < listJinE.size(); i++) {
				chuZuFangJianShu++;
				JieZhangJinE+=listJinE.get(i).getSumConst();
			}
			
			List<StayRegisterPo> listRenShu=this.stayRegisterService.selectPayStayNumberNot();
			for (int i = 0; i < listRenShu.size(); i++) {
				zhuSuRenShu++;
			}
			
			List<StayRegisterPo> listXiaoFei=this.stayRegisterService.selectPayXiaoFeiNot();
			for (int i = 0; i < listXiaoFei.size(); i++) {
				xiaoFeiJinE+=listXiaoFei.get(i).getConsumptionMoney();
			}
			
			vo=this.stayRegisterService.pageFuzzyselectFour(vo);
		}else {
			String dateminString=datemin+" 00:00:00";
		    String datemaxString=datemax+" 23:59:59";
		    Timestamp min=Timestamp.valueOf(dateminString);
		    Timestamp max=Timestamp.valueOf(datemaxString);
			
			List<StayRegisterPo> listJinE=this.stayRegisterService.selectPayJingJianBan(min,max);
			for (int i = 0; i < listJinE.size(); i++) {
				chuZuFangJianShu++;
				JieZhangJinE+=listJinE.get(i).getSumConst();
			}
			
			List<StayRegisterPo> listRenShu=this.stayRegisterService.selectPayStayNumber(min,max);
			for (int i = 0; i < listRenShu.size(); i++) {
				zhuSuRenShu++;
			}
			
			List<StayRegisterPo> listXiaoFei=this.stayRegisterService.selectPayXiaoFei(min,max);
			for (int i = 0; i < listXiaoFei.size(); i++) {
				xiaoFeiJinE+=listXiaoFei.get(i).getConsumptionMoney();
			}
			vo=this.stayRegisterService.pageFuzzyselectFive(min, max, vo);
		}
		mv.addObject("list",vo);
		mv.addObject("chuZuFangJianShu",chuZuFangJianShu);
		mv.addObject("zhuSuRenShu",zhuSuRenShu);
		mv.addObject("xiaoFeiJinE",xiaoFeiJinE);
		mv.addObject("JieZhangJinE",JieZhangJinE);
		mv.addObject("min",datemin);
		mv.addObject("max",datemax);
		return mv;
	}
	
	@RequestMapping("/toinformation")
	public ModelAndView toinformation(Integer id,Integer stayregisterdetailsId,String min, String max){
		ModelAndView mv=null;
		double zhuSuFei=0;
		double huanFangFei=0;
		double qiTaXiaoFei=0;
		double yaJin=0;
		double zongFeiYong=0;
		List<StayRegisterPo> listDeposit=stayRegisterService.selectDepositById(id);
		List<StayRegisterPo> listXiaoFei=stayRegisterService.selectXiaoFeiMingXi(id);
		List<StayRegisterPo> list=stayRegisterService.selectAllInformation(stayregisterdetailsId);
		for (int i = 0; i < listDeposit.size(); i++) {
			yaJin+=listDeposit.get(i).getDeposit();
		}
		for (int i = 0; i < listXiaoFei.size(); i++) {
			qiTaXiaoFei+=listXiaoFei.get(i).getConsumptionMoney();
		}
		zongFeiYong=list.get(0).getSumConst();
		huanFangFei=list.get(0).getChangRoomMoney();
		zhuSuFei=zongFeiYong-huanFangFei-qiTaXiaoFei;
		mv=new ModelAndView("/financialstatistics/particulars");
		mv.addObject("zhuSuFei",zhuSuFei);
		mv.addObject("qiTaXiaoFei",qiTaXiaoFei);
		mv.addObject("yaJin",yaJin);
		mv.addObject("list",list);
		mv.addObject("id",id);
		mv.addObject("listDeposit",listDeposit);
		mv.addObject("listXiaoFei",listXiaoFei);
		mv.addObject("min",min);
		mv.addObject("max",max);
		return mv;
	}

}
