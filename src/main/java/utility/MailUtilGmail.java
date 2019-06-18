package utility;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import javax.mail.internet.AddressException;
import javax.mail.Authenticator;


public class MailUtilGmail {
    public static String send(String toGmail,String sub,String msg) throws AddressException, MessagingException{
        final String from = "bathanh.thxd@gmail.com";
        final String password = "tuyenhoa@.@qb";
        Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS
        prop.put("mail.user", from);
        prop.put("mail.password", password);
        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(from, password);
                    }
                });

       

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(
                    Message.RecipientType.TO,InternetAddress.parse(toGmail)
            );
            message.setSubject(sub);
            message.setText(msg);

            Transport.send(message);

       
        return "ok";
    }
}