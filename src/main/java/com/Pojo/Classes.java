package com.Pojo;

import java.util.List;

public class Classes {
    private Integer id;

    private String classid;

    private String courseid;
    
    private List<StudentD> studentd;
    
    

	public List<StudentD> getStudentd() {
		return studentd;
	}

	public void setStudentd(List<StudentD> studentd) {
		this.studentd = studentd;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getClassid() {
        return classid;
    }

    public void setClassid(String classid) {
        this.classid = classid == null ? null : classid.trim();
    }

    public String getCourseid() {
        return courseid;
    }

    public void setCourseid(String courseid) {
        this.courseid = courseid == null ? null : courseid.trim();
    }
}