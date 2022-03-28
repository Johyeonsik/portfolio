package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.dao.MessageDAO;
import com.example.domain.MessageVO;
import com.example.service.MessageService;

@RestController
@RequestMapping("/message")
public class MessageController {
	@Autowired
	MessageDAO dao;
	
	@Autowired
	MessageService service;
	
	@RequestMapping("/sendList")
	public List<MessageVO> sendList(String uid){
		return dao.sendList(uid);
	}
	@RequestMapping("/receiveList")
	public List<MessageVO> receiveList(String uid){
		return dao.receiveList(uid);
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public void insert(MessageVO vo){
		service.insert(vo);
	}
	
	@RequestMapping("/read")
	public MessageVO read(int mno){
		return service.read(mno);
	}
}
