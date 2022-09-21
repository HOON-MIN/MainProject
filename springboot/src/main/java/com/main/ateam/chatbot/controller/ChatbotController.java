package com.main.ateam.chatbot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/meditok")
public class ChatbotController {
	@RequestMapping(value = "/chat")
	public String chat() {
		return "chatbot/meditok";
	}
	
	@RequestMapping("/mainchat")
	public String mainchat() {
		return "main/main_chat";
	}
}
