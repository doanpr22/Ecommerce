/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import java.util.Properties;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
/**
 *
 * @author USER
 */
public class SendGmail {
    public static void send(String toGmail,String sub,String mesg){
        final String from = "bathanh.thxd@gmail.com";
        final String password = "tuyenhoa@.@qb";
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);

        mailSender.setUsername(from);
        mailSender.setPassword(password);
        
        Properties props = new Properties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true");
        
        mailSender.setJavaMailProperties(props);
        SimpleMailMessage message = new SimpleMailMessage();
         
        message.setTo(toGmail);
        message.setSubject(sub);
        message.setText(mesg);
        
        mailSender.send(message);
    }  
}
