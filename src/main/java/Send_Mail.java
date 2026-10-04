import jakarta.mail.*;
import jakarta.mail.internet.*; 
import java.util.Properties;

public class Send_Mail {

	 
	public static void sendPassword(String toEmail, String interview_date, String interview_time, String interview_location) 
	{

			// Same credentials as before, overridable via env (Render env vars MAIL_USERNAME / MAIL_PASSWORD)
			final String fromEmail = System.getenv().getOrDefault("MAIL_USERNAME", "pratikpadalkar0011@gmail.com");
	        final String fromPassword = System.getenv().getOrDefault("MAIL_PASSWORD", "kdrkteguleabbpar");   
			
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");

			
			Session session = Session.getInstance(props,
				    new Authenticator() {
				        protected PasswordAuthentication getPasswordAuthentication() {
				            return new PasswordAuthentication(fromEmail, fromPassword);
				        }
				    });

			session.setDebug(true);
			
			try 
			{
				Message msg = new MimeMessage(session);
				msg.setFrom(new InternetAddress(fromEmail));
				msg.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(toEmail));
				msg.setSubject("Interview Scheduled");
				
				msg.setText(
				"Dear Candidate,\n\n" +
				"Your interview has been scheduled.\n\n" +
				"Date: " + interview_date + "\n" +
				"Time: " + interview_time + "\n" +
				"Location: " + interview_location + "\n\n" +
				"Regards,\nHR Team"
				);
				
				Transport.send(msg);
				System.out.println("Email Sent Successfully!");
			
			} 
			catch (Exception e) 
			{
				System.out.println("Email Failed!");
				e.printStackTrace();
			}
	}

}
