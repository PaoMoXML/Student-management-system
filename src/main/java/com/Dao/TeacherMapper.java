package com.Dao;

import com.Pojo.Teacher;
import com.Pojo.TeacherExample;

import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * <p>Title: TeacherMapper</p>
 * <p>Description: </p>
 * @author XuMenglin
 * @date 2019年8月7日
 */
public interface TeacherMapper {
    long countByExample(TeacherExample example);

    int deleteByExample(TeacherExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Teacher record);

    int insertSelective(Teacher record);

    List<Teacher> selectByExample(TeacherExample example);

    Teacher selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Teacher record, @Param("example") TeacherExample example);

    int updateByExample(@Param("record") Teacher record, @Param("example") TeacherExample example);

    int updateByPrimaryKeySelective(Teacher record);

    int updateByPrimaryKey(Teacher record);
    
    Teacher teaLogin(Teacher record);
}