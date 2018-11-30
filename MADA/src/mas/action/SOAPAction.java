package mas.action;

import mas.FileUtil;
import mas.GetProperty;
import mas.UploadUtil;
import mas.bean.SOAPBean;
import mas.service.SOAPService;
import mas.xmlUtil;
import com.opensymphony.xwork2.ActionSupport;
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
 * Created by lily on 7/21/16.
 */
public class SOAPAction extends ActionSupport {
    private int SOAP_type;
    private String input_SOAP_reference;
    private String input_SOAP_reads_single;
    private String input_SOAP_reads_pair1;
    private String input_SOAP_reads_pair2;
    private String input_SOAP_path;
    private int optionalParameters_SOAP,refer_index_SOAP;
    private String SOAP_M;
    private String SOAP_l;
    private String SOAP_n;
    private String SOAP_r;
    private String SOAP_m;
    private String SOAP_x;
    private String SOAP_v;
    private String SOAP_s;
    private String SOAP_g;
    private String SOAP_e;
    private String SOAP_p;
    private String flag,flag_validate;
    private String stdoutlist;
    private File fileField_soap_re;
    private File fileField_soap_read;
    private File fileField_soap_pair1;
    private File fileField_soap_pair2;
    private String fileField_soap_reFileName;
    private String fileField_soap_readFileName;
    private String fileField_soap_pair1FileName;
    private String fileField_soap_pair2FileName;
    private String account_hidden;
    private int built_in_SOAP;

    public int getBuilt_in_SOAP() {
        return built_in_SOAP;
    }

    public void setBuilt_in_SOAP(int built_in_SOAP) {
        this.built_in_SOAP = built_in_SOAP;
    }

    private List<File> fileField_soap;
    private List<String> fileField_soapFileName;

    public String getAccount_hidden() {
        return account_hidden;
    }

    public void setAccount_hidden(String account_hidden) {
        this.account_hidden = account_hidden;
    }

    public String getFlag_validate() {
        return flag_validate;
    }

    public void setFlag_validate(String flag_validate) {
        this.flag_validate = flag_validate;
    }


    public List<File> getFileField_soap() {
        return fileField_soap;
    }

    public void setFileField_soap(List<File> fileField_soap) {
        this.fileField_soap = fileField_soap;
    }

    public List<String> getFileField_soapFileName() {
        return fileField_soapFileName;
    }

    public void setFileField_soapFileName(List<String> fileField_soapFileName) {
        this.fileField_soapFileName = fileField_soapFileName;
    }

    public File getFileField_soap_re() {
        return fileField_soap_re;
    }

    public void setFileField_soap_re(File fileField_soap_re) {
        this.fileField_soap_re = fileField_soap_re;
    }

    public File getFileField_soap_read() {
        return fileField_soap_read;
    }

    public void setFileField_soap_read(File fileField_soap_read) {
        this.fileField_soap_read = fileField_soap_read;
    }

    public File getFileField_soap_pair1() {
        return fileField_soap_pair1;
    }

    public void setFileField_soap_pair1(File fileField_soap_pair1) {
        this.fileField_soap_pair1 = fileField_soap_pair1;
    }

    public File getFileField_soap_pair2() {
        return fileField_soap_pair2;
    }

    public void setFileField_soap_pair2(File fileField_soap_pair2) {
        this.fileField_soap_pair2 = fileField_soap_pair2;
    }

    public String getFileField_soap_reFileName() {
        return fileField_soap_reFileName;
    }

    public void setFileField_soap_reFileName(String fileField_soap_reFileName) {
        this.fileField_soap_reFileName = fileField_soap_reFileName;
    }

    public String getFileField_soap_readFileName() {
        return fileField_soap_readFileName;
    }

    public void setFileField_soap_readFileName(String fileField_soap_readFileName) {
        this.fileField_soap_readFileName = fileField_soap_readFileName;
    }

    public String getFileField_soap_pair1FileName() {
        return fileField_soap_pair1FileName;
    }

    public void setFileField_soap_pair1FileName(String fileField_soap_pair1FileName) {
        this.fileField_soap_pair1FileName = fileField_soap_pair1FileName;
    }

    public String getFileField_soap_pair2FileName() {
        return fileField_soap_pair2FileName;
    }

    public void setFileField_soap_pair2FileName(String fileField_soap_pair2FileName) {
        this.fileField_soap_pair2FileName = fileField_soap_pair2FileName;
    }

    public String getStdoutlist() {
        return stdoutlist;
    }

    public void setStdoutlist(String stdoutlist) {
        this.stdoutlist = stdoutlist;
    }
    public int getSOAP_type() {
        return SOAP_type;
    }

    public void setSOAP_type(int SOAP_type) {
        this.SOAP_type = SOAP_type;
    }

    public String getInput_SOAP_reference() {
        return input_SOAP_reference;
    }

    public void setInput_SOAP_reference(String input_SOAP_reference) {
        this.input_SOAP_reference = input_SOAP_reference;
    }

