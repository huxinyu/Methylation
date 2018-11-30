package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import mas.FileUtil;
import mas.UploadUtil;
import mas.bean.BatchBean;
import mas.service.BatchService;
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
 * Created by Administrator on 2018/3/1.
 */
public class BatchAction extends ActionSupport{
    private String input_exprSetsva_file,input_sampleSheetsva_file,input_sva_path;
    private String batch;
    private String flag,flag_validate;
    private String stdoutlist;
    private String account_hidden;
    private List<File> fileField_sva;
    private List<String> fileField_svaFileName;
    private int plot;

    public String getInput_exprSetsva_file() {
        return input_exprSetsva_file;
    }

    public void setInput_exprSetsva_file(String input_exprSetsva_file) {
        this.input_exprSetsva_file = input_exprSetsva_file;
    }

    public String getInput_sampleSheetsva_file() {
        return input_sampleSheetsva_file;
    }

    public void setInput_sampleSheetsva_file(String input_sampleSheetsva_file) {
        this.input_sampleSheetsva_file = input_sampleSheetsva_file;
    }

    public String getInput_sva_path() {
        return input_sva_path;
    }

    public void setInput_sva_path(String input_sva_path) {
        this.input_sva_path = input_sva_path;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
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

    public String getAccount_hidden() {
        return account_hidden;
    }

    public void setAccount_hidden(String account_hidden) {
        this.account_hidden = account_hidden;
    }

    public List<File> getFileField_sva() {
        return fileField_sva;
    }

    public void setFileField_sva(List<File> fileField_sva) {
        this.fileField_sva = fileField_sva;
    }

    public List<String> getFileField_svaFileName() {
        return fileField_svaFileName;
    }

    public void setFileField_svaFileName(List<String> fileField_svaFileName) {
        this.fileField_svaFileName = fileField_svaFileName;
    }

    public int getPlot() {
        return plot;
    }

    public void setPlot(int plot) {
        this.plot = plot;
    }

    public ApplicationContext getApplicationContext() {
        return applicationContext;
    }

    public void setApplicationContext(ApplicationContext applicationContext) {
        this.applicationContext = applicationContext;
    }

    private ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");

    public String batch_exe() throws Exception{
        //生成运行起始时间
        Date date=new Date();
        DateFormat format=new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
        String time=format.format(date);
        //构建session
        xmlUtil xmlUtil = new xmlUtil();
        String JobId="JobId_"+xmlUtil.generateString(6);
        xmlUtil.creatSession(JobId,time);
        ///upload
        String remote_tag,remote_control;
        UploadUtil uploadUtil=new UploadUtil();
        System.out.println(fileField_svaFileName);
        System.out.println(fileField_sva);

        List<String> Upload_path=uploadUtil.upload(fileField_svaFileName,fileField_sva);
        remote_tag=Upload_path.get(0);
        remote_control= Upload_path.get(1);
        System.out.println(remote_tag);
        System.out.println(remote_control);
        //构造运行记录文件
        FileUtil fileUtil=new FileUtil();
        String admin_path= fileUtil.adminCheck_path()+".txt";
        File admin=new File(admin_path);
        appendMethodB(admin_path,"File list:"+"\r\n");
        String fileList="";
        for(int i=0;i<fileField_sva.size();i++){
            appendMethodB(admin_path,Upload_path.get(i)+"\r\n");
            File file=new File(Upload_path.get(i));
            String name=file.getName();
            fileList+=name+" ; ";
        }
        xmlUtil.xmlAdd_Jobs(JobId,fileList, "Combat", "ERROR","email",time);
        appendMethodB(admin_path,"Result path:"+"\r\n");
        ////////////////////////////////////////////////////////////////////////////////////////////////
        BatchService batchService = (BatchService) applicationContext.getBean("batchService");
        FileUtil fileUtil1=new FileUtil();
        input_sva_path=fileUtil1.Result_path();
        appendMethodB(admin_path,input_sva_path+"\r\n");
        BatchBean batchBean = new BatchBean();
        batchBean.setInput_exprSetsva_file(remote_tag);
        batchBean.setInput_sampleSheetsva_file(remote_control);
        batchBean.setPath(input_sva_path);

        batchBean.setPlot(plot);
        batchBean.setBatch(batch);

        batchService.setbatchBean(batchBean);
        stdoutlist=batchService.batch_execute();
        flag="14";
        flag_validate="1";

        //将结果压缩
        FileUtil fileUtil2=new FileUtil();
        fileUtil2.ZipMultiFile("/home/bio/huxy/dataset/" + JobId, "/home/bio/huxy/dataset/" + JobId + ".zip.tar");
        return SUCCESS;
    }

    public String batchnoUpload() throws Exception{
        BatchService batchService = (BatchService) applicationContext.getBean("batchService");
        BatchBean batchBean = new BatchBean();
        FileUtil fileUtil=new FileUtil();
        input_sva_path=fileUtil.Result_path();
        batchBean.setInput_exprSetsva_file(input_exprSetsva_file);
        batchBean.setInput_sampleSheetsva_file(input_sampleSheetsva_file);
        batchBean.setPath(input_sva_path);
        batchBean.setBatch(batch);

        batchService.setbatchBean(batchBean);
        stdoutlist= batchService.batch_execute();
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
        if(input_exprSetsva_file.equals("")){
            this.addFieldError("input_exprSet_file", "Please input the DNA methylation beta values or M values matrix(.csv) file");
        }
        if(input_sampleSheetsva_file.equals("")){
            this.addFieldError("input_sampleSheet_file", "Please input the SampleSheet(.csv) to generate contrast matrix");
        }
        try{
            UploadUtil uploadUtil2=new UploadUtil();
            if(!uploadUtil2.Check(fileField_svaFileName,fileField_sva)){
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

        flag="14";
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
