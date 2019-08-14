package com.Dao;

import com.Pojo.TeacherD;
import com.Pojo.TeacherDExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * <p>Title: TeacherDMapper</p>
 * <p>Description: </p>
 * @author XuMenglin
 * @date 2019年8月7日
 */
public interface TeacherDMapper {
    long countByExample(TeacherDExample example);

    int deleteByExample(TeacherDExample example);

    int insert(TeacherD record);

    int insertSelective(TeacherD record);

    List<TeacherD> selectByExample(TeacherDExample example);

    int updateByExampleSelective(@Param("record") TeacherD record, @Param("example") TeacherDExample example);

    int updateByExample(@Param("record") TeacherD record, @Param("example") TeacherDExample example);
    
    /**
     *<p>Title: teaDetail</p>
     *<p>Description:教师自己的信息 </p>
     * @param record
     * @return
     */
    TeacherD teaDetail(TeacherD record);
    
    /**
     *<p>Title: teaList</p>
     *<p>Description:教师列表+模糊查询 </p>
     * @param record
     * @return
     */
    List<TeacherD> teaList(TeacherD record);
}