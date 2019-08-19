package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.Pojo.Student;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object Handler)
			 throws Exception{
		//获取session
		Student login = (Student) request.getSession().getAttribute("login");
		if(login == null) {
			System.out.println("没有登录...");
//			request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
//			return false;
			return true;
		}else {
			if(login.getRoleid().equals("0")) {
				System.out.println("管理员登录...");
				return true;
			}else if(login.getRoleid().equals("1")) {
				System.out.println("学生登录...");
				return true;
			}else if(login.getRoleid().equals("2")) {
				System.out.println("教师登录...");
				return true;
			}
		}
		
		return true;
		
	}
	@Override
	public void postHandle(HttpServletRequest request,HttpServletResponse response,Object Handler,ModelAndView mav) {
		if(mav != null) {
			mav.addObject("key","1234");
		}
	}

}
