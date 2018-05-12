package com.gx.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gx.po.StayRegisterPo;
import com.gx.po.UserPo;
import com.gx.service.StayRegisterService;
import com.gx.service.UserService;

@Controller
@RequestMapping("/Login")
public class Login {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private StayRegisterService stayRegisterService;
	
	@RequestMapping("/tologin")
	public String tologin(){
		return "/login/login";
	}
	
	@RequestMapping("/tomain")
	public ModelAndView tomain(UserPo user){
		ModelAndView mv=null;
		double zongFeiYongOne=0;
		double zongFeiYongTwo=0;
		UserPo u=userService.selectLogin(user);
		List<StayRegisterPo> list=stayRegisterService.selectAll();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getReceiveTargetID()==2) {
				zongFeiYongOne+=list.get(i).getSumConst();
			}else {
				zongFeiYongTwo+=list.get(i).getSumConst();
			}
		}
		
		if (u!=null) {
			mv=new ModelAndView("/main/main");
		}else {
			mv=new ModelAndView("/login/login");
		}
		mv.addObject("zongFeiYongOne",zongFeiYongOne);
		mv.addObject("zongFeiYongTwo",zongFeiYongTwo);
		return mv;
	}
	

}
