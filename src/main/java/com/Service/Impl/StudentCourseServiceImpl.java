package com.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Dao.StudentCourseMapper;
import com.Pojo.StudentCourse;
import com.Service.StudentCourseService;
/**
 * <p>Title: StudentCourseServiceImpl</p>
 * <p>Description: 学生课程中间表查询</p>
 * @author XuMenglin
 * @date 2019年8月7日
 */
@Service
public class StudentCourseServiceImpl implements StudentCourseService{

	@Autowired
	StudentCourseMapper studentCourseMapper;
	
	/**
	 *(non-Javadoc)
	 * <p>Title: selectAll</p>
	 * <p>Description: 延迟查询该学生的课程信息</p>
	 * @param stuid
	 * @return
	 * @see com.Service.StudentCourseService#selectAll(java.lang.String)
	 */
	@Override
	public List<StudentCourse> selectAll(String stuid) {
		return studentCourseMapper.selectAll(stuid);
	}

	/**
	 *(non-Javadoc)
	 * <p>Title: updateGrade</p>
	 * <p>Description: 修改学生成绩 </p>
	 * @param record
	 * @return
	 * @see com.Service.StudentCourseService#updateGrade(com.Pojo.StudentCourse)
	 */
	@Override
	public int updateGrade(StudentCourse record) {
		return studentCourseMapper.updateGrade(record);
	}

	/**
	 *(non-Javadoc)
	 * <p>Title: selectGrade</p>
	 * <p>Description: 学生查看课程信息 </p>
	 * @param record
	 * @return
	 * @see com.Service.StudentCourseService#selectGrade(com.Pojo.StudentCourse)
	 */
	@Override
	public StudentCourse selectGrade(StudentCourse record) {
		return studentCourseMapper.selectGrade(record);
	}

	/**
	 * <p>Title: check</p>
	 * <p>Description:检查学生是否已选此课程 </p>
	 * @param record
	 * @return
	 * @see com.Service.StudentCourseService#check(com.Pojo.StudentCourse)
	 */
	@Override
	public List<StudentCourse> check(StudentCourse record) {
		return studentCourseMapper.check(record);
	}

	/**
	 * <p>Title: insertCourse</p>
	 * <p>Description: 学生选课</p>
	 * @param record
	 * @return
	 * @see com.Service.StudentCourseService#insertCourse(com.Pojo.StudentCourse)
	 */
	@Override
	public int insertCourse(StudentCourse record) {
		return studentCourseMapper.insertCourse(record);
	}

	/**
	 * <p>Title: delCourse</p>
	 * <p>Description: 学生删除已选课程</p>
	 * @param record
	 * @return
	 * @see com.Service.StudentCourseService#delCourse(com.Pojo.StudentCourse)
	 */
	@Override
	public int delCourse(StudentCourse record) {
		return studentCourseMapper.delCourse(record);
	}
	
}

