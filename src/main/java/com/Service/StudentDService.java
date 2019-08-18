package com.Service;

import java.util.List;


import com.Pojo.StudentD;
import com.util.Page;

public interface StudentDService {
	
    /**
     *<p>Title: total</p>
     *<p>Description: 分页</p>
     * @return
     */
    int total();
    List<StudentD> stuList2(String name);//pageHelper
    List<StudentD> stuList(Page page,String name);
    
    /**
     *<p>Title: stuDetail</p>
     *<p>Description: 学生查询自己的信息</p>
     * @param record
     * @return
     */
    StudentD stuDetail(StudentD record);


    /**
     *<p>Title: studentdList</p>
     *<p>Description: 学生列表查询</p>
     * @param record
     * @return
     */
    List<StudentD> studentdList(StudentD record);

	
    /**
     *<p>Title: getTotal</p>
     *<p>Description: （框架）获取分页总数</p>
     * @param record
     * @return
     */
    int getTotal1(StudentD record);
    
    /**
     *<p>Title: insert</p>
     *<p>Description: 管理员添加学生</p>
     * @param record
     * @return
     */
    int insert(StudentD record);
    
    /**
     *<p>Title: delStu</p>
     *<p>Description: 删除学生，修改学生状态为2</p>
     * @param record
     * @return
     */
    int delStu(StudentD record);
    
    /**
     *<p>Title: updateStuInfo</p>
     *<p>Description: 修改学生信息</p>
     * @param record
     * @return
     */
    int updateStuInfo (StudentD record);

}
