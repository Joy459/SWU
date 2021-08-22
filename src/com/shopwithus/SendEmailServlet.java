package com.shopwithus;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 
@WebServlet("/sendEmail")
public class SendEmailServlet extends HttpServlet {
 
 String [] host = new String [20];
 static String ordernumber="";
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession  session = request.getSession();
		ordernumber=(String) session.getAttribute("orderNumber");
		try {
			 sendMail((String)session.getAttribute("email"));
		} catch (MessagingException e) {
		 
			e.printStackTrace();
			
		
		}
		
		response.sendRedirect("orderConfermation.jsp");
		
	}
	
	public static void sendMail(String recepient) throws MessagingException {
		Properties properties= new Properties();
		
		properties.put("mail.smtp.auth","true");
		properties.put("mail.smtp.starttls.enable","true");
		properties.put("mail.smtp.host","smtp.gmail.com");
		properties.put("mail.smtp.port","587");
	
	Session session = Session.getInstance(properties, new Authenticator() {
		@Override
		
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication("roit20911@gmail.com","LOVEisnice5764@#");
		}
		
		
	});
	
	Message message = prepareMessage(session, "roit20911@gmail.com", recepient);
	Transport.send(message);
	System.out.print("Messgage sent successfully");
	
 
	}

	private static Message prepareMessage(Session session, String email, String recepient) {
		try {
		// Create a default MimeMessage object.
        MimeMessage message = new MimeMessage(session);

        // Set From: header field of the header.
        message.setFrom(new InternetAddress("roit20911@gmail.com"));

        // Set To: header field of the header.
        message.addRecipient(Message.RecipientType.TO, new InternetAddress("roit20911@gmail.com"));

        // Set Subject: header field
        message.setSubject("SWU order");

        // Now set the actual message
        message.setText("Hello, this message is to conferm your order. " + "Your order number is "+ordernumber);

        return message;
        
		}catch (Exception ex){
        // Send message
         Logger.getLogger(SendEmailServlet.class.getName()).log(Level.SEVERE,null,ex);
     }
		return null;
	}

 

}
	
 
