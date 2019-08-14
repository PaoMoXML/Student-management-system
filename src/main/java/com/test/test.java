package com.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.Pojo.Classes;
import com.Service.ClassesService;

public class test extends Junit4Test{
	
	@Autowired
	private ClassesService classesService;
	
	@Test
	@Transactional
	@Rollback(false)//防止事务自动回滚
	public void test1 () {
		testc();
	}
	private void testc() {
		Classes classes = new Classes();
		int id = 1;
		classes = classesService.selectByPrimaryKey(id);
		System.out.println(classes.getClassid());
		System.out.println(classes.getCourseid());
	}

}
