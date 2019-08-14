package com.Service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Dao.TeacherMapper;
import com.Pojo.Teacher;
import com.Service.TeacherService;
@Service("TeacherService")
public class TeacherServiceImpl implements TeacherService{
	
	@Autowired
	TeacherMapper teacherMapper;

	@Override
	public Teacher teaLogin(Teacher record) {//教师登录
		
		teacherMapper.teaLogin(record);
		
		return null;
	}

}
