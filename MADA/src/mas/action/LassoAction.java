package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import mas.FileUtil;
import mas.UploadUtil;
import mas.bean.LassoBean;
import mas.service.LassoService;
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
 * Created by Administrator on 2018/3/22.
 */
public class LassoAction extends ActionSupport{
    private String input_exprSetpro_file,input_sampleSheetpro_file,input_lasso_path,arraytype;
    private int optionalParameters_probeLasso;
    private String minProbes,adjPvalDmr,meanLassoRadius,minDmrSep,minDmrSize,adjPvalProbe,PDFplot,Rplot;
    private String flag,flag_validate;
    private String stdoutlist;
    private List<File> fileField_lasso;
    private List<String> fileField_lassoFileName;

    public String getArraytype() {
        return arraytype;
    }

    public void setArraytype(String arraytype) {
        this.arraytype = arraytype;
    }

    public String getInput_exprSetpro_file() {
        return input_exprSetpro_file;
    }

    public void setInput_exprSetpro_file(String input_exprSetpro_file) {
        this.input_exprSetpro_file = input_exprSetpro_file;
    }

    public String getInput_sampleSheetpro_file() {
        return input_sampleSheetpro_file;
    }

    public void setInput_sampleSheetpro_file(String input_sampleSheetpro_file) {
        this.input_sampleSheetpro_file = input_sampleSheetpro_file;
    }

    public String getInput_lasso_path() {
        return input_lasso_path;
    }

    public void setInput_lasso_path(String input_lasso_path) {
        this.input_lasso_path = input_lasso_path;
    }

    public int getOptionalParameters_probeLasso() {
        return optionalParameters_probeLasso;
    }

    public void setOptionalParameters_probeLasso(int optionalParameters_probeLasso) {
        this.optionalParameters_probeLasso = optionalParameters_probeLasso;
    }

    public String getMinProbes() {
        return minProbes;
    }

    public void setMinProbes(String minProbes) {
        this.minProbes = minProbes;
    }

    public String getAdjPvalDmr() {
        return adjPvalDmr;
    }

    public void setAdjPvalDmr(String adjPvalDmr) {
        this.adjPvalDmr = adjPvalDmr;
    }

    public String getMeanLassoRadius() {
        return meanLassoRadius;
    }

    public void setMeanLassoRadius(String meanLassoRadius) {
        this.meanLassoRadius = meanLassoRadius;
    }

    public String getMinDmrSep() {
        return minDmrSep;
    }

    public void setMinDmrSep(String minDmrSep) {
        this.minDmrSep = minDmrSep;
    }

    public String getMinDmrSize() {
        return minDmrSize;
    }

    public void setMinDmrSize(String minDmrSize) {
        this.minDmrSize = minDmrSize;
    }

    public String getAdjPvalProbe() {
        return adjPvalProbe;
    }

    public void setAdjPvalProbe(String adjPvalProbe) {
        this.adjPvalProbe = adjPvalProbe;
    }

    public String getPDFplot() {
        return PDFplot;
    }

    public void setPDFplot(String PDFplot) {
        this.PDFplot = PDFplot;
    }

    public String getRplot() {
        return Rplot;
    }

    public void setRplot(String rplot) {
        Rplot = rplot;
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

    public List<File> getFileField_lasso() {
        return fileField_lasso;
    }

    public void setFileField_lasso(List<File> fileField_lasso) {
        this.fileField_lasso = fileField_lasso;
    }

    public List<String> getFileField_lassoFileName() {
        return fileField_lassoFileName;
    }

    public void setFileField_lassoFileName(List<String> fileField_lassoFileName) {
        this.fileField_lassoFileName = fileField_lassoFileName;
    }
    private ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    public String Lasso_exe() throws Exception{
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
        System.out.println(fileField_lassoFileName);
        System.out.println(fileField_lasso);

        List<String> Upload_path=uploadUtil.upload(fileField_lassoFileName,fileField_lasso);
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
        for(int i=0;i<fileField_lasso.size();i++){
            appendMethodB(admin_path,Upload_path.get(i)+"\r\n");
            File file=new File(Upload_path.get(i));
            String name=file.getName();
            fileList+=name+" ; ";
        }
        xmlUtil.xmlAdd_Jobs(JobId,fileList, "ProbeLasso", "ERROR","email",time);
        appendMethodB(admin_path,"Result path:"+"\r\n");
        ////////////////////////////////////////////////////////////////////////////////////
        LassoService lassoService = (LassoService) applicationContext.getBean("lassoService");
        FileUtil fileUtil1=new FileUtil();
        input_lasso_path=fileUtil1.Result_path();
        appendMethodB(admin_path,input_lasso_path+"\r\n");
        LassoBean lassoBean = new LassoBean();
        lassoBean.setInput_exprSetpro_file(remote_tag);
        lassoBean.setInput_sampleSheetpro_file(remote_control);
        lassoBean.setArraytype(arraytype);
        lassoBean.setPath(input_lasso_path);
        if (optionalParameters_probeLasso == 1) {
            lassoBean.setOption("");
        } else {
            lassoBean.setOption("minProbes=" + minProbes + ",adjPvalDmr=" + adjPvalDmr + ",meanLassoRadius=" + meanLassoRadius+",minDmrSep=" + minDmrSep + ",minDmrSize=" + minDmrSize + ",adjPvalProbe=" + adjPvalProbe);
        }
        lassoService.setLassoBean(lassoBean);
        stdoutlist=lassoService.Lasso_execute();
        flag="12";
        flag_validate="1";

        //将结果压缩
        FileUtil fileUtil2=new FileUtil();
        fileUtil2.ZipMultiFile("/home/bio/huxy/dataset/" + JobId, "/home/bio/huxy/dataset/" + JobId + ".zip.tar");
        return SUCCESS;
    }

    public String LassonoUpload() throws Exception{
        LassoService lassoService = (LassoService) applicationContext.getBean("lassoService");
        LassoBean lassoBean = new LassoBean();
        FileUtil fileUtil=new FileUtil();
        input_lasso_path=fileUtil.Result_path();
        lassoBean.setInput_exprSetpro_file(input_exprSetpro_file);
        lassoBean.setInput_sampleSheetpro_file(input_sampleSheetpro_file);
        lassoBean.setArraytype(arraytype);
        lassoBean.setPath(input_lasso_path);
        if (optionalParameters_probeLasso == 1) {
            lassoBean.setOption("");
        } else {
            lassoBean.setOption("minProbes=" + minProbes + ",adjPvalDmr=" + adjPvalDmr + ",meanLassoRadius=" + meanLassoRadius+",minDmrSep=" + minDmrSep + ",minDmrSize=" + minDmrSize + ",adjPvalProbe=" + adjPvalProbe+",PDFplot=" + PDFplot + ",Rplot=" + Rplot);
        }
        lassoService.setLassoBean(lassoBean);
        stdoutlist=lassoService.Lasso_execute();
        flag="12";
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
        if(input_exprSetpro_file.equals("")){
            this.addFieldError("input_exprSet_file", "Please input ChIP-Seq file.");
        }
        if(input_sampleSheetpro_file.equals("")){
            this.addFieldError("input_sampleSheet_file", "Please input control file.");
        }
        try{
            UploadUtil uploadUtil2=new UploadUtil();
            if(!uploadUtil2.Check(fileField_lassoFileName,fileField_lasso)){
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

        flag="12";
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
