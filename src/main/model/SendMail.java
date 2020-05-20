package main.model;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SendMail implements Serializable{
	private static final long serialVersionUID = 1L;
	private int port;
    private String username;
    private String password;
    private Properties props;
    private String from;
    private String to;
    private String subject;
    private String content;
    private String msg;
    
	public void setTo(String to) {this.to = to;}
	public String getTo() {return to;}
	
	public void setSubject(String subject) {this.subject = subject;}
	public String getSubject() {return subject;}
	
	public void setContent(String content) {this.content = content;}
    public String getContent() {return content;}
    
	public String getMsg() {return msg;}
	
	public SendMail() {
		port=587;//25 純SMTP 465 後來的加密版SMTP 587最新的安全埠號 Outlook、Apple Mail都用它
		username="javafreemovie@gmail.com";
		password="java0609";
		from=username;
		
		props = new Properties();//建立鍵-值對照 然後把參數設好
	    props.put("mail.smtp.host", "smtp.gmail.com");
	    props.put("mail.smtp.auth", "true");//使用SMTP協定的AUTH擴充 安全性必要 送信前需驗證密碼
	    props.put("mail.smtp.starttls.enable", "true");//使用SMTP 的STARTTLS擴充 為內容加密
	    props.put("mail.smtp.port", port);
	    props.put("mail.smtp.ssl.trust", "smtp.gmail.com");//信任此host，沒設定的話信任與否會由伺服器的設定決定
	}
	
	//寄出
    public void execute() throws UnsupportedEncodingException {
    	try {
    		//用自訂方法建立要傳送的Message
            Message message = createMessage(from, to, subject, content);//下方自訂的方法 非MessageFactory.createMessage(MimeHeaders, java.io.InputStream) 
            Transport.send(message); //傳送
            
            System.out.println("郵件傳送成功");
            msg="3";
        } catch (MessagingException e) {
        	msg="2";
            throw new RuntimeException(e);
        }
    }
    
    private Message createMessage(
            String from, String to, String subject, String content)
                              throws MessagingException, UnsupportedEncodingException {
    	//Field
    	//Seesion 裡面包含了...
    	//參數設定群(props)、以及一個認證物件(Authenticator)...
    	//其有個方法能get帶有帳密元素的物件(PasswordAuthentication)
        Session session = Session.getInstance(props, new Authenticator() {  
            protected PasswordAuthentication getPasswordAuthentication() {  
                return new PasswordAuthentication(username, password);  
            }}
        );
        
        Multipart multiPart = multiPart(content);//自訂的方法　創建Multipart實例內容是自訂的content 晚點放入Message的Content裡
        Message message = new MimeMessage(session);//創個基本上空的Message 裡面的session包含帳密認證而已
/*from*/message.setFrom(new InternetAddress(from));
/*to*/  message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
/*subj*/message.setSubject(subject);
/*date*/message.setSentDate(new Date());
/*cotn*/message.setContent(multiPart);
        
        return message;
    }
    //自訂的方法
    //創造一個Multipart 它是Mime型的Multipart 且裡面包含了一個 MimeBodyPart以html格式包含了內容content
    private Multipart multiPart(String content)
            throws MessagingException, UnsupportedEncodingException {
        Multipart multiPart = new MimeMultipart();//創一個Mime型的Mutipart
        
        MimeBodyPart htmlPart = new MimeBodyPart();//創個MimeBodyPart晚點塞進Mutipart
        htmlPart.setContent(content, "text/html;charset=UTF-8");//BodyPart是html格式，內容為content
        multiPart.addBodyPart(htmlPart);//將MutiBodyPart塞進主體Mutipart
        
        return multiPart;
    }
    //^^^ method
}
