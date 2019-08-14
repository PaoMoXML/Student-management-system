package com.Dao;

import com.Pojo.Course;
import com.Pojo.CourseExample;

import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * <p>Title: CourseMapper</p>
 * <p>Description: </p>
 * @author XuMenglin
 * @date 2019年8月7日
 */
public interface CourseMapper {

    long countByExample(CourseExample example);

    int deleteByExample(CourseExample example);

    int deleteByPrimaryKey(Integer id);

    /**
     *<p>Title: insert</p>
     *<p>Description: 添加课程</p>
     * @param record
     * @return
     */
    int insert(Course record);

    int insertSelective(Course record);

    List<Course> selectByExample(CourseExample example);

    Course selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Course record, @Param("example") CourseExample example);

    int updateByExample(@Param("record") Course record, @Param("example") CourseExample example);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);

    /**
     *<p>Title: selectC</p>
     *<p>Description: 延迟查询</p>
     * @param id
     * @return
     */
    List<Course> selectC(String id);
    
    /**
     *<p>Title: studnetSelectClass</p>
     *<p>Description: 学生选课查询课程</p>
     * @param id
     * @return
     */
    List<Course> studentSelectClass(Course record);
}