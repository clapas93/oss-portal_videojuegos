/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Resources;

import java.util.Properties;
 
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class SendMailTLS {
 
    public void sendMailApproved(String to,double credit) {
 
	final String username = "eduardomiranda@ciencias.unam.mx";
	final String password = "dexeEqZLhM-r79hBodoY2w";
 
	Properties props = new Properties();
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.starttls.enable", "true");
	props.put("mail.smtp.host", "smtp.mandrillapp.com");
	props.put("mail.smtp.port", "587");
 
	Session session = Session.getInstance(props,
					      new javax.mail.Authenticator() {
						  @Override
						  protected PasswordAuthentication getPasswordAuthentication() {
						      return new PasswordAuthentication(username, password);
						  }
					      });
 
	try {
 
	    Message message = new MimeMessage(session);
            
	    message.setFrom(new InternetAddress("noreply@pulsegames.com"));
	    message.setRecipients(Message.RecipientType.TO,
				  InternetAddress.parse("eduardomiranda@ciencias.unam.mx"));
	    message.setSubject("[Pulse Games] Tu solicitud de prestamo ha sido aprovada");
	    String text = mailApprove(credit);
	    message.setContent(text, "text/html; charset=utf-8");
 
	    Transport.send(message);
 
	    System.out.println("Done");
 
	} catch (MessagingException e) {
	    throw new RuntimeException(e);
	}
    }
    public void sendMailDenied(String to) {
 
	final String username = "eduardomiranda@ciencias.unam.mx";
	final String password = "dexeEqZLhM-r79hBodoY2w";
 
	Properties props = new Properties();
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.starttls.enable", "true");
	props.put("mail.smtp.host", "smtp.mandrillapp.com");
	props.put("mail.smtp.port", "587");
 
	Session session = Session.getInstance(props,
					      new javax.mail.Authenticator() {
						  @Override
						  protected PasswordAuthentication getPasswordAuthentication() {
						      return new PasswordAuthentication(username, password);
						  }
					      });
 
	try {
 
	    Message message = new MimeMessage(session);
            
	    message.setFrom(new InternetAddress("noreply@pulsegames.com"));
	    message.setRecipients(Message.RecipientType.TO,
				  InternetAddress.parse("eduardomiranda@ciencias.unam.mx"));
	    message.setSubject("[Pulse Games] Tu solicitud de prestamo no ha sido aprovada");
	    String text = mailDenied();
	    message.setContent(text, "text/html; charset=utf-8");
 
	    Transport.send(message);
 
	    System.out.println("Done");
 
	} catch (MessagingException e) {
	    throw new RuntimeException(e);
	}
    }

    public String mailApprove(double credito){
	String mail = "<div style='background-color:#121C25; width:500px;height:250px'>"+
	    "<div><img style='height:40px;display: block;margin-left: auto;margin-right: auto;padding-top: 10px;' src='public/img/brand.png'></div>"+
	    "<div style='color:#606871;position: relative;'>"+
	    "<h2 style='text-align: center;vertical-align: middle;line-height: 30px;'>Felicidades has obtenido "+credito+" créditos</h2>"+
	    "<h2 style='text-align: center;vertical-align: middle;line-height: 5px;'>por tu buen desempeño académico</h2>"+
	    "<p style='text-align: center;vertical-align: middle;line-height: 5px;'>ya puedes comprar los juegos que quieras.</p>"+
	    "<p style='text-align: center;vertical-align: middle;line-height: 5px;'>Sólo ingresa al sítio: </p>"+
	    "<a style='color:#0A5786;;'href='http://pulsegames.com'><h2 style='text-align: center;vertical-align: middle;line-height: 40px;text-decoration: underline;'>http://pulsegames.com</h2></a>"+
	    "</div>"+
	    "</div>";
	return mail;
    }

    public String mailDenied(){
	String mail = "<div style='background-color:#121C25; width:500px;height:250px'>"+
	    "<div><img style='height:40px;display: block;margin-left: auto;margin-right: auto;padding-top: 10px;' src='public/img/brand.png'></div>"+
	    "<div style='color:#606871;position: relative;'>"+
	    "<h2 style='text-align: center;vertical-align: middle;line-height: 30px;'>Lo sentimos tu solicitud no ha sido aprobada</h2>"+
	    "<p style='text-align: center;vertical-align: middle;line-height: 10px;'>Puedes ver nuevo contenido y descargar juegos gratis.</p>"+
	    "<p style='text-align: center;vertical-align: middle;line-height: 10px;'>Sólo ingresa al sítio: </p>"+
	    "<a style='color:#0A5786;;'href='http://pulsegames.com'><h2 style='text-align: center;vertical-align: middle;line-height: 30px;text-decoration: underline;'>http://pulsegames.com</h2></a>"+
	    "</div>"+
	    "</div>";
	return mail;
    }
}
