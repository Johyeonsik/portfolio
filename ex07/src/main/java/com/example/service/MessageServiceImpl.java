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
		if(vo.getReaddate()==null){	//���嵥��Ʈ�� null�ϋ�
			udao.updatePoint(vo.getReceiver(), 5);	//receiver�� ����Ʈ 5�� ����
			mdao.updateReaddate(mno); 	//������¥�� ���糯¥�� ����
			vo = mdao.read(mno);
		}
		return vo;
	}

}
