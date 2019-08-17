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

}
