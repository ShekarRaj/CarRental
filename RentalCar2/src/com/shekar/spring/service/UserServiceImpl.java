package com.shekar.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.shekar.spring.dao.UserDao;
import com.shekar.spring.models.Login;
import com.shekar.spring.models.User;

public class UserServiceImpl implements UserService {
    @Autowired
	public UserDao userDao;
	
	@Override
	public int insertUser(User user) {
		// TODO Auto-generated method stub
		return userDao.insertUser(user);
	}

	@Override
	public List<User> loginCheck(Login login) {
		// TODO Auto-generated method stub
		return userDao.loginCheck(login);
	}

	
}
