package com.Dao;

import com.Pojo.Manager;
import com.Pojo.ManagerExample;

import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * <p>Title: ManagerMapper</p>
 * <p>Description: </p>
 * @author XuMenglin
 * @date 2019年8月7日
 */
public interface ManagerMapper {

    long countByExample(ManagerExample example);
    
    int deleteByExample(ManagerExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Manager record);

    int insertSelective(Manager record);

    List<Manager> selectByExample(ManagerExample example);

    Manager selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Manager record, @Param("example") ManagerExample example);

    int updateByExample(@Param("record") Manager record, @Param("example") ManagerExample example);

    int updateByPrimaryKeySelective(Manager record);

    int updateByPrimaryKey(Manager record);
}