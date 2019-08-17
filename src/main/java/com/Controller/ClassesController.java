package com.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Pojo.Classes;
import com.Service.ClassesService;
/**
 * 
* <p>Title: ClassesController</p>  
* <p>Description: 班级信息表控制器</p>  
* @author XuMenglin  
* @date 2019年8月7日
 */
@RequestMapping(value = "/classes")
@Controller
public class ClassesController {
	
	@Autowired
	ClassesService classesService;
	
	
	/**
	 *<p>Title: seeClasses</p>
	 *<p>Description:教师用查询班级信息 </p>
	 * @param record
	 * @return
	 */
	@RequestMapping(value = "/seeClasses")
	public ModelAndView seeClasses(Classes record) {
		ModelAndView mav = new ModelAndView();
		List<Classes> cList = new ArrayList<>();
		cList =	classesService.selectClasses(record);
		mav.addObject("classesInfo",cList);
		mav.setViewName("teacher");
		return mav;
	}
	
	
	/**
	 *<p>Title: seeClasses2</p>
	 *<p>Description:管理员用查询班级信息 </p>
	 * @param record
	 * @return
	 */
	@RequestMapping(value = "/seeClasses2")
	public ModelAndView seeClasses2(Classes record) {
		ModelAndView mav = new ModelAndView();
		List<Classes> cList = new ArrayList<>();
		cList =	classesService.selectClasses(record);
		mav.addObject("classesInfo",cList);
		mav.setViewName("manager");
		return mav;
	}




}
