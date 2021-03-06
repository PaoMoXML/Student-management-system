package com.Dao;

import com.Pojo.StudentD;
import com.Pojo.StudentDExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StudentDMapper {
    long countByExample(StudentDExample example);

    int deleteByExample(StudentDExample example);

    int deleteByPrimaryKey(Integer id);

    /**
     *<p>Title: insert</p>
     *<p>Description: 管理员添加学生</p>
     * @param record
     * @return
     */
    int insert(StudentD record);

    int insertSelective(StudentD record);

    List<StudentD> selectByExample(StudentDExample example);

    StudentD selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") StudentD record, @Param("example") StudentDExample example);

    int updateByExample(@Param("record") StudentD record, @Param("example") StudentDExample example);

    int updateByPrimaryKeySelective(StudentD record);

    /**
     *<p>Title: updateByPrimaryKey</p>
     *<p>Description: 删除学生 修改学生的状态为2 废弃</p>
     * @param record
     * @return
     */
    int updateByPrimaryKey(StudentD record);
    
    /**
     *<p>Title: total</p>
     *<p>Description:总页数 </p>
     * @return
     */
    int total();
    /**
     *<p>Title: stuList2</p>
     *<p>Description:PageHelper分页 </p>
     * @param name
     * @return
     */
    List<StudentD> stuList2(@Param("name")String name);
    /**
     *<p>Title: stuList</p>
     *<p>Description:正常分页 </p>
     * @param start
     * @param last
     * @param count
     * @param name
     * @return
     */
    List<StudentD> stuList(@Param("start")int start,@Param("last")int last,@Param("count")int count,@Param("name")String name);
    
    /**
     *<p>Title: stuDetail</p>
     *<p>Description:学生查询自己的信息 </p>
     * @param record
     * @return
     */
    StudentD stuDetail(StudentD record);
    
    /**
     *<p>Title: belongClass</p>
     *<p>Description: 学生属于哪个班级  延迟查询用</p>
     * @param record
     * @return
     */
    List<StudentD> belongClass(StudentD record);


    /**
     *<p>Title: studentdList</p>
     *<p>Description: 学生列表查询</p>
     * @return
     */
    List<StudentD> studentdList(StudentD record);
    
    /**
     *<p>Title: getTotal</p>
     *<p>Description: （框架）分页获得总页数</p>
     * @param record
     * @return
     */
    int getTotal1(StudentD record);
    
    /**
     *<p>Title: delStu</p>
     *<p>Description: 删除学生 修改学生的状态为2</p>
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