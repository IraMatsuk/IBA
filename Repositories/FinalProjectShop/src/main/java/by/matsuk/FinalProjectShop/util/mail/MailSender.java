package by.matsuk.FinalProjectShop.util.mail;

import by.matsuk.FinalProjectShop.exception.InteractionException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import static org.apache.logging.log4j.core.util.Loader.getClassLoader;

/**
 * The type Mail sender.
 */
public class MailSender {
    private static MailSender instance;
    private static Logger logger = LogManager.getLogger();
    private Properties properties;

    private MailSender(){
        try {
            properties =new Properties();
            properties.load(getClassLoader().getResourceAsStream("datasrc\\mailsend.properties"));

        } catch (IOException e) {
            logger.error(e.getMessage());
        }
    }
    public static MailSender getInstance(){
        if(instance ==null){
            instance = new MailSender();
        }
        return instance;
    }
    public void send(String sendToMail, String mailSubject, String mailText){
        try {
            MimeMessage message = initMessage(sendToMail,mailText,mailSubject);
            Transport.send(message);
        } catch (MessagingException | InteractionException e) {
            logger.error(e.getMessage());
        }

    }
    private MimeMessage initMessage(String sendToMail, String mailText, String mailSubject) throws InteractionException{
        MimeMessage message;
        try {
            Session mailSession = MailSessionFactory.getInstance().createSession(properties);
            mailSession.setDebug(true);
            message = new MimeMessage(mailSession);
            message.setSubject(mailSubject);
            message.setContent(mailText,"text/html");
            message.setRecipient(Message.RecipientType.TO,new InternetAddress(sendToMail));
        } catch (MessagingException e) {
            throw new InteractionException(e.getMessage());
        }
        return message;
    }
}