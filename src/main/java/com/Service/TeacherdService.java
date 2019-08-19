/**
 * @author XuMenglin
 * @date 2019年8月7日
 *
 */
package com.Service;

import java.util.List;

import com.Pojo.TeacherD;

/**
 * <p>Title: teacherdService</p>
 * <p>Description:教师具体信息接口 </p>
 * @author XuMenglin
 * @date 2019年8月7日
 */
/**
 * <p>Title: TeacherdService</p>
 * <p>Description: </p>
 * @author XuMenglin
 * @date 2019年8月19日
 */
public interface TeacherdService {
	
	 /**
	 *<p>Title: teaDetail</p>
	 *<p>Description:教师查询自己的信息 </p>
	 * @param record
	 * @return
	 */
	TeacherD teaDetail(TeacherD record);
	
	/**
	 *<p>Title: teaList</p>
	 *<p>Description: 管理员查询教师信息</p>
	 * @param record
	 * @return
	 */
	List<TeacherD> teaList(TeacherD record);
	
	/**
	 *<p>Title: getTotal</p>
	 *<p>Description:（框架） 获取教师列表总数 </p>
	 * @param record
	 * @return
	 */
	int getTotal(TeacherD record);
	
	/**
	 *<p>Title: teaTable</p>
	 *<p>Description:（框架）获取教室列表+模糊查询 </p>
	 * @param record
	 * @return
	 */
	List<TeacherD> teaTable(TeacherD record);
	
	/**
	 *<p>Title: del</p>
	 *<p>Description: 删除教师，将状态改为2</p>
	 * @param record
	 * @return
	 */
	int del(TeacherD record);
	
    /**
     *<p>Title: updateTeaInfo</p>
     *<p>Description: 修改教师信息</p>
     * @param reocrd
     * @return
     */
    int updateTeaInfo(TeacherD reocrd);

}
