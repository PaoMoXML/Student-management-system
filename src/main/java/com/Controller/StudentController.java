package com.Controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Pojo.Student;
import com.Service.StudentService;
import com.alibaba.fastjson.JSONObject;

/**
 * 
 * <p>Title: StudentController</p>  
 * <p>Description: 登录 注册 控制器</p>  
 * @author XuMenglin  
 * @date 2019年8月7日
 */
@Controller
@RequestMapping(value = "/student")
public class StudentController {
	
	boolean b;
	@Autowired
	StudentService studentService;
	
	/**
	 *<p>Title: loginPage</p>
	 *<p>Description:跳转到登录页面 </p>
	 * @return
	 */
	@RequestMapping(value = "/Loginpage")
	public String loginPage() {
		return "login";
		}
	
	/**
	 *<p>Title: searchStudent</p>
	 *<p>Description:教师用搜索信息 </p>
	 * @param record
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/searchStudent")
	public String searchStudent(@RequestBody Student record) {
		//教师用
		record.setRoleid("2");
		record.setState("1");
		Student stu =  new Student();
		stu = studentService.stuLogin(record);
		JSONObject json= new JSONObject();
		json.put("stuInfo", JSONObject.toJSON(stu));
		return json.toJSONString();
	}
	
	
	/**
	 *<p>Title: searchStudent</p>
	 *<p>Description:学生用搜索信息 </p>
	 * @param record
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/searchStudent2")
	public String searchStudent2(@RequestBody Student record) {
		//学生用
		record.setRoleid("1");
		record.setState("1");
		Student stu =  new Student();
		stu = studentService.stuLogin(record);
		JSONObject json= new JSONObject();
		json.put("stuInfo", JSONObject.toJSON(stu));
		return json.toJSONString();
	}
	
	/**
	 *<p>Title: stuLogin</p>
	 *<p>Description: 学生、教师、管理员登录，  管理员roleid=0 ，学生roleid=1，教师roleid=2</p>
	 * @param record
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/Login",method = RequestMethod.GET)
	public String stuLogin(Student record,Model model,HttpServletRequest req) throws Exception{
		String a = "0";
		String b = "1";
		String c = "2";
		Student stu = new Student();
		//state 状态1为可用 2为不可用
		record.setState("1");
		stu = studentService.stuLogin(record);
		model.addAttribute("msg", "登录成功");
		//教师页面用URL
		String url = "redirect:http:/ssm10/jsp/welcome.jsp";
		//管理员页面用URL
		String url2 = "redirect:http:/ssm10/jsp/welcome.jsp";
		if(stu == null) {
			System.out.println("无法登陆");
		}else if(record.getPassword().equals(stu.getPassword())) {
			if(record.getRoleid().equals(a)) {
				//将管理员信息放入session
				req.getSession().setAttribute("manager",stu);
				return url2;
			}else if(record.getRoleid().equals(b)) {
				//将学生信息放入session
				req.getSession().setAttribute("student", stu);
				return url;
			}else if(record.getRoleid().equals(c)) {
				//将教师信息放入session
				req.getSession().setAttribute("teacher",stu);
				return url;
			}
		}else {
				return "error";
		}
		return "error";
	}
	
	/**
	 *<p>Title: registered</p>
	 *<p>Description:注册 </p>
	 * @param record
	 * @return
	 */
	@RequestMapping(value = "/registered")
	public String registered(Student record) {
		record.setState("1");
		int a ;
		String b;
		if(studentService.stuLogin(record)==null) {
			a = studentService.insert(record);
			if(a==1) {
				return"success";
			}else {
				return"error";
			}
		}else {
			b="error";
		}
		return b;
	}
	
	/**
	 *<p>Title: reSetPassword</p>
	 *<p>Description:重置密码 </p>
	 * @param record
	 * @return
	 */
	@RequestMapping(value = "/reSetPassword")
	public String reSetPassword(Student record) {
		record.setState("1");
		//重置密码为：123456
		record.setPassword("123456");
		int a ;
		String b;
		a = studentService.reSetPassword(record);
		if(a==1) {
			b="success";
		}else {
			b="error";
		}
		return b;
	}
	
	/**
	 *<p>Title: reSetPassword2</p>
	 *<p>Description: 教师学生修改密码</p>
	 * @param record
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/reSetPassword2")
	public String reSetPassword2(@RequestBody Student record) {
		record.setState("1");
		int a;
		a = studentService.reSetPassword(record);
		JSONObject json= new JSONObject();
        json.put("key", "ok");
		return json.toJSONString();
	}
	
	

}
