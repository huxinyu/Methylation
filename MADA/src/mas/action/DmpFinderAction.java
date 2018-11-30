package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import mas.FileUtil;
import mas.UploadUtil;
import mas.bean.DmpFinderBean;
import mas.service.DmpFinderService;
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
public class DmpFinderAction extends ActionSupport{
    private String input_exprSetdmpfinder_file,input_sampleSheetdmpfinder_file,input_dmpfinder_path;
    private String arraytype;
    private String adjPval;

    private String flag,flag_validate;
    private String stdoutlist;
    private String account_hidden;
    private List<File> fileField_dmpfinder;
    private List<String> fileField_dmpfinderFileName;

    private int plot;
    private String P_Value;

    public String getInput_exprSetdmpfinder_file() {
        return input_exprSetdmpfinder_file;
    }

    public void setInput_exprSetdmpfinder_file(String input_exprSetdmpfinder_file) {
        this.input_exprSetdmpfinder_file = input_exprSetdmpfinder_file;
    }

    public String getInput_sampleSheetdmpfinder_file() {
        return input_sampleSheetdmpfinder_file;
    }

    public void setInput_sampleSheetdmpfinder_file(String input_sampleSheetdmpfinder_file) {
        this.input_sampleSheetdmpfinder_file = input_sampleSheetdmpfinder_file;
    }

    public String getInput_dmpfinder_path() {
        return input_dmpfinder_path;
    }

    public void setInput_dmpfinder_path(String input_dmpfinder_path) {
        this.input_dmpfinder_path = input_dmpfinder_path;
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

    public List<File> getFileField_dmpfinder() {
        return fileField_dmpfinder;
    }

    public void setFileField_dmpfinder(List<File> fileField_dmpfinder) {
        this.fileField_dmpfinder = fileField_dmpfinder;
    }

    public List<String> getFileField_dmpfinderFileName() {
        return fileField_dmpfinderFileName;
    }

    public void setFileField_dmpfinderFileName(List<String> fileField_dmpfinderFileName) {
        this.fileField_dmpfinderFileName = fileField_dmpfinderFileName;
    }

    public int getPlot() {
        return plot;
    }

    public void setPlot(int plot) {
        this.plot = plot;
    }

    public String getP_Value() {
        return P_Value;
    }

    public void setP_Value(String p_Value) {
        P_Value = p_Value;
    }

    public ApplicationContext getApplicationContext() {
        return applicationContext;
    }

    public void setApplicationContext(ApplicationContext applicationContext) {
        this.applicationContext = applicationContext;
    }

    private ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");

    public String Dmpfinder_exe() throws Exception{
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
        System.out.println(fileField_dmpfinderFileName);
        System.out.println(fileField_dmpfinder);

        List<String> Upload_path=uploadUtil.upload(fileField_dmpfinderFileName,fileField_dmpfinder);
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
        for(int i=0;i<fileField_dmpfinder.size();i++){
            appendMethodB(admin_path,Upload_path.get(i)+"\r\n");
            File file=new File(Upload_path.get(i));
            String name=file.getName();
            fileList+=name+" ; ";
        }
        xmlUtil.xmlAdd_Jobs(JobId,fileList, "dmpFinder", "ERROR","email",time);
        appendMethodB(admin_path,"Result path:"+"\r\n");
        ////////////////////////////////////////////////////////////////////////////////////////////////
        DmpFinderService dmpFinderService = (DmpFinderService) applicationContext.getBean("dmpFinderService");
        FileUtil fileUtil1=new FileUtil();
        input_dmpfinder_path=fileUtil1.Result_path();
        appendMethodB(admin_path,input_dmpfinder_path+"\r\n");
        DmpFinderBean dmpFinderBean = new DmpFinderBean();
        dmpFinderBean.setInput_exprSetdmpfinder_file(remote_tag);
        dmpFinderBean.setInput_sampleSheetdmpfinder_file(remote_control);
        dmpFinderBean.setPath(input_dmpfinder_path);
        dmpFinderBean.setArraytype(arraytype);
        dmpFinderBean.setAdjPval(adjPval);
        dmpFinderBean.setPlot(plot);

        dmpFinderService.setdmpFinderBean(dmpFinderBean);
        stdoutlist=dmpFinderService.dmpFinder_execute();
        flag="15";
        flag_validate="1";

        //将结果压缩
        FileUtil fileUtil2=new FileUtil();
        fileUtil2.ZipMultiFile("/home/bio/huxy/dataset/" + JobId, "/home/bio/huxy/dataset/" + JobId + ".zip.tar");
        return SUCCESS;
    }

    public String dmpFindernoUpload() throws Exception{

        DmpFinderService dmpFinderService = (DmpFinderService) applicationContext.getBean("dmpFinderService");
        FileUtil fileUtil1=new FileUtil();
        input_dmpfinder_path=fileUtil1.Result_path();
        DmpFinderBean dmpFinderBean = new DmpFinderBean();

        dmpFinderBean.setInput_exprSetdmpfinder_file(input_exprSetdmpfinder_file);
        dmpFinderBean.setInput_sampleSheetdmpfinder_file(input_sampleSheetdmpfinder_file);
        dmpFinderBean.setPath(input_dmpfinder_path);
        dmpFinderBean.setArraytype(arraytype);
        dmpFinderBean.setAdjPval(adjPval);
        dmpFinderBean.setPlot(plot);

        dmpFinderService.setdmpFinderBean(dmpFinderBean);
        stdoutlist=dmpFinderService.dmpFinder_execute();
        flag="15";
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
        if(input_exprSetdmpfinder_file.equals("")){
            this.addFieldError("input_exprSet_file", "Please input the DNA methylation beta values or M values matrix(.csv) file");
        }
        if(input_sampleSheetdmpfinder_file.equals("")){
            this.addFieldError("input_sampleSheet_file", "Please input the SampleSheet(.csv) to generate contrast matrix");
        }
        try{
            UploadUtil uploadUtil2=new UploadUtil();
            if(!uploadUtil2.Check(fileField_dmpfinderFileName,fileField_dmpfinder)){
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
