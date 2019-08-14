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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Pojo.Course;
import com.Service.CourseService;
import com.alibaba.fastjson.JSONObject;

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
	
	@ResponseBody
	@RequestMapping(value = "/insertCourse")
	public String insertCourse(Course record) {
		JSONObject json = new JSONObject();
		int a = courseService.insert(record);
		if(a == 1) {
			//1代表插入成功
			json.put("key", 1);
			return json.toJSONString();
		}else {
			//2代表插入失败
			json.put("key", 2);
			return json.toJSONString();
		}
	}

}
