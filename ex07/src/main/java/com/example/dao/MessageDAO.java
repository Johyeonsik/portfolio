package com.example.dao;

import java.util.List;

import com.example.domain.MessageVO;

public interface MessageDAO {
	//보낸메세지 목록
	public List<MessageVO> sendList(String uid);
	
	//받은메세지 목록
	public List<MessageVO> receiveList(String uid);

	//메세지 보내기
	public void insert(MessageVO vo);
	
	//특정메세지 읽기
	public MessageVO read (int mno);
	
	//읽은 날짜 현재날짜로 수정
	public void updateReaddate(int mno);
	
	public void updateSendcnt(String uid);
	public void updateRecednt(String uid);
}
