package com.gx.web;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gx.page.Page;
import com.gx.po.AttributePo;
import com.gx.po.CommodityPo;
import com.gx.po.StayRegisterPo;
import com.gx.po.UserPo;
import com.gx.service.StayRegisterService;

@Controller
@RequestMapping("/DateView")
public class DateView {
	
	@Autowired
	private StayRegisterService stayRegisterService;
	
	@RequestMapping("/tolist")
	public ModelAndView list( ){
		ModelAndView mv=null;
		double sZongFeiYong1=0;
		double sZongFeiYong2=0;
		double sZongFeiYong3=0;
		double sZongFeiYong4=0;
		double sZongFeiYong5=0;
		double sZongFeiYong6=0;
		double sZongFeiYong7=0;
		double sZongFeiYong8=0;
		double sZongFeiYong9=0;
		double sZongFeiYong10=0;
		double sZongFeiYong11=0;
		double sZongFeiYong12=0;
		double tZongFeiYong1=0;
		double tZongFeiYong2=0;
		double tZongFeiYong3=0;
		double tZongFeiYong4=0;
		double tZongFeiYong5=0;
		double tZongFeiYong6=0;
		double tZongFeiYong7=0;
		double tZongFeiYong8=0;
		double tZongFeiYong9=0;
		double tZongFeiYong10=0;
		double tZongFeiYong11=0;
		double tZongFeiYong12=0;
		int year1=0;
		int year2=0;
		int year3=0;
		int year4=0;
		int year5=0;
		int year6=0;
		int year7=0;
		int year8=0;
		int year9=0;
		int year10=0;
		int year11=0;
		int year12=0;
		int year13=0;
		int month1=0;
		int month2=0;
		int month3=0;
		int month4=0;
		int month5=0;
		int month6=0;
		int month7=0;
		int month8=0;
		int month9=0;
		int month10=0;
		int month11=0;
		int month12=0;
		int month13=0;
		String monthString1="";
		String monthString2="";
		String monthString3="";
		String monthString4="";
		String monthString5="";
		String monthString6="";
		String monthString7="";
		String monthString8="";
		String monthString9="";
		String monthString10="";
		String monthString11="";
		String monthString12="";
		String monthString13="";
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);         //获取年
		int month = cal.get(Calendar.MONTH) + 1;   //获取月
		int day = cal.get(Calendar.DATE);         //获取日
		
		month=month+1;
		month1=month;
		year1=year;
		
