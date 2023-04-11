package com.javaweb.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.regex.*;

public class SetDao {
	private Connection conn = null;

	public void initConnection() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://8.210.20.160:3306/java_web", "zyc", "Abc123456");
	}

	public ArrayList<User> getAllnum() throws Exception {
		ArrayList<User> al = new ArrayList<User>();
		initConnection();
		String sql = "select StuName,Pic,Data,StuNo FROM Student";
		Statement stat = conn.createStatement();
		ResultSet rs = stat.executeQuery(sql);
		while (rs.next()) {
			User ge = new User();
			ge.setStuName(rs.getString("StuName"));
			ge.setPic(rs.getString("Pic"));
			ge.setData(rs.getString("Data"));
			ge.setStuNo(rs.getString("StuNo"));
			al.add(ge);
		}
		closeConnection();
		return al;
	}

	public String match(String name) throws Exception {
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
		String sql = "", result = "";
		if (pattern.matcher(name).matches()) {
			sql = "select StuPs FROM Student WHERE StuNo='" + name + "'";
		} else {
			sql = "select TeacherPs FROM Teacher WHERE TeacherNo='" + name + "'";
		}
		try {
			initConnection();
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			while (rs.next()) {
				result = rs.getString(1);
			}
			closeConnection();
		} catch (Exception e) {
			result = "ERROR";
		}
		return result;
	}

	public String tname(String tno) throws Exception {
		String sql = "select TeName from Teacher where TeacherNo='" + tno + "'";
		String result = "";
		try {
			initConnection();
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			while (rs.next()) {
				result = rs.getString("TeName");
			}
			closeConnection();
		} catch (Exception e) {
			result = "NoData";
		}
		return result;
	}

	public String matchstu(String stu) throws Exception {
		String sql = "select Data from Student where StuNo='" + stu + "'";
		String result = "";
		try {
			initConnection();
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			while (rs.next()) {
				result = rs.getString("Data");
			}
			closeConnection();
		} catch (Exception e) {
			result = "NoData";
		}
		return result;
	}

	public void StuRegister(User user) throws Exception {//学生注册信息插入
		DBConnection con = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO Student(StuNo, StuPs, StuName,Data) VALUES(?, ?, ?,?)";
		try {
			con = new DBConnection();
			pstmt = con.getConnection().prepareStatement(sql);
			pstmt.setString(1, user.getStuNo());
			pstmt.setString(2, user.getStuPs());
			pstmt.setString(3, user.getStuName());
			pstmt.setString(4, "0");
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println("插入异常");
		}

		finally {
			if (con != null) {
				con.close();
			}
		}
	}

	public void TeRegister(User user) throws Exception {//老师注册信息插入
		DBConnection con = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO Teacher(TeacherNo, TeacherPs,TeName) VALUES(?, ?, ?)";
		try {
			con = new DBConnection();
			pstmt = con.getConnection().prepareStatement(sql);
			pstmt.setString(1, user.getTeacherNo());
			pstmt.setString(2, user.getTeacherPs());
			pstmt.setString(3, user.getTeName());
			int row = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println("插入异常");
		}

		finally {
			if (con != null) {
				con.close();
			}
		}
	}

	public void AddPic(User user) throws Exception {
		DBConnection con = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE Student SET Base =? WHERE StuNo = ?";
		try {
			con = new DBConnection();
			pstmt = con.getConnection().prepareStatement(sql);
			pstmt.setByte(1, user.getBase());
			pstmt.setString(2, user.getStuNo());
			int row = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println("插入异常");
		}

		finally {
			if (con != null) {
				con.close();
			}
		}
	}

	public void closeConnection() throws Exception {
		conn.close();
	}
}