    public String getInput_SOAP_reads_single() {
        return input_SOAP_reads_single;
    }

    public void setInput_SOAP_reads_single(String input_SOAP_reads_single) {
        this.input_SOAP_reads_single = input_SOAP_reads_single;
    }

    public String getInput_SOAP_reads_pair1() {
        return input_SOAP_reads_pair1;
    }

    public void setInput_SOAP_reads_pair1(String input_SOAP_reads_pair1) {
        this.input_SOAP_reads_pair1 = input_SOAP_reads_pair1;
    }

    public String getInput_SOAP_reads_pair2() {
        return input_SOAP_reads_pair2;
    }

    public void setInput_SOAP_reads_pair2(String input_SOAP_reads_pair2) {
        this.input_SOAP_reads_pair2 = input_SOAP_reads_pair2;
    }

    public String getInput_SOAP_path() {
        return input_SOAP_path;
    }

    public void setInput_SOAP_path(String input_SOAP_path) {
        this.input_SOAP_path = input_SOAP_path;
    }

    public int getOptionalParameters_SOAP() {
        return optionalParameters_SOAP;
    }

    public void setOptionalParameters_SOAP(int optionalParameters_SOAP) {
        this.optionalParameters_SOAP = optionalParameters_SOAP;
    }

    public String getSOAP_M() {
        return SOAP_M;
    }

    public void setSOAP_M(String SOAP_M) {
        this.SOAP_M = SOAP_M;
    }

    public String getSOAP_l() {
        return SOAP_l;
    }

    public void setSOAP_l(String SOAP_l) {
        this.SOAP_l = SOAP_l;
    }

    public String getSOAP_n() {
        return SOAP_n;
    }

    public void setSOAP_n(String SOAP_n) {
        this.SOAP_n = SOAP_n;
    }

    public String getSOAP_r() {
        return SOAP_r;
    }

    public void setSOAP_r(String SOAP_r) {
        this.SOAP_r = SOAP_r;
    }

    public String getSOAP_m() {
        return SOAP_m;
    }

    public void setSOAP_m(String SOAP_m) {
        this.SOAP_m = SOAP_m;
    }

    public String getSOAP_x() {
        return SOAP_x;
    }

    public void setSOAP_x(String SOAP_x) {
        this.SOAP_x = SOAP_x;
    }

    public String getSOAP_v() {
        return SOAP_v;
    }

    public void setSOAP_v(String SOAP_v) {
        this.SOAP_v = SOAP_v;
    }

    public String getSOAP_s() {
        return SOAP_s;
    }

    public void setSOAP_s(String SOAP_s) {
        this.SOAP_s = SOAP_s;
    }

    public String getSOAP_g() {
        return SOAP_g;
    }

    public void setSOAP_g(String SOAP_g) {
        this.SOAP_g = SOAP_g;
    }

    public String getSOAP_e() {
        return SOAP_e;
    }

    public void setSOAP_e(String SOAP_e) {
        this.SOAP_e = SOAP_e;
    }

    public String getSOAP_p() {
        return SOAP_p;
    }

    public void setSOAP_p(String SOAP_p) {
        this.SOAP_p = SOAP_p;
    }

    public int getRefer_index_SOAP() {
        return refer_index_SOAP;
    }