		month2=month-1;
		month3=month-2;
		month4=month-3;
		month5=month-4;
		month6=month-5;
		month7=month-6;
		month8=month-7;
		month9=month-8;
		month10=month-9;
		month11=month-10;
		month12=month-11;
		month13=month-12;
		if (month2<=0) {
			month2=month2+12;
			year2=year-1;
		}else {
			year2=year;
		}
		if (month3<=0) {
			month3=12+month3;
			year3=year-1;
		}else {
			year3=year;
		}
		if (month4<=0) {
			month4=12+month4;
			year4=year-1;
		}else {
			year4=year;
		}
		if (month5<=0) {
			month5=12+month5;
			year5=year-1;
		}else {
			year5=year;
		}
		if (month6<=0) {
			month6=12+month6;
			year6=year-1;
		}else {
			year6=year;
		}
		if (month7<=0) {
			month7=12+month7;
			year7=year-1;
		}else {
			year7=year;
		}
		if (month8<=0) {
			month8=12+month8;
			year8=year-1;
		}else {
			year8=year;
		}
		if (month9<=0) {
			month9=12+month9;
			year9=year-1;
		}else {
			year9=year;
		}
		if (month10<=0) {
			month10=12+month10;
			year10=year-1;
		}else {
			year10=year;
		}
		if (month11<=0) {
			month11=12+month11;
			year11=year-1;
		}else {
			year11=year;
		}
		if (month12<=0) {
			month12=12+month12;
			year12=year-1;
		}else {
			year12=year;
		}
		if (month13<=0) {
			month13=12+month13;
			year13=year-1;
		}
		monthString1=String.valueOf(month1);
		monthString2=String.valueOf(month2);
		monthString3=String.valueOf(month3);
		monthString4=String.valueOf(month4);
		monthString5=String.valueOf(month5);
		monthString6=String.valueOf(month6);
		monthString7=String.valueOf(month7);
		monthString8=String.valueOf(month8);
		monthString9=String.valueOf(month9);
		monthString10=String.valueOf(month10);
		monthString11=String.valueOf(month11);
		monthString12=String.valueOf(month12);
		monthString13=String.valueOf(month13);
		if (monthString1.length()==1) {
			monthString1="0"+monthString1;
		}
		if (monthString1.length()==1) {
			monthString1="0"+monthString1;
		}
		if (monthString2.length()==1) {
			monthString2="0"+monthString2;
		}
		if (monthString3.length()==1) {
			monthString3="0"+monthString3;
		}
		if (monthString4.length()==1) {
			monthString4="0"+monthString4;
		}
		if (monthString5.length()==1) {
			monthString5="0"+monthString5;
		}
		if (monthString6.length()==1) {
			monthString6="0"+monthString6;
		}
		if (monthString7.length()==1) {
			monthString7="0"+monthString7;
		}
		if (monthString8.length()==1) {
			monthString8="0"+monthString8;
		}
		if (monthString9.length()==1) {
			monthString9="0"+monthString9;
		}
		if (monthString10.length()==1) {
			monthString10="0"+monthString10;
		}
		if (monthString11.length()==1) {
			monthString11="0"+monthString11;
		}
		if (monthString12.length()==1) {
			monthString12="0"+monthString12;
		}
		if (monthString13.length()==1) {
			monthString13="0"+monthString13;
		}
		Timestamp timestamp1=Timestamp.valueOf(year1+"-"+monthString1+"-"+"01"+" 00:00:00");
		Timestamp timestamp2=Timestamp.valueOf(year2+"-"+monthString2+"-"+"01"+" 00:00:00");
		Timestamp timestamp3=Timestamp.valueOf(year3+"-"+monthString3+"-"+"01"+" 00:00:00");
		Timestamp timestamp4=Timestamp.valueOf(year4+"-"+monthString4+"-"+"01"+" 00:00:00");
		Timestamp timestamp5=Timestamp.valueOf(year5+"-"+monthString5+"-"+"01"+" 00:00:00");
		Timestamp timestamp6=Timestamp.valueOf(year6+"-"+monthString6+"-"+"01"+" 00:00:00");
		Timestamp timestamp7=Timestamp.valueOf(year7+"-"+monthString7+"-"+"01"+" 00:00:00");
		Timestamp timestamp8=Timestamp.valueOf(year8+"-"+monthString8+"-"+"01"+" 00:00:00");
		Timestamp timestamp9=Timestamp.valueOf(year9+"-"+monthString9+"-"+"01"+" 00:00:00");
		Timestamp timestamp10=Timestamp.valueOf(year10+"-"+monthString10+"-"+"01"+" 00:00:00");
		Timestamp timestamp11=Timestamp.valueOf(year11+"-"+monthString11+"-"+"01"+" 00:00:00");
		Timestamp timestamp12=Timestamp.valueOf(year12+"-"+monthString12+"-"+"01"+" 00:00:00");
		Timestamp timestamp13=Timestamp.valueOf(year13+"-"+monthString13+"-"+"01"+" 00:00:00");
		long timestamp;
	    Date date=new Date();
		DateFormat dformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //设置日期格式
		List<StayRegisterPo> list1=stayRegisterService.selectShuJuTongJi(timestamp2,timestamp1);
		List<StayRegisterPo> list2=stayRegisterService.selectShuJuTongJi(timestamp3,timestamp2);
		List<StayRegisterPo> list3=stayRegisterService.selectShuJuTongJi(timestamp4,timestamp3);
		List<StayRegisterPo> list4=stayRegisterService.selectShuJuTongJi(timestamp5,timestamp4);
		List<StayRegisterPo> list5=stayRegisterService.selectShuJuTongJi(timestamp6,timestamp5);
		List<StayRegisterPo> list6=stayRegisterService.selectShuJuTongJi(timestamp7,timestamp6);
		List<StayRegisterPo> list7=stayRegisterService.selectShuJuTongJi(timestamp8,timestamp7);
		List<StayRegisterPo> list8=stayRegisterService.selectShuJuTongJi(timestamp9,timestamp8);
		List<StayRegisterPo> list9=stayRegisterService.selectShuJuTongJi(timestamp10,timestamp9);
		List<StayRegisterPo> list10=stayRegisterService.selectShuJuTongJi(timestamp11,timestamp10);
		List<StayRegisterPo> list11=stayRegisterService.selectShuJuTongJi(timestamp12,timestamp11);
		List<StayRegisterPo> list12=stayRegisterService.selectShuJuTongJi(timestamp13,timestamp12);
		for (int i = 0; i < list1.size(); i++) {
				if (list1.get(i).getReceiveTargetID()==2) {
					sZongFeiYong1+=list1.get(i).getSumConst();
				}else {
					tZongFeiYong1+=list1.get(i).getSumConst();
				}
		}
		for (int i = 0; i < list2.size(); i++) {
			if (list2.get(i).getReceiveTargetID()==2) {
				sZongFeiYong2+=list2.get(i).getSumConst();
			}else {
				tZongFeiYong2+=list2.get(i).getSumConst();
			}
	    }
		for (int i = 0; i < list3.size(); i++) {
			if (list3.get(i).getReceiveTargetID()==2) {
				sZongFeiYong3+=list3.get(i).getSumConst();
			}else {
				tZongFeiYong3+=list3.get(i).getSumConst();
			}
	    }
		for (int i = 0; i < list4.size(); i++) {
			if (list4.get(i).getReceiveTargetID()==2) {
				sZongFeiYong4+=list4.get(i).getSumConst();
			}else {
				tZongFeiYong4+=list4.get(i).getSumConst();
			}
	    }
		for (int i = 0; i < list5.size(); i++) {
			if (list5.get(i).getReceiveTargetID()==2) {
				sZongFeiYong5+=list5.get(i).getSumConst();
			}else {
				tZongFeiYong5+=list5.get(i).getSumConst();
			}
	    }
		for (int i = 0; i < list6.size(); i++) {
			if (list6.get(i).getReceiveTargetID()==2) {
				sZongFeiYong6+=list6.get(i).getSumConst();
			}else {
				tZongFeiYong6+=list6.get(i).getSumConst();
			}
	    }
		for (int i = 0; i < list7.size(); i++) {
			if (list7.get(i).getReceiveTargetID()==2) {
				sZongFeiYong7+=list7.get(i).getSumConst();
			}else {
				tZongFeiYong7+=list7.get(i).getSumConst();
			}
	    }
		for (int i = 0; i < list8.size(); i++) {
			if (list8.get(i).getReceiveTargetID()==2) {
				sZongFeiYong8+=list8.get(i).getSumConst();
			}else {
				tZongFeiYong8+=list8.get(i).getSumConst();
			}
	    }
		for (int i = 0; i < list9.size(); i++) {
			if (list9.get(i).getReceiveTargetID()==2) {
				sZongFeiYong9+=list9.get(i).getSumConst();
			}else {
				tZongFeiYong9+=list9.get(i).getSumConst();
			}
	    }
		for (int i = 0; i < list10.size(); i++) {
			if (list10.get(i).getReceiveTargetID()==2) {
				sZongFeiYong10+=list10.get(i).getSumConst();
			}else {
				tZongFeiYong10+=list10.get(i).getSumConst();
			}
	    }
		for (int i = 0; i < list11.size(); i++) {
			if (list11.get(i).getReceiveTargetID()==2) {
				sZongFeiYong11+=list11.get(i).getSumConst();
			}else {
				tZongFeiYong11+=list11.get(i).getSumConst();
			}
	    }
		for (int i = 0; i < list12.size(); i++) {
			if (list12.get(i).getReceiveTargetID()==2) {
				sZongFeiYong12+=list12.get(i).getSumConst();
			}else {
				tZongFeiYong12+=list12.get(i).getSumConst();
			}
	    }
		mv=new ModelAndView("/dateview/shili");
		mv.addObject("sZongFeiYong1",sZongFeiYong1);
		mv.addObject("sZongFeiYong2",sZongFeiYong2);
		mv.addObject("sZongFeiYong3",sZongFeiYong3);
		mv.addObject("sZongFeiYong4",sZongFeiYong4);
		mv.addObject("sZongFeiYong5",sZongFeiYong5);
		mv.addObject("sZongFeiYong6",sZongFeiYong6);
		mv.addObject("sZongFeiYong7",sZongFeiYong7);
		mv.addObject("sZongFeiYong8",sZongFeiYong8);
		mv.addObject("sZongFeiYong9",sZongFeiYong9);
		mv.addObject("sZongFeiYong10",sZongFeiYong10);
		mv.addObject("sZongFeiYong11",sZongFeiYong11);
		mv.addObject("sZongFeiYong12",sZongFeiYong12);
		mv.addObject("tZongFeiYong1",tZongFeiYong1);
		mv.addObject("tZongFeiYong2",tZongFeiYong2);
		mv.addObject("tZongFeiYong3",tZongFeiYong3);
		mv.addObject("tZongFeiYong4",tZongFeiYong4);
		mv.addObject("tZongFeiYong5",tZongFeiYong5);
		mv.addObject("tZongFeiYong6",tZongFeiYong6);
		mv.addObject("tZongFeiYong7",tZongFeiYong7);
		mv.addObject("tZongFeiYong8",tZongFeiYong8);
		mv.addObject("tZongFeiYong9",tZongFeiYong9);
		mv.addObject("tZongFeiYong10",tZongFeiYong10);
		mv.addObject("tZongFeiYong11",tZongFeiYong11);
		mv.addObject("tZongFeiYong12",tZongFeiYong12);
		mv.addObject("year1",year1+"年"+month1+"月");
		mv.addObject("year2",year2+"年"+month2+"月");
		mv.addObject("year3",year3+"年"+month3+"月");
		mv.addObject("year4",year4+"年"+month4+"月");
		mv.addObject("year5",year5+"年"+month5+"月");
		mv.addObject("year6",year6+"年"+month6+"月");
		mv.addObject("year7",year7+"年"+month7+"月");
		mv.addObject("year8",year8+"年"+month8+"月");
		mv.addObject("year9",year9+"年"+month9+"月");
		mv.addObject("year10",year10+"年"+month10+"月");
		mv.addObject("year11",year11+"年"+month11+"月");
		mv.addObject("year12",year12+"年"+month12+"月");
		return mv;
	}

}
