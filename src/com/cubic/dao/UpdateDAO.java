package com.cubic.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.cubic.UserBean.UserBean;

public class UpdateDAO {

	public static void update(UserBean user) {
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "reddy", "reddy");
		PreparedStatement pst=con.prepareStatement("update crud set ename=?,password=?,email=? where id=?");
		pst.setString(1, user.getName());
		pst.setString(2, user.getPassword());
		pst.setString(3, user.getEmail());
		pst.setInt(4, user.getId());
		int i=pst.executeUpdate();
		if(i==1) {
			user.setValid(true);
			System.out.println("Record Updated SUCCESSFULLY");
		}else {
			user.setValid(false);
		System.out.println("Records are not Updated");
		}
		con.close();
		}
		catch (Exception e) {
			System.out.println(e);
		}
	}
	
}
