package com.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Dao.StudentMapper;
import com.Pojo.Student;
import com.Service.StudentService;

/**
 * <p>Title: StudentServiceImpl</p>
 * <p>Description:学生管理员教师登录查询表 </p>
 * @author XuMenglin
 * @date 2019年8月8日
 */
@Service("StudentService")
public class StudentServiceImpl implements StudentService{
	
	boolean b = false;
	
	@Autowired
	StudentMapper studentMapper;

	/**
	 *(non-Javadoc)
	 * <p>Title: stuLogin</p>
	 * <p>Description: 学生，教师，管理员登录</p>
	 * @param record
	 * @return
	 * @see com.Service.StudentService#stuLogin(com.Pojo.Student)
	 */
	@Override
	public Student stuLogin(Student record) {
		Student stu = new Student();
		if(record.getStuid().equals("") || record.getStuid() == null) {
			System.out.println("请输入学号");
			stu = studentMapper.stuLogin(record);
		}else {
			stu = studentMapper.stuLogin(record);
		}
		return stu;
	}

	/**
	 *(non-Javadoc)
	 * <p>Title: insert</p>
	 * <p>Description: 注册功能</p>
	 * @param record
	 * @return
	 * @see com.Service.StudentService#insert(com.Pojo.Student)
	 */
	@Override
	public int insert(Student record) {
		return studentMapper.insert(record);
	}

	/**
	 * <p>Title: reSetPassword</p>
	 * <p>Description: 重置密码</p>
	 * @param record
	 * @return
	 * @see com.Service.StudentService#reSetPassword(com.Pojo.Student)
	 */
	@Override
	public int reSetPassword(Student record) {
		return studentMapper.reSetPassword(record);
	}

	/**
	 * <p>Title: changePassword</p>
	 * <p>Description:学生教师修改密码 </p>
	 * @param record
	 * @return
	 * @see com.Service.StudentService#changePassword(com.Pojo.Student)
	 */
	@Override
	public List<Student> changePassword(Student record) {
		return studentMapper.changePassword(record);
	}

}
