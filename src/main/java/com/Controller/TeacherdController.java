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
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.util.Page;

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
	
	

}
