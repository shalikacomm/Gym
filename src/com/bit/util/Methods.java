package com.bit.util;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;	
import java.sql.Statement;
import java.util.HashMap;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
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

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
 
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.Barcode128;
import com.itextpdf.text.pdf.PdfWriter;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;



public class Methods {
	
	  public String RandomCode() {
	        java.util.Random r = new java.util.Random();
	        int i = 1, n = 0;
	        char c;
	        String str = "";
	        for (int t = 0; t < 3; t++) {
	            while (true) {
	                i = r.nextInt(10);
	                if (i > 5 && i < 10) {

	                    if (i == 9) {
	                        i = 90;
	                        n = 90;
	                        break;
	                    }
	                    if (i != 90) {
	                        n = i * 10 + r.nextInt(10);
	                        while (n < 65) {
	                            n = i * 10 + r.nextInt(10);
	                        }
	                    }

	                    break;
	                }
	            }
	            c = (char) n;

	            str = String.valueOf(c) + str;
	        }
	        while (true) {
	            i = r.nextInt(10000000);
	            if (i > 999999) {
	                break;
	            }
	        }
	        str = str + i;
	        System.out.println("CODE: " + str);
	        return str;
	    }
	  public String generateID(String prefix, String column, String tableName) {
	        String generatedId = "";
	        Connection con=null;
	        try {
	        	con=DBUtil.getConnection();
	            ResultSet rows;
	            Statement s = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

	            rows = s.executeQuery("SELECT * FROM " + tableName + " WHERE " + column + "=(SELECT MAX(" + column + ") FROM " + tableName + ")");//selectMax

	            int b = 0;

	            while (rows.next()) {

	                String id = rows.getString(column);
	                String a = id.substring(1);
	                b = Integer.parseInt(a);
	            }

	            if (b <= 8) {
	                b += 1;
	                generatedId += prefix + "000" + b;
	                return generatedId;
	            } else {
	                b += 1;
	                generatedId += prefix + "00" + b;
	                return generatedId;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }finally {
				if(con != null){
					try {
						con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
	        return generatedId;
	    }
	 public boolean sendMail(String to, String subject, String Msgbody){
		  boolean result = false;
		  
		//  to = "shalikacomm@gmail.com"; //change accordingly

	      // Sender's email ID needs to be mentioned
	      String from = "fitandfunmessenger@gmail.com";//change accordingly
	      final String username = "fitandfunmessenger";//change accordingly
	      final String password = "fitadmin123";//change accordingly

	      // Assuming you are sending email through relay.jangosmtp.net
	      String host = "smtp.gmail.com";

	      Properties props = new Properties();
	      props.put("mail.smtp.auth", "true");
	      props.put("mail.smtp.starttls.enable", "true");
	      props.put("mail.smtp.host", host);
	      props.put("mail.smtp.port", "587");

	      // Get the Session object.
	      Session session = Session.getInstance(props,
	      new javax.mail.Authenticator() {
	         protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(username, password);
	         }
	      });

	      try {
	         // Create a default MimeMessage object.
	         Message message = new MimeMessage(session);

	         // Set From: header field of the header.
	         message.setFrom(new InternetAddress(from));

	         // Set To: header field of the header.
	         message.setRecipients(Message.RecipientType.TO,
	         InternetAddress.parse(to));

	         // Set Subject: header field
	         message.setSubject(subject);

	         // Now set the actual message
	         message.setText(Msgbody);

	         // Send message
	         Transport.send(message);

	         System.out.println("Sent message successfully....");
	         result = true;
	      } catch (MessagingException e) {
	            throw new RuntimeException(e);
	      }
		  
		  
		  return result;
	  }
	  
	   public void ExportPDFquote(String jasperPath, String PdfOutPath, String id, String jasperPara1) throws SQLException, JRException {

	        Connection con = DBUtil.getConnection();
	        HashMap para = new HashMap();
	        para.put(jasperPara1, id);
	        JasperPrint jp = JasperFillManager.fillReport(jasperPath, para, con);
	        JRExporter exporter = new net.sf.jasperreports.engine.export.JRPdfExporter();

	        exporter.setParameter(JRExporterParameter.JASPER_PRINT, jp);
	        exporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, PdfOutPath);
	        exporter.exportReport();

	    }
	   
	   
	   public String SendMailAttachment(String To, String subject, String messageBody, String file_path) {
	        String result = null;
	        // Sender's email ID needs to be mentioned
	        String from = "fitandfunmessenger@gmail.com";
	        String pass = "fitadmin123";
	        // Recipient's email ID needs to be mentioned.
	        String to = To;
	        String host = "smtp.gmail.com";

	        // Get system properties
	        Properties properties = System.getProperties();
	        // Setup mail server
	        properties.put("mail.smtp.starttls.enable", "true");
	        properties.put("mail.smtp.host", host);
	        properties.put("mail.smtp.user", from);
	        properties.put("mail.smtp.password", pass);
	        properties.put("mail.smtp.port", "587");
	        properties.put("mail.smtp.auth", "true");

	        // Get the default Session object.
	        Session session = Session.getDefaultInstance(properties);

	        try {
	            // Create a default MimeMessage object.
	            MimeMessage message = new MimeMessage(session);

	            // Set From: header field of the header.
	            message.setFrom(new InternetAddress(from));

	            // Set To: header field of the header.
	            message.addRecipient(Message.RecipientType.TO,
	                    new InternetAddress(to));

	            // Set Subject: header field
	            message.setSubject(subject);

	            // Now set the actual message
	            message.setText("This is actual message");

	            /////
	            // Create the message part
	            BodyPart messageBodyPart = new MimeBodyPart();

	            // Now set the actual message
	            messageBodyPart.setText(messageBody);
	            // Create a multipar message
	            Multipart multipart = new MimeMultipart();

	            // Set text message part
	            multipart.addBodyPart(messageBodyPart);

	            // Part two is attachment
	            messageBodyPart = new MimeBodyPart();
	            String filename = file_path;
	            DataSource source = new FileDataSource(filename);
	            messageBodyPart.setDataHandler(new DataHandler(source));
	            messageBodyPart.setFileName(filename);
	            multipart.addBodyPart(messageBodyPart);

	            // Send the complete message parts
	            message.setContent(multipart);

	            ////
	            // Send message
	            Transport transport = session.getTransport("smtp");
	            transport.connect(host, from, pass);
	            transport.sendMessage(message, message.getAllRecipients());
	            transport.close();
	            System.out.println("Sent message successfully....");
	            result = "success";
	        } catch (MessagingException mex) {
	            mex.printStackTrace();
	        }
	        return result;
	    }
	/* public void generateBarcode() {
		 
		 
		    Document document = new Document(new Rectangle(PageSize.A4));    
		    PdfWriter writer = null;
			try {
				writer = PdfWriter.getInstance(document, new FileOutputStream("D:/barcode/Java4s_BarCode_128.jpg"));
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}    
		 
		    document.open();
			    try {
					document.add(new Paragraph("Code_128 Format_Java4s.com"));
				} catch (DocumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		 
				    Barcode128 code128 = new Barcode128();
				    code128.setGenerateChecksum(true);
				    code128.setCode("1234554321");    
		 
			    try {
					document.add(code128.createImageWithBarcode(writer.getDirectContent(), null, null));
				} catch (DocumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    document.close();
		 
		    System.out.println("Document Generated...!!!!!!");
		  }*/
		  
		 
		
	  /*
	    public void ExportPDFquote(String jasperPath, String PdfOutPath, String id, String ver_no, String jasperPara1, String jasperPara2) throws SQLException, JRException {

	        Connection con = DBUtil.getConnection();
	        HashMap para = new HashMap();
	        para.put(jasperPara1, id);
	        para.put(jasperPara2, ver_no);
	        JasperPrint jp = JasperFillManager.fillReport(jasperPath, para, con);
	        JRExporter exporter = new net.sf.jasperreports.engine.export.JRPdfExporter();

	        exporter.setParameter(JRExporterParameter.JASPER_PRINT, jp);
	        exporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, PdfOutPath);
	        exporter.exportReport();

	    }
	    */

}
