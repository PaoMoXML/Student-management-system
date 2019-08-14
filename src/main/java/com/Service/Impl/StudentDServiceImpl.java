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

}
