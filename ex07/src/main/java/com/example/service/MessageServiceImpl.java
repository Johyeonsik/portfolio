package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.MessageDAO;
import com.example.dao.UserDAO;
import com.example.domain.MessageVO;

@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	UserDAO udao;
	
	@Autowired
	MessageDAO mdao;

	@Transactional
	@Override
	public void insert(MessageVO vo) {
		mdao.insert(vo);
		udao.updatePoint(vo.getSender(), 10);
		mdao.updateSendcnt(vo.getSender());
		mdao.updateRecednt(vo.getReceiver());
	}

	@Transactional
	@Override
	public MessageVO read(int mno) {
		MessageVO vo = mdao.read(mno);
		if(vo.getReaddate()==null){	//리드데이트가 null일떄
			udao.updatePoint(vo.getReceiver(), 5);	//receiver의 포인트 5점 증가
			mdao.updateReaddate(mno); 	//읽은날짜를 현재날짜로 수정
			vo = mdao.read(mno);
		}
		return vo;
	}

}
