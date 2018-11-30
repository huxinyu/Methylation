package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import mas.FileUtil;
import mas.UploadUtil;
import mas.bean.RawBean;
import mas.service.RawService;
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
 * Created by Administrator on 2018/3/19.
 */
public class RawAction extends ActionSupport {
    private String input_RAW_file;
    private String input_RAW_path;
    private String methValue;
    private String flag,flag_validate;
    private String stdoutlist;
    private List<File> fileField_raw;
    private List<String> fileField_rawFileName;
    private int plot;

    public int getPlot() {
        return plot;
    }

    public void setPlot(int plot) {
        this.plot = plot;
    }

    public String getInput_RAW_file() {
        return input_RAW_file;
    }

    public void setInput_RAW_file(String input_RAW_file) {
        this.input_RAW_file = input_RAW_file;
    }

    public String getInput_RAW_path() {
        return input_RAW_path;
    }

    public void setInput_RAW_path(String input_RAW_path) {
        this.input_RAW_path = input_RAW_path;
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

    public List<File> getFileField_raw() {
        return fileField_raw;
    }

    public void setFileField_raw(List<File> fileField_raw) {
        this.fileField_raw = fileField_raw;
    }

    public List<String> getFileField_rawFileName() {
        return fileField_rawFileName;
    }

    public void setFileField_rawFileName(List<String> fileField_rawFileName) {
        this.fileField_rawFileName = fileField_rawFileName;
    }

    private ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");

    public String RAW_exe() throws Exception{
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
        System.out.println(fileField_raw);
        System.out.println(fileField_rawFileName);

        List<String> Upload_path=uploadUtil.upload(fileField_rawFileName,fileField_raw);
        remote_tag=Upload_path.get(0);
        System.out.println(remote_tag);
        //构造运行记录文件
        FileUtil fileUtil=new FileUtil();
        String admin_path= fileUtil.adminCheck_path()+".txt";
        File admin=new File(admin_path);
        appendMethodB(admin_path,"File list:"+"\r\n");
        String fileList="";
        for(int i=0;i<fileField_raw.size();i++){
            appendMethodB(admin_path,Upload_path.get(i)+"\r\n");
            File file=new File(Upload_path.get(i));
            String name=file.getName();
            fileList+=name+" ; ";
        }
        xmlUtil.xmlAdd_Jobs(JobId,fileList, "RAW", "ERROR","email",time);
        appendMethodB(admin_path,"Result path:"+"\r\n");
        ////////////////////////////////////////////////////////////////////////////////////
        RawService rawService = (RawService) applicationContext.getBean("rawService");
        FileUtil fileUtil1=new FileUtil();
        input_RAW_path=fileUtil1.Result_path();
        appendMethodB(admin_path,input_RAW_path+"\r\n");

        RawBean rawBean = new RawBean();
        rawBean.setDirectory(remote_tag);
        rawBean.setMethValue(methValue);
        rawBean.setResultsDir(input_RAW_path);
        rawBean.setPlot(plot);

        rawService.setRawBean(rawBean);
        stdoutlist=rawService.RAW_execute();
        flag="8";
        flag_validate="1";

        //将结果压缩
        FileUtil fileUtil2=new FileUtil();
        fileUtil2.ZipMultiFile("/home/bio/huxy/dataset/" + JobId, "/home/bio/huxy/dataset/" + JobId + ".zip.tar");
        return SUCCESS;
    }
    public String RawnoUpload() throws Exception{
        RawService rawService = (RawService) applicationContext.getBean("rawService");
        FileUtil fileUtil1=new FileUtil();
        input_RAW_path=fileUtil1.Result_path();
        RawBean rawBean = new RawBean();
        rawBean.setDirectory(input_RAW_file);
        rawBean.setMethValue(methValue);
        rawBean.setResultsDir(input_RAW_path);
        rawBean.setPlot(plot);

        rawService.setRawBean(rawBean);
        stdoutlist=rawService.RAW_execute();
        flag="8";
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
        if(input_RAW_file.equals("")){
            this.addFieldError("input_RAW_file", "Please input the raw IDAT file and Samplesheet.csv.");
        }
        try{
            UploadUtil uploadUtil2=new UploadUtil();
            if(!uploadUtil2.Check(fileField_rawFileName,fileField_raw)){
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
