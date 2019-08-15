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


    List<StudentD> studentdList();

	

}
