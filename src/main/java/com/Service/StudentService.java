package com.Service;

import java.util.List;

import com.Pojo.Student;

public interface StudentService {
	
    /**
     *<p>Title: stuLogin</p>
     *<p>Description:根据学号（stuid）查询-->用于登录 </p>
     * @param record
     * @return
     */
    Student stuLogin(Student record);
    
    /**
     *<p>Title: insert</p>
     *<p>Description: 注册</p>
     * @param record
     * @return
     */
    int insert(Student record);
    
    /**
     *<p>Title: reSetPassword</p>
     *<p>Description:重置密码 </p>
     * @param record
     * @return
     */
    int reSetPassword (Student record);


    /**
     *<p>Title: changePassword</p>
     *<p>Description: 学生教师修改密码</p>
     * @param record
     * @return
     */
    List<Student> changePassword (Student record);

}
