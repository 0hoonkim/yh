package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
 
public class SMTPAuthenticatior extends Authenticator{
 
    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
		/* return new PasswordAuthentication("ID","Password"); */
        return new PasswordAuthentication("sjyj1827@gmail.com","dudwn042s@");
    }
}
