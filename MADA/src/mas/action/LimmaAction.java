package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import mas.bean.LimmaBean;
import mas.service.LimmaService;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import mas.xmlUtil;
import mas.FileUtil;
import mas.UploadUtil;


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
public class LimmaAction extends ActionSupport{
    private String input_exprSet_file,input_sampleSheet_file,input_limma_path;
    private String arraytype;
    private String adjPval;
    private int optionalParameters_limma;
    private String proportion,trend,robust;
    private String flag,flag_validate;
    private String stdoutlist;
    private String account_hidden;
    private List<File> fileField_limma;
    private List<String> fileField_limmaFileName;
    private int cor;
    private String cor1,cor1_type;

    private int plot;
    private String P_Value;
    private String logFC;
    private String logFC1;

    public String getLogFC1() {
        return logFC1;
    }

    public void setLogFC1(String logFC1) {
        this.logFC1 = logFC1;
    }

    public String getAdjPval() {
        return adjPval;
    }

    public void setAdjPval(String adjPval) {
        this.adjPval = adjPval;
    }

    public String getArraytype() {
        return arraytype;
    }

    public void setArraytype(String arraytype) {
        this.arraytype = arraytype;
    }

    public int getCor() {
        return cor;
    }

    public void setCor(int cor) {
        this.cor = cor;
    }

    public String getCor1() {
        return cor1;
    }

    public void setCor1(String cor1) {
        this.cor1 = cor1;
    }

    public String getCor1_type() {
        return cor1_type;
    }

    public void setCor1_type(String cor1_type) {
        this.cor1_type = cor1_type;
    }

    public String getP_Value() {
        return P_Value;
    }

    public void setP_Value(String p_Value) {
        P_Value = p_Value;
    }

    public String getLogFC() {
        return logFC;
    }

    public void setLogFC(String logFC) {
        this.logFC = logFC;
    }

    public int getPlot() {
        return plot;
    }

    public void setPlot(int plot) {
        this.plot = plot;
    }

    public String getFlag_validate() {
        return flag_validate;
    }

    public void setFlag_validate(String flag_validate) {
        this.flag_validate = flag_validate;
    }
    public List<File> getFileField_limma() {
        return fileField_limma;
    }

    public void setFileField_limma(List<File> fileField_limma) {
        this.fileField_limma = fileField_limma;
    }

    public List<String> getFileField_limmaFileName() {
        return fileField_limmaFileName;
    }

    public void setFileField_limmaFileName(List<String> fileField_limmaFileName) {
        this.fileField_limmaFileName = fileField_limmaFileName;
    }

    public String getInput_exprSet_file() {
        return input_exprSet_file;
    }

    public void setInput_exprSet_file(String input_exprSet_file) {
        this.input_exprSet_file = input_exprSet_file;
    }

    public String getInput_sampleSheet_file() {
        return input_sampleSheet_file;
    }

    public void setInput_sampleSheet_file(String input_sampleSheet_file) {
        this.input_sampleSheet_file = input_sampleSheet_file;
    }

    public String getInput_limma_path() {
        return input_limma_path;
    }

