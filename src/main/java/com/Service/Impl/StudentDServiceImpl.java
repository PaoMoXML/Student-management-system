package com.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Dao.StudentDMapper;
import com.Pojo.StudentD;
import com.Service.StudentDService;
import com.util.Page;

/**
 * <p>Title: StudentDServiceImpl</p>
 * <p>Description: 学生具体信息</p>
 * @author XuMenglin
 * @date 2019年8月8日
 */
@Service
public class StudentDServiceImpl implements StudentDService{

	@Autowired
	StudentDMapper studentDMapper;
	
	/**
	 * <p>Title: total</p>
	 * <p>Description:总页数-->用于普通分页 </p>
	 * @return
	 * @see com.Service.StudentDService#total()
	 */
	@Override
	public int total() {
		return  studentDMapper.total();
	}

	/**
	 * <p>Title: stuList2</p>
	 * <p>Description: PageHelper分页+模糊查询 </p>
	 * @param name
	 * @return
	 * @see com.Service.StudentDService#stuList2(java.lang.String)
	 */
	@Override
	public List<StudentD> stuList2(String name) {
		return studentDMapper.stuList2(name);
	}

	/**
	 * <p>Title: stuList</p>
	 * <p>Description: 普通分页</p>
	 * @param page
	 * @param name
	 * @return
	 * @see com.Service.StudentDService#stuList(com.util.Page, java.lang.String)
	 */
	@Override
	public List<StudentD> stuList(Page page,String name) {
		return studentDMapper.stuList(page.getStart(),page.getLast(),page.getCount(),name);
	}

	/**
	 * <p>Title: stuDetail</p>
	 * <p>Description: 学生查询自己的信息</p>
	 * @param record
	 * @return
	 * @see com.Service.StudentDService#stuDetail(com.Pojo.StudentD)
	 */
	@Override
	public StudentD stuDetail(StudentD record) {
		return studentDMapper.stuDetail(record);
	}


	/**
	 * <p>Title: studentdList</p>
	 * <p>Description: 获取学生列表</p>
	 * @param record
	 * @return
	 * @see com.Service.StudentDService#studentdList(com.Pojo.StudentD)
	 */
	@Override
	public List<StudentD> studentdList(StudentD record){
		return studentDMapper.studentdList(record);
	}

	/**
	 * <p>Title: getTotal</p>
	 * <p>Description: （框架）获取分页数量</p>
	 * @param record
	 * @return
	 * @see com.Service.StudentDService#getTotal(com.Pojo.StudentD)
	 */
	@Override
	public int getTotal1(StudentD record) {
		return studentDMapper.getTotal1(record);
	}

	/**
	 * <p>Title: insert</p>
	 * <p>Description: 管理员添加学生</p>
	 * @param record
	 * @return
	 * @see com.Service.StudentDService#insert(com.Pojo.StudentD)
	 */
	@Override
	public int insert(StudentD record) {
		return studentDMapper.insert(record);
	}
	
	

}
