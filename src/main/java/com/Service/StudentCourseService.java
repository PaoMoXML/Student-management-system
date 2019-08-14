package com.Service;

import java.util.List;

import com.Pojo.StudentCourse;

/**
 * <p>Title: StudentCourseService</p>
 * <p>Description: </p>
 * @author XuMenglin
 * @date 2019年8月7日
 */
public interface StudentCourseService {
	
	/**
	 *<p>Title: selectAll</p>
	 *<p>Description: 延迟查询所有学生信息</p>
	 * @param stuid
	 * @return
	 */
	List<StudentCourse> selectAll(String stuid);
	
	/**
	 *<p>Title: updateGrade</p>
	 *<p>Description: 录入学生成绩</p>
	 * @param record
	 * @return
	 */
	int updateGrade(StudentCourse record);
	
	/**
	 *<p>Title: selectGrade</p>
	 *<p>Description: 录入学生成绩前的查询</p>
	 * @param record
	 * @return
	 */
	StudentCourse selectGrade(StudentCourse record);
	
    /**
     *<p>Title: check</p>
     *<p>Description: 检查学生是否已选此课程</p>
     * @param record
     * @return
     */
    List<StudentCourse> check(StudentCourse record);

    /**
     *<p>Title: insertCourse</p>
     *<p>Description: 学生选课-->插入 </p>
     * @param record
     * @return
     */
    int insertCourse(StudentCourse record);
    
    /**
     *<p>Title: delCourse</p>
     *<p>Description: 学生删除已选课程</p>
     * @param record
     * @return
     */
    int delCourse(StudentCourse record);

}