    public void setInput_limma_path(String input_limma_path) {
        this.input_limma_path = input_limma_path;
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

    public int getOptionalParameters_limma() {
        return optionalParameters_limma;
    }

    public void setOptionalParameters_limma(int optionalParameters_limma) {
        this.optionalParameters_limma = optionalParameters_limma;
    }

    public String getProportion() {
        return proportion;
    }

    public void setProportion(String proportion) {
        this.proportion = proportion;
    }

    public String getTrend() {
        return trend;
    }

    public void setTrend(String trend) {
        this.trend = trend;
    }

    public String getRobust() {
        return robust;
    }

    public void setRobust(String robust) {
        this.robust = robust;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    private ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");

    public String Limma_exe() throws Exception{
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
        System.out.println(fileField_limmaFileName);
        System.out.println(fileField_limma);

        List<String> Upload_path=uploadUtil.upload(fileField_limmaFileName,fileField_limma);
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
        for(int i=0;i<fileField_limma.size();i++){
            appendMethodB(admin_path,Upload_path.get(i)+"\r\n");
            File file=new File(Upload_path.get(i));
            String name=file.getName();
            fileList+=name+" ; ";
        }
        xmlUtil.xmlAdd_Jobs(JobId,fileList, "Limma", "ERROR","email",time);
        appendMethodB(admin_path,"Result path:"+"\r\n");
        ////////////////////////////////////////////////////////////////////////////////////////////////
        LimmaService limmaService = (LimmaService) applicationContext.getBean("limmaService");
        FileUtil fileUtil1=new FileUtil();
        input_limma_path=fileUtil1.Result_path();
        appendMethodB(admin_path,input_limma_path+"\r\n");
        LimmaBean limmaBean = new LimmaBean();
        limmaBean.setInput_exprSet_file(remote_tag);
        limmaBean.setInput_sampleSheet_file(remote_control);
        limmaBean.setPath(input_limma_path);
        limmaBean.setArraytype(arraytype);
        limmaBean.setAdjPval(adjPval);
        limmaBean.setPlot(plot);
        limmaBean.setLogFC(logFC);
        limmaBean.setLogFC1(logFC1);
        limmaBean.setP_Value(P_Value);
        limmaBean.setCor(cor);
        limmaBean.setCor1(cor1);
        limmaBean.setCor1_type(cor1_type);
        if (optionalParameters_limma == 1) {
            limmaBean.setOption("");
        } else {
            limmaBean.setOption("proportion=" + proportion + ",trend=" + trend + ",robust=" + robust );
        }
//      if (cor==2){
//            limmaBean.setCor1(cor1);
//            limmaBean.setCor1_type(cor1_type);
//        }
        limmaService.setLimmaBean(limmaBean);
        stdoutlist=limmaService.Limma_execute();
        flag="9";
        flag_validate="1";

        //将结果压缩
        FileUtil fileUtil2=new FileUtil();
        fileUtil2.ZipMultiFile("/home/bio/huxy/dataset/" + JobId, "/home/bio/huxy/dataset/" + JobId + ".zip.tar");
        return SUCCESS;
    }

    public String LimmanoUpload() throws Exception{
        LimmaService limmaService = (LimmaService) applicationContext.getBean("limmaService");
        LimmaBean limmaBean = new LimmaBean();
        FileUtil fileUtil=new FileUtil();
        input_limma_path=fileUtil.Result_path();
        limmaBean.setInput_exprSet_file(input_exprSet_file);
        limmaBean.setInput_sampleSheet_file(input_sampleSheet_file);
        limmaBean.setPath(input_limma_path);
        limmaBean.setArraytype(arraytype);
        limmaBean.setAdjPval(adjPval);
        limmaBean.setPlot(plot);
        limmaBean.setLogFC(logFC);
        limmaBean.setLogFC1(logFC1);
        limmaBean.setP_Value(P_Value);
        limmaBean.setCor(cor);
        limmaBean.setCor1(cor1);
        limmaBean.setCor1_type(cor1_type);
       if (optionalParameters_limma == 1) {
            limmaBean.setOption("");
         } else
             {
           limmaBean.setOption("proportion=" + proportion + ",trend=" + trend + ",robust=" + robust );
            }
        limmaService.setLimmaBean(limmaBean);
        stdoutlist= limmaService.Limma_execute();
        flag="9";
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
        if(input_exprSet_file.equals("")){
            this.addFieldError("input_exprSet_file", "Please input the DNA methylation beta values or M values matrix(.csv) file");
        }
        if(input_sampleSheet_file.equals("")){
            this.addFieldError("input_sampleSheet_file", "Please input the SampleSheet(.csv) to generate contrast matrix");
        }
        try{
            UploadUtil uploadUtil2=new UploadUtil();
            if(!uploadUtil2.Check(fileField_limmaFileName,fileField_limma)){
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
