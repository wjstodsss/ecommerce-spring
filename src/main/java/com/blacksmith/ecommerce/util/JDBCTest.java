package com.blacksmith.ecommerce.util;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTest {

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testConnection() {

		try (Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/db_estore", 
				"pm_finn",
				"1234")) {

			log.info(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}

}