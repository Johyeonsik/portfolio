package com.example.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.MessageVO;

@Repository
public class MessageDAOImpl implements MessageDAO{
	
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.MessageMapper";
	
	@Override
	public List<MessageVO> sendList(String uid) {
		return session.selectList(namespace + ".sendList", uid);
	}

	@Override
	public void insert(MessageVO vo) {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public List<MessageVO> receiveList(String uid) {
		return session.selectList(namespace + ".receiveList", uid);
	}

	@Override
	public MessageVO read(int mno) {
		return session.selectOne(namespace + ".read", mno);
	}

	@Override
	public void updateReaddate(int mno) {
		session.update(namespace + ".updateReaddate", mno);
	}

	@Override
	public void updateSendcnt(String uid) {
		session.update(namespace + ".updateSendcnt", uid);
	}

	@Override
	public void updateRecednt(String uid) {
		session.update(namespace + ".updateRececnt", uid);
	}

}
