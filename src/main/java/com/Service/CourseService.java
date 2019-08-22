/**
 * @author XuMenglin
 * @date 2019年8月9日
 *
 */
package com.Service;

import java.util.List;

import com.Pojo.Course;

/**
 * <p>Title: CourseService</p>
 * <p>Description: </p>
 * @author XuMenglin
 * @date 2019年8月9日
 */
public interface CourseService {
	
	/**
	 *<p>Title: studentSelectClass</p>
	 *<p>Description: 学生查询课程-->选课 </p>
	 * @param record
	 * @return
	 */
	List<Course> studentSelectClass(Course record);
	
	
    /**
     *<p>Title: insert</p>
     *<p>Description: 添加课程</p>
     * @param record
     * @return
     */
    int insert(Course record);
    
    
    /**
     *<p>Title: studentSelectClass1</p>
     *<p>Description: 分页查询（框架）</p>
     * @param record
     * @return
     */
    List<Course> studentSelectClass1(Course record);
    
    /**
     *<p>Title: getTotal1</p>
     *<p>Description: 分页查询总数（框架）</p>
     * @param record
     * @return
     */
    int getTotal1(Course record);


}
