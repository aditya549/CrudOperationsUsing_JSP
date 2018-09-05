package com.cubic.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.cubic.UserBean.UserBean;

public class RegisterDAO {

	public static void register(UserBean user) {
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "reddy", "reddy");
		PreparedStatement pst=con.prepareStatement("insert into crud values(?,?,?,?)");
		pst.setString(1, user.getName());
		pst.setString(2, user.getPassword());
		pst.setString(3, user.getEmail());
		pst.setInt(4, user.getId());
		int i=pst.executeUpdate();
		if(i==1) {
			user.setValid(true);
			System.out.println("Record inserted SUCCESSFULLY");
		}else {
			user.setValid(false);
		System.out.println("Records are not inserted");
		}
		con.close();
		}
		catch (Exception e) {
			System.out.println(e);
		}
	}
	
}