    public void setRefer_index_SOAP(int refer_index_SOAP) {
        this.refer_index_SOAP = refer_index_SOAP;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    private ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    public String SOAP_exe() throws Exception{
        //生成运行起始时间
        Date date=new Date();
        DateFormat format=new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
        String time=format.format(date);
        //构建session
        xmlUtil xmlUtil = new xmlUtil();
        String JobId="JobId_"+xmlUtil.generateString(6);
        xmlUtil.creatSession(JobId,time);
        /////////////////////////////////////////////////////////////////////////
        String remote_re,remote_read,remote_pair1,remote_pair2;
        UploadUtil uploadUtil=new UploadUtil();
        List<String> Upload_path=uploadUtil.upload(fileField_soapFileName,fileField_soap);
        if(refer_index_SOAP==1){
            if(SOAP_type==1){
                remote_read=Upload_path.get(1);
                remote_pair1="";
                remote_pair2="";
            }
            else{
                remote_read="";
                remote_pair1=Upload_path.get(1);
                remote_pair2=Upload_path.get(2);
            }
            remote_re=Upload_path.get(0);
        }
       else{
            if(SOAP_type==1){
                remote_read=Upload_path.get(0);
                remote_pair1="";
                remote_pair2="";
            }
            else{
                remote_read="";
                remote_pair1=Upload_path.get(0);
                remote_pair2=Upload_path.get(1);
            }
            remote_re="";
        }
        ///////////////////////////////////////////////////////////////////////
        FileUtil fileUtil=new FileUtil();
        String admin_path= fileUtil.adminCheck_path()+".txt";
        File admin=new File(admin_path);
        appendMethodB(admin_path,"File list:"+"\r\n");
        String fileList="";
        for(int i=0;i<fileField_soap.size();i++){
            appendMethodB(admin_path,Upload_path.get(i)+"\r\n");
            File file=new File(Upload_path.get(i));
            String name=file.getName();
            fileList+=name+" ; ";
        }
        xmlUtil.xmlAdd_Jobs(JobId,fileList, "SOAP", "ERROR","email",time);
        appendMethodB(admin_path,"Result path:"+"\r\n");
        /////////////////////////////////////////////////////////////////////////
        SOAPService soapService= (SOAPService) applicationContext.getBean("soapService");
        FileUtil fileUtil1=new FileUtil();
        input_SOAP_path=fileUtil1.Result_path();
        SOAPBean soapBean=new SOAPBean();
        if(SOAP_type==1){
            soapBean.setReads_single(remote_read);
        }
        else{
            soapBean.setReads_pair1(remote_pair1);
            soapBean.setReads_pair2(remote_pair2);
        }

        soapBean.setPath(input_SOAP_path);
        soapBean.setType(SOAP_type);
        if(optionalParameters_SOAP==1){
            soapBean.setOption("");
        }
        else{
            soapBean.setOption(" -M "+SOAP_M+" -l "+SOAP_l+" -n "+SOAP_n+" -r "+SOAP_r+" -m "+SOAP_m+" -x "+SOAP_x+" -v "+SOAP_v+" -s "+SOAP_s+" -g "+SOAP_g+" -e "+SOAP_e+" -p "+SOAP_p);
        }
        if(refer_index_SOAP==1){
            soapBean.setReference(remote_re);
            soapService.setSoapBean(soapBean);
            stdoutlist=soapService.SOAP();
        }
        else{
            if(built_in_SOAP==1){
                String commandline;
                commandline = GetProperty.getPropertyByName("Config", "hg19");
                soapBean.setReference(commandline);
            }
            else{
                String commandline;
                commandline = GetProperty.getPropertyByName("Config", "mm8");
                soapBean.setReference(commandline);
            }
            soapService.setSoapBean(soapBean);
            stdoutlist=soapService.SOAP_unBuild();
            //将结果压缩
            FileUtil fileUtil2=new FileUtil();
            fileUtil2.ZipMultiFile("/home/dataset/" + JobId, "/home/dataset/" + JobId + ".zip");
        }

        flag="4";
        flag_validate="1";
        return SUCCESS;
    }
    public String SOAP_noUpload(){
        SOAPService soapService= (SOAPService) applicationContext.getBean("soapService");
        SOAPBean soapBean=new SOAPBean();
        if(SOAP_type==1){
            soapBean.setReads_single(input_SOAP_reads_single);
        }
        else{
            soapBean.setReads_pair1(input_SOAP_reads_pair1);
            soapBean.setReads_pair2(input_SOAP_reads_pair2);
        }
        soapBean.setPath(input_SOAP_path);
        soapBean.setType(SOAP_type);
        if(optionalParameters_SOAP==1){
            soapBean.setOption("");
        }
        else{
            soapBean.setOption(" -M "+SOAP_M+" -l "+SOAP_l+" -n "+SOAP_n+" -r "+SOAP_r+" -m "+SOAP_m+" -x "+SOAP_x+" -v "+SOAP_v+" -s "+SOAP_s+" -g "+SOAP_g+" -e "+SOAP_e+" -p "+SOAP_p);
        }
        if(refer_index_SOAP==1){
            soapBean.setReference(input_SOAP_reference);
            soapService.setSoapBean(soapBean);
            stdoutlist=soapService.SOAP();
        }
        else{
            if(built_in_SOAP==1){
                String commandline;
                commandline = GetProperty.getPropertyByName("Config", "hg19");
                soapBean.setReference(commandline);
            }
            else{
                String commandline;
                commandline = GetProperty.getPropertyByName("Config", "mm8");
                soapBean.setReference(commandline);
            }
            soapService.setSoapBean(soapBean);
            stdoutlist=soapService.SOAP_unBuild();
        }
        flag="4";
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
    public void validate(){

        if(refer_index_SOAP==1){
            if(input_SOAP_reference.equals("")){
                this.addFieldError("input_SOAP_reference", "Please choose the reference file.");
            }
        }
        if(SOAP_type==1){
            if(input_SOAP_reads_single.equals("")){
                this.addFieldError("input_SOAP_reads_single", "Please input the reads file.");
            }
        }
       else{
            if(input_SOAP_reads_pair1.equals("")||input_SOAP_reads_pair1.equals("")){
                this.addFieldError("input_SOAP_reads_pair1", "Please input the reads file.");
            }
        }
        try{
            UploadUtil uploadUtil=new UploadUtil();
            if(!uploadUtil.Check(fileField_soapFileName,fileField_soap)){
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
   /*     xmlUtil xmlUtil=new xmlUtil();
        xmlUtil.login_validate();*/
        flag="4";
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
