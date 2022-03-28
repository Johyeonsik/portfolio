package com.example.dao;

import java.util.List;


import com.example.domain.UserVO;

public interface UserDAO {
	public List<UserVO> list();
	public UserVO read(String uid);
	public void updatePoint(String uid, int amount);
}
