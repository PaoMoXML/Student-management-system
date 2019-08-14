package com.Dao;

import com.Pojo.StudentCourse;
import com.Pojo.StudentCourseExample;

import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * <p>Title: StudentCourseMapper</p>
 * <p>Description: </p>
 * @author XuMenglin
 * @date 2019年8月7日
 */
public interface StudentCourseMapper {

    long countByExample(StudentCourseExample example);

    int deleteByExample(StudentCourseExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(StudentCourse record);

    int insertSelective(StudentCourse record);

    List<StudentCourse> selectByExample(StudentCourseExample example);

    StudentCourse selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") StudentCourse record, @Param("example") StudentCourseExample example);

    int updateByExample(@Param("record") StudentCourse record, @Param("example") StudentCourseExample example);

    int updateByPrimaryKeySelective(StudentCourse record);

    int updateByPrimaryKey(StudentCourse record);

    /**
     *<p>Title: selectAll</p>
     *<p>Description: 延迟查询</p>
     * @param stuid
     * @return
     */
    List<StudentCourse> selectAll(String stuid);
    
    /**
     *<p>Title: UpdateGrade</p>
     *<p>Description: 录入学生成绩</p>
     * @param record
     * @return
     */
    int updateGrade(StudentCourse record);
    
    /**
     *<p>Title: selectGrade</p>
     *<p>Description: 录入学生信息前的查询-->查出学生成绩</p>
     * @param record
     * @return
     */
    StudentCourse selectGrade(StudentCourse record);
    
    
    /**
     *<p>Title: check</p>
     *<p>Description: 检查学生是否已选课程</p>
     * @param record
     * @return
     */
    List<StudentCourse> check(StudentCourse record);
    
    /**
     *<p>Title: insertCourse</p>
     *<p>Description:课程选择-->插入课程 </p>
     * @param record
     * @return
     */
    int insertCourse(StudentCourse record);
    
    /**
     *<p>Title: delCourse</p>
     *<p>Description:学生删除已选课程 </p>
     * @param record
     * @return
     */
    int delCourse(StudentCourse record);
}