package com.Dao;

import com.Pojo.Classes;
import com.Pojo.ClassesExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
/**
 * 
 * <p>Title: ClassesMapper</p>
 * <p>Description: </p>
 * @author XuMenglin
 * @date 2019年8月7日
 */
/**
 * <p>Title: ClassesMapper</p>
 * <p>Description: </p>
 * @author XuMenglin
 * @date 2019年8月7日
 */
public interface ClassesMapper {

    long countByExample(ClassesExample example);

    int deleteByExample(ClassesExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Classes record);

    int insertSelective(Classes record);

    List<Classes> selectByExample(ClassesExample example);

    Classes selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Classes record, @Param("example") ClassesExample example);

    int updateByExample(@Param("record") Classes record, @Param("example") ClassesExample example);
    
    /**
     *<p>Title: updateByPrimaryKeySelective</p>
     *<p>Description: 主键查询</p>
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Classes record);

    /**
     *<p>Title: updateByPrimaryKey</p>
     *<p>Description:  主键查询</p>
     * @param record
     * @return
     */
    int updateByPrimaryKey(Classes record);
    
    /**
     *<p>Title: selectClasses</p>
     *<p>Description:查看班级信息 </p>
     * @param record
     * @return
     */
    List<Classes> selectClasses(Classes record);
}