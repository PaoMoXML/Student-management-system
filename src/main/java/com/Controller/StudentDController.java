package com.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Pojo.StudentD;
import com.Service.StudentDService;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.util.Page;
import com.util.PageHelper2;

/**
 * <p>Title: StudentDController</p>
 * <p>Description: 学生具体信息查询控制器</p>
 * @author XuMenglin
 * @date 2019年8月7日
 */
@Controller
@RequestMapping(value = "/studentD")
public class StudentDController {
	@Autowired
	StudentDService studentDService;
	
	/**
	 *<p>Title: listStudentd</p>
	 *<p>Description: 学生信息表（普通分页） </p>
	 * @param page
	 * @param name
	 * @return
	 */
	@RequestMapping("/listStudentD")
	public ModelAndView listStudentd(Page page,String name) {
		int total = studentDService.total();
		page.calculateLast(total);
		// 边界条件判断
		// 首页，点击上一页，页面没有负数
		int start = page.getStart();
		if (start < 0) {
			page.setStart(0);
		}
		// 末页，点击下一页,开始页面不能超过最后一页
		if (start > page.getLast()) {
			page.setStart(page.getLast());
		}
		
		ModelAndView mav = new ModelAndView();
		List<StudentD> sd = studentDService.stuList(page,name);
		
		// 放入转发参数  
		mav.addObject("sd",sd);
		// 放入jsp路径
		mav.setViewName("manager");
		return mav;
	}
	
	
	
	
	/**
	 *<p>Title: listStudentD2</p>
	 *<p>Description: PageHelper分页</p>
	 * @param page
	 * @param name
	 * @return
	 */
	@RequestMapping("/listStudentD2")
	public ModelAndView listStudentD2(Page page,String name) {
		ModelAndView mav = new ModelAndView();
		PageHelper.offsetPage(page.getStart(),5);
		List<StudentD> sd = studentDService.stuList2(name);
		int total = (int) new PageInfo<>(sd).getTotal();
		page.calculateLast(total);
		mav.addObject("sd",sd);
		mav.setViewName("teacher");
		return mav;
		
		
	}

	/**
	 *<p>Title: stuDetail</p>
	 *<p>Description:学生查询自己的信息 </p>
	 * @param record
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/stuDetail")
	public String stuDetail(@RequestBody StudentD record) {
		JSONObject json = new JSONObject();
		StudentD stu = new StudentD();
		stu = studentDService.stuDetail(record);
		json.put("studentD", JSONObject.toJSON(stu));
		return json.toJSONString();
	}


	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/stuList") public String stuList(){ JSONObject json
	 * = new JSONObject(); List<StudentD> studentDList = new ArrayList<>();
	 * studentDList = studentDService.studentdList();
	 * json.put("stuList",JSONObject.toJSON(studentDList)); return
	 * json.toJSONString(); }
	 */
	
	/**
	 *<p>Title: stuTable</p>
	 *<p>Description: 前端分页 学生列表查询</p>
	 * @param record
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/stuTable")
	public List<StudentD> stuTable(@RequestBody StudentD record){
		List<StudentD> list = studentDService.studentdList(record);
		return list;
	}
	
	
	/**
	 *<p>Title: stuTable</p>
	 *<p>Description: 服务器分页 学生列表查询</p>
	 * @param record
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/stuTable2")
	public PageHelper2<StudentD> stuTable2(@RequestBody StudentD record,HttpServletRequest request){
		PageHelper2<StudentD> pageHelper2 = new  PageHelper2<StudentD>();
		//统计总记录数
		Integer total = studentDService.getTotal(record);
		pageHelper2.setTotal(total);
		//查询当前页实体对象
		List<StudentD> list = studentDService.studentdList(record);
		pageHelper2.setRows(list);
		return pageHelper2;
	}
	
	/**
	 *<p>Title: addStu</p>
	 *<p>Description: 增加学生</p>
	 * @param record
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/addStu")
	public String addStu(@RequestBody StudentD record) {
		int code = studentDService.total();
		String StuCode = "201900"+code;
		record.setStuid(StuCode.toString());
		record.setState("1");
		int a = studentDService.insert(record);
		JSONObject json = new JSONObject();
		if(a==1) {
			json.put("key", "success");			
		}else {
			json.put("key", "error");
		}
		return json.toJSONString();
		
	}
}
