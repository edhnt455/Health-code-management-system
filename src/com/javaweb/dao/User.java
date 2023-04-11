package com.javaweb.dao;

public class User {
	private String StuNo;
	private String StuPs;
	private String StuName;
	private String Pic;
	private String Data;
	private Byte Base;
	private String TeacherNo;
	private String TeacherPs;
	private String TeName;

//	set用作查询，get用作插入
	public void setStuNo(String StuNo) {
		this.StuNo = StuNo;
	}

	public String getStuNo() {
		return StuNo;
	}

	public void setStuPs(String StuPs) {
		this.StuPs = StuPs;
	}

	public String getStuPs() {
		return StuPs;
	}

	public void setStuName(String StuName) {
		this.StuName = StuName;
	}

	public String getStuName() {
		return StuName;
	}

	public void setPic(String Pic) {
		this.Pic = Pic;
	}

	public String getPic() {
		return Pic;
	}

	public void setData(String Data) {
		this.Data = Data;
	}

	public String getData() {
		return Data;
	}

	public void setTeacherNo(String TeacherNo) {
		this.TeacherNo = TeacherNo;
	}

	public String getTeacherNo() {
		return TeacherNo;
	}

	public void setTeacherPs(String TeacherPs) {
		this.TeacherPs = TeacherPs;
	}

	public String getTeacherPs() {
		return TeacherPs;
	}

	public void setTeName(String TeName) {
		this.TeName = TeName;
	}

	public String getTeName() {
		return TeName;
	}

	public void setBase(Byte Base) {
		this.Base = Base;
	}

	public Byte getBase() {
		return Base;
	}
}
