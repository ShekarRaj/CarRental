package com.shekar.spring.dao;

import java.util.List;

import com.shekar.spring.models.Login;
import com.shekar.spring.models.User;

public interface UserDao {
	public int insertUser(User user);
	public List<User> loginCheck(Login login);
}
