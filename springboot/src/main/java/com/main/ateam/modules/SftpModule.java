package com.main.ateam.modules;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;
/* Ubuntu 서버로 파일을 전송하기 위한 SFTP모듈 */
@Component
@SuppressWarnings("finally")
public class SftpModule {
	//SFTP CONFIG : des, ubuntu_user, ubuntu_pwd, ubuntu_ip
	@Value("${sftpConfig}")
	private List<String> sftpConfig;
	
	public String sftpConnect(String filepath, String fileName) {//src:파일경로, fileName:파일명
		String rfileName = "";
		String des = sftpConfig.get(0);				//이동할 파일 위치
		String ubuntu_user = sftpConfig.get(1);		//USER
		String ubuntu_pwd = sftpConfig.get(2);		//PASSWORD
		String ubuntu_ip = sftpConfig.get(3);		//IP
		
		JSch jsch = new JSch();
		try {
			Session session = jsch.getSession(ubuntu_user, ubuntu_ip, 22);
			session.setPassword(ubuntu_pwd);
			
			Properties config = new Properties();
			config.put("StrictHostKeyChecking", "no");
			session.setConfig(config);
			
			session.connect();
			Channel channel = session.openChannel("sftp");
			channel.connect();
			
			ChannelSftp sftpChannel = (ChannelSftp) channel;
			sftpChannel.cd(des);
			System.out.println("sftpConnPATH => "+filepath+ "\\" +fileName);
			File file = new File(filepath+ "\\" +fileName);
			FileInputStream fis = new FileInputStream(file);
			sftpChannel.put(fis, file.getName());
			fis.close();
			
			sftpChannel.disconnect();
			channel.disconnect();
			session.disconnect();
			
			rfileName = file.getName();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			return rfileName;
		}
		
	}
}
