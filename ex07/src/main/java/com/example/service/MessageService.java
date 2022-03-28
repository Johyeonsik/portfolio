package com.example.service;

import com.example.domain.MessageVO;

public interface MessageService {
	public void insert(MessageVO vo);
	public MessageVO read(int mno);
}
