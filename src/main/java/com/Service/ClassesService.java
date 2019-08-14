package com.Service;

import java.util.List;

import com.Pojo.Classes;

/**
 * <p>Title: ClassesService</p>
 * <p>Description: </p>
 * @author XuMenglin
 * @date 2019年8月8日
 */
public interface ClassesService {
	
	/**
	 *<p>Title: selectByPrimaryKey</p>
	 *<p>Description: 延迟查询-->将所有course表和StudentCourse表的内容</p>
	 * @param id
	 * @return
	 */
	Classes selectByPrimaryKey(Integer id);
	
    /**
     *<p>Title: selectClasses</p>
     *<p>Description: 查看班级</p>
     * @param record
     * @return
     */
	List<Classes> selectClasses(Classes record);


}
