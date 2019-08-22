/**
 * @author XuMenglin
 * @date 2019年8月9日
 *
 */
package com.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Pojo.Course;
import com.Service.CourseService;
import com.alibaba.fastjson.JSONObject;
import com.util.PageHelper2;

/**
 * <p>Title: CourseController</p>
 * <p>Description: 课表控制器</p>
 * @author XuMenglin
 * @date 2019年8月9日
 */
@RequestMapping(value = "/course")
@Controller
public class CourseController {
	
	@Autowired
	CourseService courseService;
	
	/**
	 *<p>Title: selectCourse</p>
	 *<p>Description: 学生查看可选课程</p>
	 * @param record
	 * @return
	 */
	@RequestMapping(value = "/selectCourse")
	public ModelAndView selectCourse(Course record) {
		ModelAndView mav = new ModelAndView();
		List<Course> cl = new ArrayList<Course>();
		cl = courseService.studentSelectClass(record);
		mav.addObject("cl",cl);
		mav.setViewName("studentSelectClass");
		return mav;
		
	}
	
	/**
	 *<p>Title: seeCourse</p>
	 *<p>Description: 管理员查看课程</p>
	 * @param record
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/seeCourse")
	public  PageHelper2<Course> seeCourse(@RequestBody Course record){
		PageHelper2<Course> pagehelper2 = new PageHelper2<Course>();
		Integer total1 = courseService.getTotal1(record);
		pagehelper2.setTotal(total1);
		List<Course> cl = courseService.studentSelectClass1(record);
		pagehelper2.setRows(cl);
		return pagehelper2;
	}
	
	
	
	
	
	/**
	 *<p>Title: insertCourse</p>
	 *<p>Description: 添加课程</p>
	 * @param record
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/insertCourse")
	public String insertCourse(@RequestBody Course record) {
		JSONObject json = new JSONObject();
		int a = courseService.insert(record);
		if(a == 1){
			json.put("key", "success");
			return json.toJSONString();
		}else {
			json.put("key", "error");
			return json.toJSONString();
		}
	}

}
