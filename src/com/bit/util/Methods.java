package com.bit.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
