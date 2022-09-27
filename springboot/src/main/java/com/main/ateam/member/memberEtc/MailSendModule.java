package com.main.ateam.member.memberEtc;

/*
 * import javax.mail.MessagingException; import javax.mail.internet.MimeMessage;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.boot.ApplicationArguments; import
 * org.springframework.boot.ApplicationRunner; import
 * org.springframework.mail.javamail.JavaMailSenderImpl; import
 * org.springframework.mail.javamail.MimeMessageHelper; import
 * org.springframework.stereotype.Component; import
 * org.springframework.stereotype.Service;
 * 
 * import lombok.AllArgsConstructor; import lombok.RequiredArgsConstructor;
 * 
 * @Component public class MailSendModule {
 * 
 * @Autowired private JavaMailSenderImpl mailSender; private int authNumber;
 * 
 * //인증코드 난수 발생(6자리) public void makeRandomNumber() { int checkNum = (int)
 * (Math.random()*(999999-100000+1))+100000;
 * System.out.println("인증번호 : "+checkNum); authNumber = checkNum; }
 * 
 * //이메일 양식 public String joinEmail(String email) { makeRandomNumber(); String
 * setFrom = "hallman82@naver.com"; //자신의 이메일주소 입력 String toMail = email; String
 * title = "[ATEAM] 회원가입 인증메일입니다."; //이메일 제목
 * 
 * //이메일 내용 StringBuilder sb = new StringBuilder();
 * sb.append("홈페이지를 방문해주셔서 감사합니다.").append("<br><br>");
 * sb.append("인증번호는 <b>").append(authNumber).append("</b>입니다.").append("<br>");
 * sb.append("위 인증번호를 인증번호 확인란에 기입하여주세요."); String content = sb.toString();
 * System.out.println("joinEmail입니다."); mailSend(setFrom, toMail, title,
 * content); return Integer.toString(authNumber); }
 * 
 * public void mailSend(String setFrom, String toMail, String title, String
 * content) { MimeMessage message = mailSender.createMimeMessage();
 * MimeMessageHelper helper; try { helper = new MimeMessageHelper(message, true,
 * "utf-8"); System.out.println("setFrom"+setFrom); helper.setFrom(setFrom);
 * helper.setTo(toMail); helper.setSubject(title); helper.setText(content,
 * true); } catch (MessagingException e) { // TODO Auto-generated catch block
 * e.printStackTrace(); } mailSender.send(message);
 * System.out.println("mailSend입니다."); }
 * 
 * 
 * }
 */
