package demo.dao;

import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class mailDao {
	public static void Send_mail(String content, String receiver) {
		final String senderEmail = "chauduongphattien2201@gmail.com"; // Thay thế bằng địa chỉ email của bạn
        final String password = "uanmeqvjbuofgxnb"; // Thay thế bằng mật khẩu email của bạn

       

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, password);
            }
        });

        try {
            Message emailMessage = new MimeMessage(session);
            emailMessage.setFrom(new InternetAddress(senderEmail));
            emailMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiver));
            emailMessage.setSubject("subject");
            emailMessage.setText(content);

            Transport.send(emailMessage);
            
        } catch (MessagingException e) {
           
            e.printStackTrace();
        }
	}
}
