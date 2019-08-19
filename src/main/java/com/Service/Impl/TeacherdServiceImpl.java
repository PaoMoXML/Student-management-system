/**
 * @author XuMenglin
 * @date 2019年8月7日
 *
 */
package com.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Dao.TeacherDMapper;
import com.Pojo.TeacherD;
import com.Service.TeacherdService;

/**
 * <p>Title: TeacherdServiceImpl</p>
 * <p>Description: 教师具体信息表查询 </p>
 * @author XuMenglin
 * @date 2019年8月7日
 */
@Service("TeacherdService")
public class TeacherdServiceImpl implements TeacherdService {

	@Autowired
	TeacherDMapper teacherDMapper;
	
	/**
	 *(non-Javadoc)
	 * <p>Title: teaDetail</p>
	 * <p>Description: 教师查询自己的信息</p>
	 * @param record
	 * @return
	 * @see com.Service.TeacherdService#teaDetail(com.Pojo.TeacherD)
	 */
	@Override
	public TeacherD teaDetail(TeacherD record) {
		return teacherDMapper.teaDetail(record);
	}

	/**
	 *(non-Javadoc)
	 * <p>Title: teaList</p>
	 * <p>Description:管理员查询所有老师的信息 </p>
	 * @param record
	 * @return
	 * @see com.Service.TeacherdService#teaList(com.Pojo.TeacherD)
	 */
	@Override
	public List<TeacherD> teaList(TeacherD record) {
		return teacherDMapper.teaList(record);
	}

	/**
	 * <p>Title: getTotal</p>
	 * <p>Description: （框架） 获取教师数量</p>
	 * @param record
	 * @return
	 * @see com.Service.TeacherdService#getTotal(com.Pojo.TeacherD)
	 */
	@Override
	public int getTotal(TeacherD record) {
		return teacherDMapper.getTotal(record);
	}

	/**
	 * <p>Title: teaTable</p>
	 * <p>Description:（框架） 获取教师列表 </p>
	 * @param record
	 * @return
	 * @see com.Service.TeacherdService#teaTable(com.Pojo.TeacherD)
	 */
	@Override
	public List<TeacherD> teaTable(TeacherD record) {
		return teacherDMapper.teaTable(record);
	}

	/**
	 * <p>Title: del</p>
	 * <p>Description: 删除教师，将状态改为2</p>
	 * @param record
	 * @return
	 * @see com.Service.TeacherdService#del(com.Pojo.TeacherD)
	 */
	@Override
	public int del(TeacherD record) {
		return teacherDMapper.del(record);
	}

	/**
	 * <p>Title: updateTeaInfo</p>
	 * <p>Description: 修改教师信息</p>
	 * @param reocrd
	 * @return
	 * @see com.Service.TeacherdService#updateTeaInfo(com.Pojo.TeacherD)
	 */
	@Override
	public int updateTeaInfo(TeacherD reocrd) {
		return teacherDMapper.updateTeaInfo(reocrd);
	}
	
	

}
