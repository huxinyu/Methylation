package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import mas.FileUtil;
import mas.UploadUtil;
import mas.bean.SamrBean;
import mas.service.SamrService;
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
public class SamrAction extends ActionSupport{
    private String input_exprSetsamr_file,input_sampleSheetsamr_file,input_samr_path;
    private String arraytype;
    private String adjPval;
    private String methValue;


    private String flag,flag_validate;
    private String stdoutlist;
    private String account_hidden;
    private List<File> fileField_samr;
    private List<String> fileField_samrFileName;

    private int plot;

    public String getMethValue() {
        return methValue;
    }

    public void setMethValue(String methValue) {
        this.methValue = methValue;
    }

    public String getInput_exprSetsamr_file() {
        return input_exprSetsamr_file;
    }

    public void setInput_exprSetsamr_file(String input_exprSetsamr_file) {
        this.input_exprSetsamr_file = input_exprSetsamr_file;
    }

    public String getInput_sampleSheetsamr_file() {
        return input_sampleSheetsamr_file;
    }

    public void setInput_sampleSheetsamr_file(String input_sampleSheetsamr_file) {
        this.input_sampleSheetsamr_file = input_sampleSheetsamr_file;
    }

    public String getInput_samr_path() {
        return input_samr_path;
    }

    public void setInput_samr_path(String input_samr_path) {
        this.input_samr_path = input_samr_path;
    }

    public String getArraytype() {
        return arraytype;
    }

    public void setArraytype(String arraytype) {
        this.arraytype = arraytype;
    }

    public String getAdjPval() {
        return adjPval;
    }

    public void setAdjPval(String adjPval) {
        this.adjPval = adjPval;
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

    public List<File> getFileField_samr() {
        return fileField_samr;
    }

    public void setFileField_samr(List<File> fileField_samr) {
        this.fileField_samr = fileField_samr;
    }

    public List<String> getFileField_samrFileName() {
        return fileField_samrFileName;
    }

    public void setFileField_samrFileName(List<String> fileField_samrFileName) {
        this.fileField_samrFileName = fileField_samrFileName;
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

    public String Samr_exe() throws Exception{
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
        System.out.println(fileField_samrFileName);
        System.out.println(fileField_samr);

        List<String> Upload_path=uploadUtil.upload(fileField_samrFileName,fileField_samr);
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
        for(int i=0;i<fileField_samr.size();i++){
            appendMethodB(admin_path,Upload_path.get(i)+"\r\n");
            File file=new File(Upload_path.get(i));
            String name=file.getName();
            fileList+=name+" ; ";
        }
        xmlUtil.xmlAdd_Jobs(JobId,fileList, "SAMR", "ERROR","email",time);
        appendMethodB(admin_path,"Result path:"+"\r\n");
        ////////////////////////////////////////////////////////////////////////////////////////////////
        SamrService samrService = (SamrService) applicationContext.getBean("samrService");
        FileUtil fileUtil1=new FileUtil();
        input_samr_path=fileUtil1.Result_path();
        appendMethodB(admin_path,input_samr_path+"\r\n");
        SamrBean samrBean = new SamrBean();
        samrBean.setInput_exprSetsamr_file(remote_tag);
        samrBean.setInput_sampleSheetsamr_file(remote_control);
        samrBean.setPath(input_samr_path);
        samrBean.setArraytype(arraytype);
        samrBean.setAdjPval(adjPval);
        samrBean.setPlot(plot);
        samrBean.setMethValue(methValue);

        samrService.setSamrBean(samrBean);
        stdoutlist=samrService.samr_execute();
        flag="16";
        flag_validate="1";

        //将结果压缩
        FileUtil fileUtil2=new FileUtil();
        fileUtil2.ZipMultiFile("/home/bio/huxy/dataset/" + JobId, "/home/bio/huxy/dataset/" + JobId + ".zip.tar");
        return SUCCESS;
    }

    public String SamrnoUpload() throws Exception{

        SamrService samrService = (SamrService) applicationContext.getBean("samrService");
        SamrBean samrBean = new SamrBean();
        FileUtil fileUtil=new FileUtil();
        input_samr_path=fileUtil.Result_path();
        samrBean.setInput_exprSetsamr_file(input_exprSetsamr_file);
        samrBean.setInput_sampleSheetsamr_file(input_sampleSheetsamr_file);
        samrBean.setPath(input_samr_path);
        samrBean.setArraytype(arraytype);
        samrBean.setAdjPval(adjPval);
        samrBean.setPlot(plot);
        samrBean.setMethValue(methValue);

        samrService.setSamrBean(samrBean);
        stdoutlist= samrService.samr_execute();
        flag="16";
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
        if(input_exprSetsamr_file.equals("")){
            this.addFieldError("input_exprSet_file", "Please input the DNA methylation beta values or M values matrix(.csv) file");
        }
        if(input_sampleSheetsamr_file.equals("")){
            this.addFieldError("input_sampleSheet_file", "Please input the SampleSheet(.csv) to generate contrast matrix");
        }
        try{
            UploadUtil uploadUtil2=new UploadUtil();
            if(!uploadUtil2.Check(fileField_samrFileName,fileField_samr)){
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

        flag="9";
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
