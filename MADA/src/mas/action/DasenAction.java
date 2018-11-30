package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import mas.FileUtil;
import mas.UploadUtil;
import mas.bean.DasenBean;
import mas.service.DasenService;

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
 * Created by Administrator on 2018/4/16.
 */
public class DasenAction extends ActionSupport{
    private String input_dasen_file;
    private String input_dasen_path;
    private String methValue;
    private String flag,flag_validate;
    private String stdoutlist;
    private List<File> fileField_dasen;
    private List<String> fileField_dasenFileName;
    private int plot;

    public String getInput_dasen_file() {
        return input_dasen_file;
    }

    public void setInput_dasen_file(String input_dasen_file) {
        this.input_dasen_file = input_dasen_file;
    }

    public String getInput_dasen_path() {
        return input_dasen_path;
    }

    public void setInput_dasen_path(String input_dasen_path) {
        this.input_dasen_path = input_dasen_path;
    }

    public String getMethValue() {
        return methValue;
    }

    public void setMethValue(String methValue) {
        this.methValue = methValue;
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

    public List<File> getFileField_dasen() {
        return fileField_dasen;
    }

    public void setFileField_dasen(List<File> fileField_dasen) {
        this.fileField_dasen = fileField_dasen;
    }

    public List<String> getFileField_dasenFileName() {
        return fileField_dasenFileName;
    }

    public void setFileField_dasenFileName(List<String> fileField_dasenFileName) {
        this.fileField_dasenFileName = fileField_dasenFileName;
    }

    public int getPlot() {
        return plot;
    }

    public void setPlot(int plot) {
        this.plot = plot;
    }
    private ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");

    public  String  Dasen_exe() throws Exception{
        //生成运行起始时间
        Date date=new Date();
        DateFormat format=new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
        String time=format.format(date);
        //构建session
        xmlUtil xmlUtil = new xmlUtil();
        String JobId="JobId_"+xmlUtil.generateString(6);
        xmlUtil.creatSession(JobId,time);
        ///upload
        String remote_tag;
        UploadUtil uploadUtil=new UploadUtil();
        System.out.println(fileField_dasen);
        System.out.println(fileField_dasenFileName);

        List<String> Upload_path=uploadUtil.upload(fileField_dasenFileName,fileField_dasen);
        remote_tag=Upload_path.get(0);
        System.out.println(remote_tag);
        //构造运行记录文件
        FileUtil fileUtil=new FileUtil();
        String admin_path= fileUtil.adminCheck_path()+".txt";
        File admin=new File(admin_path);
        appendMethodB(admin_path,"File list:"+"\r\n");
        String fileList="";
        for(int i=0;i<fileField_dasen.size();i++){
            appendMethodB(admin_path,Upload_path.get(i)+"\r\n");
            File file=new File(Upload_path.get(i));
            String name=file.getName();
            fileList+=name+" ; ";
        }
        xmlUtil.xmlAdd_Jobs(JobId,fileList, "Dasen", "ERROR","email",time);
        appendMethodB(admin_path,"Result path:"+"\r\n");
        ////////////////////////////////////////////////////////////////////////////////////
        DasenService dasenService = (DasenService) applicationContext.getBean("dasenService");
        FileUtil fileUtil1=new FileUtil();
        input_dasen_file=fileUtil1.Result_path();
        appendMethodB(admin_path,input_dasen_file+"\r\n");

        DasenBean dasenBean = new DasenBean();
        dasenBean.setDirectory(remote_tag);
        dasenBean.setMethValue(methValue);
        dasenBean.setResultsDir(input_dasen_file);
        dasenBean.setPlot(plot);

        dasenService.setDasenBean(dasenBean);
        stdoutlist=dasenService.Dasen_execute();
        flag="14";
        flag_validate="1";

        //将结果压缩
        FileUtil fileUtil2=new FileUtil();
        fileUtil2.ZipMultiFile("/home/bio/huxy/dataset/" + JobId, "/home/bio/huxy/dataset/" + JobId + ".zip.tar");
        return SUCCESS;
    }
    public String DasennoUpload() throws Exception{
        DasenService dasenService = (DasenService) applicationContext.getBean("dasenService");
        FileUtil fileUtil1=new FileUtil();
        input_dasen_file=fileUtil1.Result_path();
        DasenBean dasenBean = new DasenBean();
        dasenBean.setDirectory(input_dasen_file);
        dasenBean.setMethValue(methValue);
        dasenBean.setResultsDir(input_dasen_path);
        dasenBean.setPlot(plot);

        dasenService.setDasenBean(dasenBean);
        stdoutlist=dasenService.Dasen_execute();
        flag="14";
        flag_validate="1";
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
        if(input_dasen_file.equals("")){
            this.addFieldError("input_RAW_file", "Please input the raw IDAT file and Samplesheet.csv.");
        }
        try{
            UploadUtil uploadUtil2=new UploadUtil();
            if(!uploadUtil2.Check(fileField_dasenFileName,fileField_dasen)){
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

        flag="8";
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
