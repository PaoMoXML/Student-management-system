package com.Controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Pojo.StudentCourse;
import com.Service.StudentCourseService;
import com.alibaba.fastjson.JSONObject;

/**
 * <p>Title: StudentCourseController</p>
 * <p>Description: 学生成绩+课程中间表查询控制器</p>
 * @author XuMenglin
 * @date 2019年8月7日
 */
@Controller
@RequestMapping(value = "/studentCourse")
public class StudentCourseController {
	
	@Autowired
	StudentCourseService studentCourseService;

	/**
	 *<p>Title: course</p>
	 *<p>Description: 延迟查询学生的课程信息 教师用</p>
	 * @param stuid
	 * @return
	 */
	@RequestMapping(value = "/course",method = RequestMethod.GET)
	public  ModelAndView course(String stuid) {
		ModelAndView mav = new ModelAndView();
		List<StudentCourse> list = new ArrayList<>();
		list = studentCourseService.selectAll(stuid);
		mav.addObject("sc",list);
		mav.setViewName("teado");
		return mav;
	}
	
	/**
	 *<p>Title: course</p>
	 *<p>Description: 延迟查询学生的课程信息 学生用</p>
	 * @param stuid
	 * @return
	 */
	@RequestMapping(value = "/course2",method = RequestMethod.GET)
	public ModelAndView course2(String stuid) {
		ModelAndView mav = new ModelAndView();
		List<StudentCourse> list = new ArrayList<>();
		list = studentCourseService.selectAll(stuid);
		mav.addObject("sc",list);
		mav.setViewName("studo");
		return mav;
	}
	
	
	
	/**
	 *<p>Title: updateGrade</p>
	 *<p>Description: 录入学生成绩 json版</p>
	 * @param record
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@ResponseBody
	@RequestMapping(value = "/updateGrade")
	public String updateGrade(@RequestBody StudentCourse record){
		System.out.println("ssm接收浏览器提交的json，并转换成StudentCourse对象："+record);
		studentCourseService.updateGrade(record);
		JSONObject json= new JSONObject();
        json.put("msg", "success");
        return json.toJSONString();
	}
	
	
	/**
	 *<p>Title: selectGrade</p>
	 *<p>Description:录入学生前的查询 </p>
	 * @param record
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/selectGrade")
	public String selectGrade(@RequestBody StudentCourse record) {
		StudentCourse sc = new StudentCourse();
		sc = studentCourseService.selectGrade(record);
		JSONObject json = new JSONObject();
		json.put("detail",JSONObject.toJSON(sc));
		//1表示处理成功
		json.put("msg",1);
		return json.toJSONString();
	}
	
	/**
	 *<p>Title: checkGrade</p>
	 *<p>Description:检查学生是否已经选了这门课 </p>
	 * @param record
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/checkGrade")
	public String checkGrade(@RequestBody StudentCourse record) {
		JSONObject json = new JSONObject();
		List<StudentCourse> scl = new ArrayList<StudentCourse>();
		scl = studentCourseService.check(record);
		int a = scl.size();
		System.out.println(a);
		if(a >= 1) {
			//key为1时 此课程不可选
			json.put("key", 1);
			return json.toJSONString();
		}else {
			//key为2时，此课程可选
			json.put("key", 2);
			return json.toJSONString();
		}
	}
	
	/**
	 *<p>Title: insertCourse</p>
	 *<p>Description: 学生选课-->插入StudentCourse表</p>
	 * @param record
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/insertCourse")
	public String insertCourse(@RequestBody StudentCourse record) {
		JSONObject json = new JSONObject();
		int a = studentCourseService.insertCourse(record);
		if(a == 1) {
			//选课成功
			json.put("key", 3);
			return json.toJSONString();
		}else {
			//选课失败
			json.put("key", 4);
			return json.toJSONString();
		}
		
	}
	
	/**
	 *<p>Title: delCourse</p>
	 *<p>Description: 退课 学生删除已选课程</p>
	 * @param record
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/delCourse")
	public String delCourse(@RequestBody StudentCourse record) {
		JSONObject json = new JSONObject();
		int a = studentCourseService.delCourse(record);
		if(a == 1) {
			//删除成功
			json.put("key", 5);
			return json.toJSONString();
		}else {
			//删除失败
			json.put("key", 6);
			return json.toJSONString();
		}
		
	}
	
	
}
