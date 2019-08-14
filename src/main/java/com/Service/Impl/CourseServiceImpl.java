/**
 * @author XuMenglin
 * @date 2019年8月9日
 *
 */
package com.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Dao.CourseMapper;
import com.Pojo.Course;
import com.Service.CourseService;

/**
 * <p>Title: CourseServiceImpl</p>
 * <p>Description: 课表 </p>
 * @author XuMenglin
 * @date 2019年8月9日
 */
@Service("CourseService")
public class CourseServiceImpl implements CourseService{

	@Autowired
	CourseMapper courseMapper;
	
	/**
	 * <p>Title: studentSelectClass</p>
	 * <p>Description: 学生选课查询</p>
	 * @param record
	 * @return
	 * @see com.Service.CourseService#studentSelectClass(com.Pojo.Course)
	 */
	@Override
	public List<Course> studentSelectClass(Course record) {
		return courseMapper.studentSelectClass(record);
	}

	/**
	 * <p>Title: insert</p>
	 * <p>Description:插入课程 </p>
	 * @param record
	 * @return
	 * @see com.Service.CourseService#insert(com.Pojo.Course)
	 */
	@Override
	public int insert(Course record) {
		return courseMapper.insert(record);
	}
	

}
