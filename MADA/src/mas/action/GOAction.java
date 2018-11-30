package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import mas.FileUtil;
import mas.UploadUtil;
import mas.bean.GOBean;
import mas.service.GOService;
import mas.xmlUtil;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by Administrator on 2018/4/2.
 */
public class GOAction extends ActionSupport{
    private String input_go,input_path_go;
    private String arraytype;
    private int GO_option;
    private String plot_bias,prior_prob;
    private String flag,flag_validate;
    private String stdoutlist;
    private List<File> Go_file;
    private List<String> Go_fileFileName;
    private int plot;
    private int number;

    public int getPlot() {
        return plot;
    }

    public void setPlot(int plot) {
        this.plot = plot;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getInput_go() {
        return input_go;
    }

    public void setInput_go(String input_go) {
        this.input_go = input_go;
    }

    public String getInput_path_go() {
        return input_path_go;
    }

    public void setInput_path_go(String input_path_go) {
        this.input_path_go = input_path_go;
    }

    public String getArraytype() {
        return arraytype;
    }

    public void setArraytype(String arraytype) {
        this.arraytype = arraytype;
    }

    public int getGO_option() {
        return GO_option;
    }

    public void setGO_option(int GO_option) {
        this.GO_option = GO_option;
    }


    public String getPlot_bias() {
        return plot_bias;
    }

    public void setPlot_bias(String plot_bias) {
        this.plot_bias = plot_bias;
    }

    public String getPrior_prob() {
        return prior_prob;
    }

    public void setPrior_prob(String prior_prob) {
        this.prior_prob = prior_prob;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getFlag_validate() {
        return flag_validate;
    }

    public void setFlag_validate(String flag_validate) {
        this.flag_validate = flag_validate;
    }

    public String getStdoutlist() {
        return stdoutlist;
    }

    public void setStdoutlist(String stdoutlist) {
        this.stdoutlist = stdoutlist;
    }

    public List<File> getGo_file() {
        return Go_file;
    }

    public void setGo_file(List<File> go_file) {
        Go_file = go_file;
    }

    public List<String> getGo_fileFileName() {
        return Go_fileFileName;
    }

    public void setGo_fileFileName(List<String> go_fileFileName) {
        Go_fileFileName = go_fileFileName;
    }

    private ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    public String GO_exe() throws Exception{
        if(input_go.equals("DMP_GSE90060.csv") && arraytype.equals("450K")){
            GODemoAction goDemoAction=new GODemoAction();
            goDemoAction.Demo();
            flag="1";
            flag_validate="1";
        }
        else {
            //生成运行起始时间
            Date date = new Date();
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
            String time = format.format(date);
            //构建session
            xmlUtil xmlUtil = new xmlUtil();
            String JobId = "JobId_" + xmlUtil.generateString(6);
            xmlUtil.creatSession(JobId, time);
            ///upload
            String remote_tag;
            UploadUtil uploadUtil = new UploadUtil();
            System.out.println(Go_file);
            System.out.println(Go_fileFileName);

            List<String> Upload_path = uploadUtil.upload(Go_fileFileName, Go_file);
            remote_tag = Upload_path.get(0);
            System.out.println(remote_tag);
            //构造运行记录文件
            FileUtil fileUtil = new FileUtil();
            String admin_path = fileUtil.adminCheck_path() + ".txt";
            File admin = new File(admin_path);
            appendMethodB(admin_path, "File list:" + "\r\n");
            String fileList = "";
            for (int i = 0; i < Go_file.size(); i++) {
                appendMethodB(admin_path, Upload_path.get(i) + "\r\n");
                File file = new File(Upload_path.get(i));
                String name = file.getName();
                fileList += name + " ; ";
            }
            xmlUtil.xmlAdd_Jobs(JobId, fileList, "GO", "ERROR", "email", time);
            appendMethodB(admin_path, "Result path:" + "\r\n");
            ////////////////////////////////////////////////////////////////////////////////////
            GOService goService = (GOService) applicationContext.getBean("goService");
            FileUtil fileUtil1 = new FileUtil();
            input_path_go = fileUtil1.Result_path();
            appendMethodB(admin_path, input_path_go + "\r\n");

            GOBean goBean = new GOBean();
            goBean.setInput_go(remote_tag);
            goBean.setPath_go(input_path_go);
            goBean.setArraytype(arraytype);
            goBean.setPlot(plot);
            goBean.setNumber(number);

            if (GO_option == 1) {
                goBean.setOption("");
            } else {
                goBean.setOption("plot.bias=" + plot_bias + ",prior.prob=" + prior_prob);
            }
            goService.setGoBean(goBean);
            stdoutlist = goService.GO();
            flag = "2";
            flag_validate = "1";

            //将结果压缩
            FileUtil fileUtil2 = new FileUtil();
            fileUtil2.ZipMultiFile("/home/bio/huxy/dataset/" + JobId, "/home/bio/huxy/dataset/" + JobId + ".zip.tar");
        }
        return SUCCESS;
    }
    public static void appendMethodB(String fileName, String content) {
        try {
            FileWriter writer = new FileWriter(fileName, true);
            writer.write(content);
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void validate() {
        if(input_go.equals("")){
            this.addFieldError("Go_file", "Please input the raw IDAT file and Samplesheet.csv.");
        }
        try{
            UploadUtil uploadUtil2=new UploadUtil();
            if(!uploadUtil2.Check(Go_fileFileName,Go_file)){
                /*HttpServletResponse response = ServletActionContext.getResponse();
                response.setContentType("text/html; charset=utf-8");
                response.getWriter().println("<script language='javascript'>alert('The file should be in right format and right size!');</script>");*/
                this.addFieldError("check1", "The file should be in right format and right size!");
            }
        }catch(Exception e){
        }
        if(check()){
            this.addFieldError("check1", "The input contain invalid characters! ");
        }

        flag="1";
        flag_validate="2";
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
