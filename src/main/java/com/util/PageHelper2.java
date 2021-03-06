/**
 * @author XuMenglin
 * @date 2019年8月15日
 *
 */
package com.util;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>Title: PageHelper</p>
 * <p>Description: </p>
 * @author XuMenglin
 * @date 2019年8月15日
 */
public class PageHelper2<T> {
	//实体类集合
    private List<T> rows = new ArrayList<T>();
    //数据总条数
    private int total;
    public PageHelper2() {
        super();
    }
 
    public List<T> getRows() {
        return rows;
    }
 
    public void setRows(List<T> rows) {
        this.rows = rows;
    }
 
    public int getTotal() {
        return total;
    }
 
    public void setTotal(int total) {
        this.total = total;
    }

}
