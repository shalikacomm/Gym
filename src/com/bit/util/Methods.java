package com.bit.util;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;	
import java.sql.Statement;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
 
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.Barcode128;
import com.itextpdf.text.pdf.PdfWriter;


public class Methods {
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
	 public String sendMail(String to, String subject, String Msgbody){
		  String result = null;
		  
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
	         result = "success";
	      } catch (MessagingException e) {
	            throw new RuntimeException(e);
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
