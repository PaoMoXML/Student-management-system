package com.Dao;

import com.Pojo.Student;
import com.Pojo.StudentExample;

import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * <p>Title: StudentMapper</p>
 * <p>Description: </p>
 * @author XuMenglin
 * @date 2019年8月7日
 */
public interface StudentMapper {
    long countByExample(StudentExample example);

    int deleteByExample(StudentExample example);

    int deleteByPrimaryKey(Integer id);

    /**
     *<p>Title: insert</p>
     *<p>Description: 注册</p>
     * @param record
     * @return
     */
    int insert(Student record);

    int insertSelective(Student record);

    List<Student> selectByExample(StudentExample example);

    Student selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByExample(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
    
    /**
     *<p>Title: stuLogin</p>
     *<p>Description: 登录-->学生，教师，管理员</p>
     * @param record
     * @return
     */
    Student stuLogin(Student record);
    
    /**
     *<p>Title: stuidCheck</p>
     *<p>Description:确认是否已有该学号 </p>
     * @param stuid
     * @return
     */
    List<Student> stuidCheck(String stuid);
    
    /**
     *<p>Title: reSetPassword</p>
     *<p>Description: 重置密码</p>
     * @param stuid
     * @return
     */
    int reSetPassword (Student record);
    
    /**
     *<p>Title: changePassword</p>
     *<p>Description:学生教师修改密码 </p>
     * @param record
     * @return
     */
    List<Student> changePassword (Student record);
    

}