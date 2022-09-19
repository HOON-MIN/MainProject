package com.main.ateam.modules;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;

@Component
@SuppressWarnings("finally")
public class UbuntuShellModule {

	private int sessionTimeout = 10000;
	private int channelTimeout = 5000;
	
	//JSch 객체
	private ChannelExec execChannel;
	private ChannelSftp sftpChannel;
	
	@Value("${ubuntuHost}")
	private String host;
	@Value("${ubuntuUser}")
	private String username;
	@Value("${ubuntuPassword}")
	private String password;
	@Value("${uploadPath}")
	private String uplaodPath;	///home/kosmo113/MainProject/COVID19/Dataset/
	@Value("${pythonPath}")
	private String pythonPath; ///home/kosmo113/MainProject/COVID19/
	private int port = 22;
	
	public void multiconnect(String flag, String userID) {
		JSch jsch = new JSch();
		Session session = null;
		Channel execChannel = null;
		Channel wavChannel = null;
		String wavPath = Paths.get(System.getProperty("user.dir"), "src/main/resources/static/upload\\audio").toString();
		try {
			session = jsch.getSession(username, host, port);
			session.setPassword(password);
			Properties config = new Properties();
			config.put("StrictHostKeyChecking", "no");
			session.setConfig(config);
			System.out.println("Server Connected!");
			
			//.wav 업로드
			if(flag.equals("upload")) {
				wavChannel = session.openChannel("sftp");
				wavChannel.connect();
				ChannelSftp sftpChannel = (ChannelSftp) wavChannel;
				System.out.println("SFTP Connected");
				
				FileInputStream fis = null;
				File file = new File(wavPath+"\\"+userID+".wav");
				fis = new FileInputStream(file);
				sftpChannel.cd(uplaodPath);
				sftpChannel.put(fis, file.getName());
				
			}else if(flag.equals("python")) {
				execChannel = session.openChannel("exec");
				
				((ChannelExec) execChannel).setCommand("");
				execChannel.connect();
				System.out.println("Command Execute!");
			}
		} catch (JSchException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (SftpException e) {
			e.printStackTrace();
		}finally {
			if(wavChannel != null) {wavChannel.disconnect();}
			if(session != null) {session.disconnect();}
		}
	}
	
	private void sftpConnect() {
		System.out.println("Start SFTP Connection....=>"+host);
		Session session = null;
		Channel channel = null;
		
		JSch jsch = new JSch();
		try {
			session = jsch.getSession(username, host, port);
			session.setPassword(password);
			
			Properties config = new Properties();
			config.put("StrictHostKeyChecking", "no");
			session.setConfig(config);
			
			session.connect();
			
			channel = session.openChannel("sftp");
			channel.connect();
			
			sftpChannel = (ChannelSftp) channel;
			System.out.println("SFTP Connection Success....");
		} catch (JSchException e) {
			e.printStackTrace();
		}
	}
	
	private void sshConnect() {
		Session session = null;
		JSch jsch = new JSch();
		try {
			session = jsch.getSession(username, host, port);
			session.setPassword(password);
			Properties config = new Properties();
			config.put("StrictHostKeyChecking", "no");
			session.setConfig(config);
			
			session.connect();
			Channel channel = session.openChannel("exec");
			execChannel = (ChannelExec) channel;
			execChannel.setErrStream(System.err);
			System.out.println("SSH Connection Success....");
		} catch (JSchException e) {
			e.printStackTrace();
		}  
	}
	
	public void upload(String uploadPath, String filePath) {
		sftpConnect();
		FileInputStream fis =null;
		try {
			File file = new File(filePath);
			fis = new FileInputStream(file);
			sftpChannel.cd(uploadPath);
			sftpChannel.put(fis, file.getName());
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (SftpException e) {
			e.printStackTrace();
		}finally {
			try {
				fis.close();
				this.disConnect();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("파일 업로드 완료!");
	}

	public void command(String command) {
		sshConnect();
		System.out.println("Start SSH Connection....=>"+host);
		try {
			execChannel.setCommand(command);
			InputStream in = execChannel.getInputStream();
			execChannel.connect();
			
			byte[] tmp = new byte[1024];
            while (true) {
                while (in.available() > 0) {
                    int i = in.read(tmp, 0, 1024);
                    if (i < 0) break;
                    System.out.print(new String(tmp, 0, i));
                }
                if (execChannel.isClosed()) {
                    if (in.available() > 0) continue;
                    System.out.println("exit-status: "
                         + execChannel.getExitStatus());
                    break;
                }
                try {
                    Thread.sleep(1000);
                } catch (Exception ee) {
                }
            }
            execChannel.disconnect();
		} catch (JSchException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			this.disConnect();
			
		}
		System.out.println("command execute!");
	}
	
	//JsCh 자원 해제
	public void disConnect() {
		if(execChannel != null) {
			execChannel.disconnect();
        }
        if(sftpChannel != null) {
        	sftpChannel.disconnect();
        }
	}
}
