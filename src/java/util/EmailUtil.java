/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


/**
 *
 * @author THIEN-NVT
 */
public class EmailUtil {

    private static final String host = "smtp.gmail.com";
    private static final String port = "587";
    private static final String userName = "royal.buyses@gmail.com";
    private static final String password = "Nothingo1";

    public static void sendEmal(String recipient, String subject, String message) throws AddressException, MessagingException {
        Properties pro = new Properties();
        pro.put("mail.smtp.host", host);
        pro.put("mail.smtp.port", port);
        pro.put("mail.smtp.auth", "true");
        pro.put("mail.smtp.starttls.enable", "true");
        pro.put("mail.user", userName);
        pro.put("mail.password", password);

        // Tao 1 session de xac thuc mail gui
        javax.mail.Authenticator auth = new javax.mail.Authenticator() {
            @Override
            public javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication(userName, password);
            }
        };
        Session session = Session.getInstance(pro,auth);
        
        //tạo một mail mới
        MimeMessage msg = new MimeMessage(session);
        msg.setHeader("Content-Type", "text/plain; charset=UTF-8");
        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toAddress = {new InternetAddress(recipient)};
        msg.setRecipients(Message.RecipientType.TO, toAddress);
        msg.setSubject(subject,"utf-8");
        msg.setSentDate(new Date());
        msg.setContent(message,"text/html; charset=utf-8");
        //sent email
        Transport.send(msg);
    }
}
