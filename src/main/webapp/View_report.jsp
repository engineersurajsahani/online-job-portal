
<%@page import="java.util.Map"%>
<%@page import="java.sql.Connection"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
       
       String event=request.getParameter("submit");
       
       
       
       if(event!=null)
       {
           // Normal Report
            if(event.equals("User List"))
            {
                Connection cn = null;
                try 
                {
cn = util.DB.get();

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("report/Userlist.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
       }
       
       
       if(event!=null)
       {
           // Normal Report
            if(event.equals("Recruiter List"))
            {
                Connection cn = null;
                try 
                {
cn = util.DB.get();

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("report/recruter_list.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
       }
       
       
       
      
       if(event!=null)
       {
           // Normal Report
            if(event.equals("Job List"))
            {
                Connection cn = null;
                try 
                {
cn = util.DB.get();

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("report/job_list.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
       }
       
       
       if(event!=null)
       {
           // Normal Report
            if(event.equals("Category List"))
            {
                Connection cn = null;
                try 
                {
cn = util.DB.get();

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("report/category_list.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
       }
       
       if(event!=null)
       {
           // Normal Report
            if(event.equals("Applay List"))
            {
                Connection cn = null;
                try 
                {
cn = util.DB.get();

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("report/applay_list.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
       }
       

       
       
       if(event!=null)
       {
           // Normal Report
            if(event.equals("Feedback List"))
            {
                Connection cn = null;
                try 
                {
cn = util.DB.get();

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("report/feedback_list.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), null, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
       }
       
       
       if(event!=null)
       {
           // Normal Report
           
           String id = request.getParameter("id");
            if(event.equals("ID User List"))
            {
                Connection cn = null;
                try 
                {
cn = util.DB.get();

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("report/id_wise_user_list.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                
                parameters.put("id", id);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
       }
       
       
       if(event!=null)
       {
           // Normal Report
           
           String id = request.getParameter("id");
            if(event.equals("ID Recruiter List"))
            {
                Connection cn = null;
                try 
                {
cn = util.DB.get();

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("report/id_wise_recruter_list.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                
                parameters.put("id", id);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
       }
       
       
       if(event!=null)
       {
           // Normal Report
           
           String id = request.getParameter("id");
            if(event.equals("ID Job List"))
            {
                Connection cn = null;
                try 
                {
cn = util.DB.get();

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("report/id_wise_job_list.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                
                parameters.put("id", id);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
       }
       
       
       
       if(event!=null)
       {
           // Normal Report
           
           String id = request.getParameter("id");
            if(event.equals("ID Applay List"))
            {
                Connection cn = null;
                try 
                {
cn = util.DB.get();

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("report/id_wise_apply_list.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                
                parameters.put("id", id);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
       }
       
        
       
       if(event!=null)
       {
           // Normal Report
           
           String date = request.getParameter("date");
            if(event.equals("Date Applay List"))
            {
                Connection cn = null;
                try 
                {
cn = util.DB.get();

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("report/date_wise_applay_list.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                
                parameters.put("date", date);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
       }
       
       
       
       if(event!=null)
       {
           // Normal Report
           
           String date = request.getParameter("date");
            if(event.equals("Date Feedback List"))
            {
                Connection cn = null;
                try 
                {
cn = util.DB.get();

                } 
                catch (Exception ex) 
                {
                    ex.printStackTrace();
                }

                File reportFile = new File(application.getRealPath("report/date_wise_feedback_list.jasper"));//your report_name.jasper file
                Map parameters = new HashMap();
                
                parameters.put("date", date);
                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, cn);

                response.setContentType("application/pdf"); 
                response.setContentLength(bytes.length);
                ServletOutputStream outStream = response.getOutputStream();
                outStream.write(bytes, 0, bytes.length);
                outStream.flush();
                outStream.close();
                       
           }
            
       }
              
        %>
    </body>
</html>
