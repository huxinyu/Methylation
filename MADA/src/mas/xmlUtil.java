package mas;

import org.apache.struts2.ServletActionContext;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * Created by Administrator on 2017/3/15 0015.
 */
public class xmlUtil {


    public void xmlAdd(String file,String tool) throws Exception{
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.parse("/home/bio/software/apache-tomcat-7.0.91/webapps/MADA/RecentJobs.xml");
        HttpServletRequest request = ServletActionContext.getRequest();
        String account = (String) request.getSession().getAttribute("account");
        NodeList nl = document.getElementsByTagName("User");
        for (int i = 0; i < nl.getLength(); i++){
            NodeList nodeNum=document.getElementsByTagName("User").item(i).getChildNodes();
            String accountExist=document.getElementsByTagName("account").item(i).getFirstChild().getNodeValue();
            System.out.println("&&&&&&&&&&&&&&&&&&&&accountExist:"+accountExist);
            if(account.equals(accountExist)){
                int num=nodeNum.getLength()-4;
                System.out.println("&&&&&&&&&&&&&&&&&&&&nodeNum.getLength():"+nodeNum.getLength());
                System.out.println("&&&&&&&&&&&&&&&&&&&&work:"+num);
                Element element=document.createElement("work_"+num);
                Element subElement_1=document.createElement("workId");
                Element subElement_2=document.createElement("time");
                Element subElement_3=document.createElement("tool");
                Element subElement_4=document.createElement("file");
                Date date=new Date();
                DateFormat format=new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
                String time=format.format(date);
                subElement_1.setTextContent(time+"_"+tool);
                subElement_2.setTextContent(time);
                subElement_3.setTextContent(tool);
                subElement_4.setTextContent(file);
                element.appendChild(subElement_1);
                element.appendChild(subElement_2);
                element.appendChild(subElement_3);
                element.appendChild(subElement_4);
                Node root=document.getElementsByTagName("User").item(i);
                root.normalize();
                root.appendChild(element);
                TransformerFactory tFactory = TransformerFactory.newInstance();
                Transformer tf = tFactory.newTransformer();
                tf.transform(new DOMSource(document), new StreamResult(new FileOutputStream("/home/bio/software/apache-tomcat-7.0.91/webapps/MADA/RecentJobs.xml")));
            }
        }

    }

    public String xmlAdd_Jobs(String JobId,String file,String tool,String error,String email,String time) throws Exception{
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.parse("/home/bio/software/apache-tomcat-7.0.91/webapps/MADA/RecentJobs.xml");

            NodeList nodeNum=document.getElementsByTagName("Jobs").item(0).getChildNodes();
                int num=nodeNum.getLength();
                System.out.println("&&&&&&&&&&&&&&&&&&&&nodeNum.getLength():"+nodeNum.getLength());
                System.out.println("&&&&&&&&&&&&&&&&&&&&work:"+num);
                Element element=document.createElement("job");
                Element subElement_1=document.createElement("JobId");
                Element subElement_2=document.createElement("time");
                Element subElement_3=document.createElement("tool");
                Element subElement_4=document.createElement("file");
                Element subElement_5=document.createElement("error");
                Element subElement_6=document.createElement("email");
                subElement_1.setTextContent(JobId);
                subElement_2.setTextContent(time);
                subElement_3.setTextContent(tool);
                subElement_4.setTextContent(file);
                subElement_5.setTextContent(error);
                subElement_6.setTextContent(email);
                element.appendChild(subElement_1);
                element.appendChild(subElement_2);
                element.appendChild(subElement_3);
                element.appendChild(subElement_4);
                element.appendChild(subElement_5);
                element.appendChild(subElement_6);
                Node root=document.getElementsByTagName("Jobs").item(0);
                root.normalize();
                root.appendChild(element);
                TransformerFactory tFactory = TransformerFactory.newInstance();
                Transformer tf = tFactory.newTransformer();
                tf.transform(new DOMSource(document), new StreamResult(new FileOutputStream("/home/bio/software/apache-tomcat-7.0.91/webapps/MADA/RecentJobs.xml")));
        return JobId;
    }

