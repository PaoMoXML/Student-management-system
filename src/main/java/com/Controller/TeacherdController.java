/**
 * @author XuMenglin
 * @date 2019年8月7日
 *
 */
package com.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Pojo.TeacherD;
import com.Service.TeacherdService;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.util.Page;
import com.util.PageHelper2;

/**
 * <p>Title: TeacherdController</p>
 * <p>Description: 教师具体信息查询控制器 </p>
 * @author XuMenglin
 * @date 2019年8月7日
 */
@Controller
@RequestMapping(value = "/teacherd")
public class TeacherdController {
	
	@Autowired
	TeacherdService teacherdService;
	
	/**
	 *<p>Title: teacherD</p>
	 *<p>Description: 教师查询自己的信息</p>
	 * @param record
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/teacherD")
	public String teacherd(@RequestBody TeacherD record) {
		JSONObject json = new JSONObject();
		TeacherD td = new TeacherD();
		td = teacherdService.teaDetail(record);
		json.put("teaDetail", JSONObject.toJSON(td));
		json.put("msg","success");
		return json.toJSONString();
	}
	
	/**
	 *<p>Title: teaList</p>
	 *<p>Description:管理员查询教师列表 </p>
	 * @param record
	 * @param page2
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/teaList")
	public ModelAndView teaList(TeacherD record,Page page2) {
		ModelAndView mav = new ModelAndView();
		PageHelper.offsetPage(page2.getStart(),5);
		List<TeacherD> list = teacherdService.teaList(record);
		int total = (int) new PageInfo<>(list).getTotal();
		page2.calculateLast(total);
		mav.addObject("tl",list);
		mav.setViewName("manager");
		return mav;
	}
	
	/**
	 *<p>Title: teacherTable</p>
	 *<p>Description:(框架)教师列表服务器分页 </p>
	 * @param record
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/teacherTable")
	public PageHelper2<TeacherD> teacherTable(@RequestBody TeacherD record){
		PageHelper2<TeacherD> tl = new PageHelper2<TeacherD>();
		//统计总记录数
		Integer total = teacherdService.getTotal(record);
		tl.setTotal(total);
		//查询当前页实体对象
		List<TeacherD> list = teacherdService.teaTable(record);
		tl.setRows(list);
		System.out.println(list.toString());
		return tl;
		
	}
	
	/**
	 *<p>Title: delTeacherd</p>
	 *<p>Description: 删除教师信息</p>
	 * @param record
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/delTeacherd")
	public String delTeacherd(@RequestBody TeacherD record) {
		int a = teacherdService.del(record);
		JSONObject json = new JSONObject();
		if(a == 1) {
			json.put("key", "success");
		}
		else {
			json.put("key", "error");
		}
		return json.toJSONString();
	}

	/**
	 *<p>Title: updateTeaInfo</p>
	 *<p>Description:修改教师信息 </p>
	 * @param record
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/updateTeaInfo")
	public String updateTeaInfo(@RequestBody TeacherD record) {
		int a = teacherdService.updateTeaInfo(record);
		JSONObject json = new JSONObject();
		if(a == 1) {
			json.put("key","success");
		}else {
			json.put("key","error");
		}
		return json.toJSONString();
		
	}
	
	/**
	 *<p>Title: addTea</p>
	 *<p>Description: 添加教师</p>
	 * @param record
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/addTea")
	public String addTea(@RequestBody TeacherD record) {
		int a = teacherdService.insert(record);
		JSONObject json = new JSONObject();
		if(a == 1) {
			json.put("key", "success");
		}else {
			json.put("key", "error");
		}
		return json.toJSONString();
		
	}
}
