package com.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Dao.ClassesMapper;
import com.Pojo.Classes;
import com.Service.ClassesService;
/**
 * <p>Title: ClassesServiceImpl</p>
 * <p>Description: 班级查询 </p>
 * @author XuMenglin
 * @date 2019年8月7日
 */
@Service("ClassesService")
public class ClassesServiceImpl implements ClassesService{
	
	@Autowired
	ClassesMapper classesmapper;


	/**
	 *(non-Javadoc)
	 * <p>Title: selectByPrimaryKey</p>
	 * <p>Description: 根据id查询班级</p>
	 * @param id
	 * @return
	 * @see com.Service.ClassesService#selectByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public Classes selectByPrimaryKey(Integer id) {
		return this.classesmapper.selectByPrimaryKey(id);
	}


	/**
	 * <p>Title: selectClasses</p>
	 * <p>Description:查看班级 </p>
	 * @param record
	 * @return
	 * @see com.Service.ClassesService#selectClasses(com.Pojo.Classes)
	 */
	@Override
	public List<Classes> selectClasses(Classes record) {
		return this.classesmapper.selectClasses(record);
	}

}
