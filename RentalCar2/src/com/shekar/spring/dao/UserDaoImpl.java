package com.shekar.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.shekar.spring.models.Login;
import com.shekar.spring.models.User;

public class UserDaoImpl implements UserDao {

	@Autowired
	public JdbcTemplate jdbcTemplate;

	@Override
	public int insertUser(User user) {
		// TODO Auto-generated method stub
		String query = "insert into users(first_name,last_name,email,password,gender,mobile_no,address) values(?,?,?,?,?,?,?)";
		Object args[] = { user.getFirstName(), user.getLastName(), user.getEmail(), user.getPassword(),
				user.getGender(), user.getMobileNo(), user.getAddress() };
		return jdbcTemplate.update(query, args);
		//return 1;
	}

	@Override
	public List<User> loginCheck(Login login) {
		// TODO Auto-generated method stub


		String sql = "select * from users where email='" + login.getUsername() + "' and password='"
				+ login.getPassword() + "'";
		List<User> user = jdbcTemplate.query(sql, new UserMapper());
		
		return user;
	}
}

class UserMapper implements RowMapper<User> {
	public User mapRow(ResultSet rs, int arg1) throws SQLException {

		User user = new User();
		user.setEmail(rs.getString("email"));
		user.setUserId(rs.getInt("user_id"));
		user.setMobileNo(rs.getString("mobile_no"));
		user.setFirstName(rs.getString("first_name"));
		user.setLastName(rs.getString("last_name"));
		user.setAddress(rs.getString("address"));
		return user;
	}
}
