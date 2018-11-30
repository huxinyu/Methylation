package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Administrator on 2017/3/13 0013.
 */
public class RegisterAction extends ActionSupport {
    private String register_account;
    private String register_pass;
    private String register_pass_re;
    private String flag;
    private String User;
    private String result_register,result_login;
    private String register_email;
    private String register_comp;
    private String country2;

    public String getCountry2() {
        return country2;
    }

    public void setCountry2(String country2) {
        this.country2 = country2;
    }

    public String getRegister_comp() {
        return register_comp;
    }

    public void setRegister_comp(String register_comp) {
        this.register_comp = register_comp;
    }

    public String getRegister_email() {
        return register_email;
    }

    public void setRegister_email(String register_email) {
        this.register_email = register_email;
    }

    public String getResult_login() {
        return result_login;
    }

    public void setResult_login(String result_login) {
        this.result_login = result_login;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getRegister_account() {
        return register_account;
    }

    public void setRegister_account(String register_account) {
        this.register_account = register_account;
    }

    public String getRegister_pass() {
        return register_pass;
    }

    public void setRegister_pass(String register_pass) {
        this.register_pass = register_pass;
    }

    public String getRegister_pass_re() {
        return register_pass_re;
    }

    public void setRegister_pass_re(String register_pass_re) {
        this.register_pass_re = register_pass_re;
    }

    public String getUser() {
        return User;
    }

    public void setUser(String user) {
        User = user;
    }

    public String getResult_register() {
        return result_register;
    }

    public void setResult_register(String result_register) {
        this.result_register = result_register;
    }

    public String Register() throws Exception{
        String exist=read(register_account);
        if(exist.equals("1")){
            result_register="1";           //注册不成功
            result_login="0";
            flag="2";
        }
        else{
            User=add(register_account,register_pass,register_email,country2,register_comp);
            HttpServletRequest request= ServletActionContext.getRequest();
            request.getSession().setAttribute("account",register_account);
            request.getSession().setAttribute("password",register_pass);
            request.getSession().setAttribute("email",register_email);
            request.getSession().setAttribute("login","2");
            flag="3";
            result_login="0";
            result_register="2";
        }
        return SUCCESS;
    }
    public String read(String account) throws SAXException, IOException, ParserConfigurationException, TransformerException {
        //1.创建工厂
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.parse("/home/software/apache-tomcat-7.0.73/webapps/ROOT/User.xml");

        //2.检索
        NodeList nl = document.getElementsByTagName("User");
        System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$number of user:"+nl.getLength());

        if(nl.getLength()>1){
            for (int i = 0; i < nl.getLength(); i++) {
                String accountExist=document.getElementsByTagName("account").item(i).getFirstChild().getNodeValue();
                if(account.equals(accountExist)){
                    return "1";                 //若存在，注册不成功
                }
            }
        }
        return "2";
    }

    public String add(String account,String pass,String email,String country,String organization) throws SAXException, IOException, ParserConfigurationException, TransformerException {
        //1.创建工厂
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.parse("/home/software/apache-tomcat-7.0.73/webapps/ROOT/User.xml");

        //创建元素以及节点
        Element userElement = document.createElement("User");
        Element subElement_1=document.createElement("account");
        Element subElement_2=document.createElement("pass");
        Element subElement_3=document.createElement("email");
        Element subElement_4=document.createElement("country");
        Element subElement_5=document.createElement("organization");
        subElement_1.setTextContent(account);
        subElement_2.setTextContent(pass);
        subElement_3.setTextContent(email);
        subElement_4.setTextContent(country);
        subElement_5.setTextContent(organization);
        userElement.appendChild(subElement_1);
        userElement.appendChild(subElement_2);
        userElement.appendChild(subElement_3);
        userElement.appendChild(subElement_4);
        userElement.appendChild(subElement_5);
        Element root=document.getDocumentElement();
        root.normalize();
        root.appendChild(userElement);

        //把更新后的内存写回到xml
        TransformerFactory tFactory = TransformerFactory.newInstance();
        Transformer tf = tFactory.newTransformer();
        tf.transform(new DOMSource(document), new StreamResult(new FileOutputStream("/home/software/apache-tomcat-7.0.73/webapps/ROOT/User.xml")));
        return account;
    }
    public void validate(){
        if(register_account.equals("Please input your account")||register_pass.equals("Please input your password") ||register_pass_re.equals("Please repeat your password")||register_email.equals("Please input your email")||register_comp.equals("Please input your organization")||country2.equals("Select Country")){
            this.addFieldError("register_user", "Account/password/email/country cannot be empty.");
        }
        else{
            if(!register_pass.equals(register_pass_re) && !register_pass.equals("Please input your password") && !register_pass_re.equals("Please repeat your password") ){
                this.addFieldError("register_pass_re", "Two passwords must be the same.");
            }
            else{
                boolean flag_email = false;
                try{
                    String check ="^([a-z0-9A-Z]+[-|_|.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?.)+[a-zA-Z]{2,}$";
                    Pattern regex = Pattern.compile(check);
                    Matcher matcher = regex.matcher(register_email);
                    flag_email = matcher.matches();
                }catch(Exception e){
                    flag_email = false;
                }
                if(!flag_email){
                    this.addFieldError("register_email", "Invalid email address format.");
                }
            }
        }
        if(check()){
            this.addFieldError("check1", "The input contain invalid characters! ");
        }
        flag="2";
    }
    public boolean check() {
        String[] characterParams = {"~", "`", "!", "@", "#", "$", "%", "^", "&", "{", "}", "[", "]", "(", ")", ";", "\"", "'", "\\", "<", ">", "?", "/", "<<", ">>", "+"};
        boolean status = false;
        Map paramMap = ServletActionContext.getRequest().getParameterMap();
        Set<String> set = paramMap.keySet();
        String value="";
        for(Object aaa: set.toArray()){
            value = ((String[])paramMap.get(aaa))[0];
            for (int i = 0; i < characterParams.length; i++) {
                if (value.indexOf(characterParams[i]) >= 0) {
                    status = true;
                    break;
                }
            }
        }
        return status;
    }
}
