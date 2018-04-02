package com.shekar.spring.service;

import java.util.List;

import com.shekar.spring.models.Login;
import com.shekar.spring.models.User;

public interface UserService {
	public int insertUser(User user);
	public List<User> loginCheck(Login login);
}
