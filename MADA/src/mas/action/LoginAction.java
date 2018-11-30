package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;
import java.io.IOException;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.*;

/**
 * Created by Administrator on 2016/5/19 0019.
 */
public class LoginAction extends ActionSupport{
    private String login_user_name;
    private String login_user_pass;
    private String flag,User,login;
    private String result_login,result_register;
    private String workflow,tool;
    private int country2;
    private String register_comp;

    public String getRegister_comp() {
        return register_comp;
    }

    public void setRegister_comp(String register_comp) {
        this.register_comp = register_comp;
    }

    public int getCountry2() {
        return country2;
    }

    public void setCountry2(int country2) {
        this.country2 = country2;
    }

    public String getWorkflow() {
        return workflow;
    }

    public void setWorkflow(String workflow) {
        this.workflow = workflow;
    }

    public String getTool() {
        return tool;
    }

    public void setTool(String tool) {
        this.tool = tool;
    }

    public String getResult_register() {
        return result_register;
    }

    public void setResult_register(String result_register) {
        this.result_register = result_register;
    }

    public String getResult_login() {
        return result_login;
    }

    public void setResult_login(String result_login) {
        this.result_login = result_login;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getUser() {
        return User;
    }

    public void setUser(String user) {
        User = user;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getLogin_user_pass() {
        return login_user_pass;
    }

    public void setLogin_user_pass(String login_user_pass) {
        this.login_user_pass = login_user_pass;
    }

    public String getLogin_user_name() {
        return login_user_name;
    }

    public void setLogin_user_name(String login_user_name) {
        this.login_user_name = login_user_name;
    }

    public String Login() throws Exception{
        //1 是登录不成功
        if(read(login_user_name, login_user_pass).equals("1")){
            Exit exit=new Exit();
            exit.Exit();
            result_login="1";
            result_register="0";
            flag="1";
        }
        else{
            Exit exit=new Exit();
            exit.Exit();
            HttpServletRequest request=ServletActionContext.getRequest();
            request.getSession().setAttribute("account",login_user_name);
            request.getSession().setAttribute("password",login_user_pass);
            request.getSession().setAttribute("login","2");
            result_login="2";
            result_register="0";
            flag="1";
        }
        return SUCCESS;
    }

    public String read(String account,String password) throws SAXException, IOException, ParserConfigurationException, TransformerException {
        //1.创建工厂
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.parse("/home/software/apache-tomcat-7.0.73/webapps/User.xml");
        //2.检索
        NodeList nl = document.getElementsByTagName("User");
        System.out.println("^^^^^^^^^nl.getLength()"+nl.getLength());
        if(nl.getLength()>0){
            for (int i = 0; i < nl.getLength(); i++) {
                String accountExist=document.getElementsByTagName("account").item(i).getFirstChild().getNodeValue();
                if(account.equals(accountExist)){
                    String passwordExist=document.getElementsByTagName("pass").item(i).getFirstChild().getNodeValue();
                    if(password.equals(passwordExist)){
                        return "2";                                    //2登陆成功
                    }
                }
            }
        }
        return "1";
        }

    public void validate(){

        if(login_user_name.equals("Please input your account")&&!login_user_pass.equals("Please input your password")){
            this.addFieldError("login_user_name", "Account or password cannot be empty.");
        }
        if(login_user_pass.equals("Please input your password")&&!login_user_name.equals("Please input your account")){
            this.addFieldError("login_user_pass", "Account or password cannot be empty.");
        }
        if(login_user_pass.equals("Please input your password")&&login_user_name.equals("Please input your account")){
            this.addFieldError("login_user", "Account or password cannot be empty.");
        }
        if(check()){
            this.addFieldError("check1", "The input contain invalid characters! ");
        }
        flag="1";
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