    public String xmlAdd_Jobs_Demo(String file,String tool,String error,String email,String time) throws Exception{
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.parse("/home/bio/software/apache-tomcat-7.0.91/webapps/MADA/RecentJobs.xml");
        HttpServletRequest request = ServletActionContext.getRequest();
        NodeList nodeNum=document.getElementsByTagName("Jobs").item(0).getChildNodes();
        int num=nodeNum.getLength();
        System.out.println("&&&&&&&&&&&&&&&&&&&&nodeNum.getLength():"+nodeNum.getLength());
        System.out.println("&&&&&&&&&&&&&&&&&&&&work:"+num);
        Element element=document.createElement("job");
        Element subElement_1=document.createElement("JobId");
        Element subElement_2=document.createElement("time");
        Element subElement_3=document.createElement("tool");
        Element subElement_4=document.createElement("file");
        Element subElement_5=document.createElement("error");
        Element subElement_6=document.createElement("email");
        String JobId="JobId_Demo1";
        request.getSession().setAttribute("Session","Y");
        request.getSession().setAttribute("time",time);
        request.getSession().setAttribute("JobId",JobId);
        subElement_1.setTextContent(JobId);
        subElement_2.setTextContent(time);
        subElement_3.setTextContent(tool);
        subElement_4.setTextContent(file);
        subElement_5.setTextContent(error);
        subElement_6.setTextContent(email);
        element.appendChild(subElement_1);
        element.appendChild(subElement_2);
        element.appendChild(subElement_3);
        element.appendChild(subElement_4);
        element.appendChild(subElement_5);
        element.appendChild(subElement_6);
        Node root=document.getElementsByTagName("Jobs").item(0);
        root.normalize();
        root.appendChild(element);
        TransformerFactory tFactory = TransformerFactory.newInstance();
        Transformer tf = tFactory.newTransformer();
        tf.transform(new DOMSource(document), new StreamResult(new FileOutputStream("/home/bio/software/apache-tomcat-7.0.91/webapps/MADA/RecentJobs.xml")));
        return JobId;
    }

    public String xmlAdd_Jobs_Demo2(String file,String tool,String error,String email,String time) throws Exception{
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.parse("/home/bio/software/apache-tomcat-7.0.91/webapps/MADA/RecentJobs.xml");
        HttpServletRequest request = ServletActionContext.getRequest();
        NodeList nodeNum=document.getElementsByTagName("Jobs").item(0).getChildNodes();
        int num=nodeNum.getLength();
        System.out.println("&&&&&&&&&&&&&&&&&&&&nodeNum.getLength():"+nodeNum.getLength());
        System.out.println("&&&&&&&&&&&&&&&&&&&&work:"+num);
        Element element=document.createElement("job");
        Element subElement_1=document.createElement("JobId");
        Element subElement_2=document.createElement("time");
        Element subElement_3=document.createElement("tool");
        Element subElement_4=document.createElement("file");
        Element subElement_5=document.createElement("error");
        Element subElement_6=document.createElement("email");
        String JobId="JobId_Demo2";
        request.getSession().setAttribute("Session","Y");
        request.getSession().setAttribute("time",time);
        request.getSession().setAttribute("JobId",JobId);
        subElement_1.setTextContent(JobId);
        subElement_2.setTextContent(time);
        subElement_3.setTextContent(tool);
        subElement_4.setTextContent(file);
        subElement_5.setTextContent(error);
        subElement_6.setTextContent(email);
        element.appendChild(subElement_1);
        element.appendChild(subElement_2);
        element.appendChild(subElement_3);
        element.appendChild(subElement_4);
        element.appendChild(subElement_5);
        element.appendChild(subElement_6);
        Node root=document.getElementsByTagName("Jobs").item(0);
        root.normalize();
        root.appendChild(element);
        TransformerFactory tFactory = TransformerFactory.newInstance();
        Transformer tf = tFactory.newTransformer();
        tf.transform(new DOMSource(document), new StreamResult(new FileOutputStream("/home/bio/software/apache-tomcat-7.0.91/webapps/MADA/RecentJobs.xml")));
        return JobId;
    }
    public void login_validate(){
        HttpServletRequest request=ServletActionContext.getRequest();
        Object obj = request.getSession().getAttribute("account");
        if(obj==null){
            HttpServletResponse response=ServletActionContext.getResponse();
            try {
                response.setContentType("text/html; charset=UTF-8"); //转码
                PrintWriter out = response.getWriter();
                out.flush();
                out.println("<script>");
                out.println("alert('Please login/register first!');");
                out.println("history.back();");
                out.println("</script>");
            } catch (Exception e) {
                System.out.println("script print error");
            }
        }
        }

    public static String generateString(int length) {
        String allChar = "0123456789abcdefghijk";
        StringBuffer sb = new StringBuffer();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            sb.append(allChar.charAt(random.nextInt(allChar.length())));
        }
        return sb.toString();
    }

    public void creatSession(String JobId,String time){
        HttpServletRequest request = ServletActionContext.getRequest();
        request.getSession().setAttribute("Session","Y");
        request.getSession().setAttribute("time", time);
        request.getSession().setAttribute("JobId",JobId);
    }
}
