package com.main.ateam;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class SocketHandler extends TextWebSocketHandler {

	private Map<String,WebSocketSession> sessions;
	public SocketHandler() {
		sessions=new HashMap<>();
	}
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String key=(String) session.getAttributes().get("oid");
		System.out.println(key);
		System.out.println(message);
		if(sessions.containsKey(key))sessions.get(key).sendMessage(message);
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> map=session.getAttributes();
		String id = (String) map.get("sessionID");
		System.out.println("연결 id : "+id);
		sessions.put(id, session);
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
	}
}
