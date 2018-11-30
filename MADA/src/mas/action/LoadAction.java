package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import mas.FileUtil;
import mas.UploadUtil;
import mas.bean.LoadBean;
import mas.service.LoadService;
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
 * Created by Administrator on 2016/11/29.
 */
public class LoadAction extends ActionSupport {
    private String input_BMIQ_file,input_BMIQ_path;
    private String methValue;
    private String arraytype;
    private String detPcut;
    private String filterXY;
    private String filterSNPs;
    private int plot;
    private int optionalParameters_Load;
    private String autoimpute,filterMultiHit,plotBMIQ,cores;
    private String flag,flag_validate;
    private String stdoutlist;
    private List<File> fileField_bmiq;
    private List<String> fileField_bmiqFileName;

    public int getPlot() {
        return plot;
    }

    public void setPlot(int plot) {
        this.plot = plot;
    }

    public String getAutoimpute() {
        return autoimpute;
    }

    public void setAutoimpute(String autoimpute) {
        this.autoimpute = autoimpute;
    }


    public String getPlotBMIQ() {
        return plotBMIQ;
    }

    public void setPlotBMIQ(String plotBMIQ) {
        this.plotBMIQ = plotBMIQ;
    }

    public String getCores() {
        return cores;
    }

    public void setCores(String cores) {
        this.cores = cores;
    }

    public String getStdoutlist() {
        return stdoutlist;
    }

    public void setStdoutlist(String stdoutlist) {
        this.stdoutlist = stdoutlist;
    }

    public String getInput_BMIQ_file() {
        return input_BMIQ_file;
    }

    public void setInput_BMIQ_file(String input_BMIQ_file) {
        this.input_BMIQ_file = input_BMIQ_file;
    }

    public String getInput_BMIQ_path() {
        return input_BMIQ_path;
    }

    public void setInput_BMIQ_path(String input_BMIQ_path) {
        this.input_BMIQ_path = input_BMIQ_path;
    }

    public String getArraytype() {
        return arraytype;
    }

    public void setArraytype(String arraytype) {
        this.arraytype = arraytype;
    }

    public String getFlag_validate() {
        return flag_validate;
    }

    public void setFlag_validate(String flag_validate) {
        this.flag_validate = flag_validate;
    }

    public List<File> getFileField_bmiq() {
        return fileField_bmiq;
    }

    public void setFileField_bmiq(List<File> fileField_bmiq) {
        this.fileField_bmiq = fileField_bmiq;
    }

    public List<String> getFileField_bmiqFileName() {
        return fileField_bmiqFileName;
    }

    public void setFileField_bmiqFileName(List<String> fileField_bmiqFileName) {
        this.fileField_bmiqFileName = fileField_bmiqFileName;
    }

    public int getOptionalParameters_Load() {
        return optionalParameters_Load;
    }

    public void setOptionalParameters_Load(int optionalParameters_Load) {
        this.optionalParameters_Load = optionalParameters_Load;
    }

    public String getMethValue() {
        return methValue;
    }

    public void setMethValue(String methValue) {
        this.methValue = methValue;
    }




    public String getDetPcut() {
        return detPcut;
    }

    public void setDetPcut(String detPcut) {
        this.detPcut = detPcut;
    }


    public String getFilterSNPs() {
        return filterSNPs;
    }

    public void setFilterSNPs(String filterSNPs) {
        this.filterSNPs = filterSNPs;
    }

    public String getFilterMultiHit() {
        return filterMultiHit;
    }

    public void setFilterMultiHit(String filterMultiHit) {
        this.filterMultiHit = filterMultiHit;
    }

    public String getFilterXY() {
        return filterXY;
    }

    public void setFilterXY(String filterXY) {
        this.filterXY = filterXY;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    private ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");


    public String Load_exe() throws Exception{
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
        System.out.println(fileField_bmiq);
        System.out.println(fileField_bmiqFileName);

        List<String> Upload_path=uploadUtil.upload(fileField_bmiqFileName,fileField_bmiq);
        remote_tag=Upload_path.get(0);
        System.out.println(remote_tag);
        //构造运行记录文件
        FileUtil fileUtil=new FileUtil();
        String admin_path= fileUtil.adminCheck_path()+".txt";
        File admin=new File(admin_path);
        appendMethodB(admin_path,"File list:"+"\r\n");
        String fileList="";
        for(int i=0;i<fileField_bmiq.size();i++){
            appendMethodB(admin_path,Upload_path.get(i)+"\r\n");
            File file=new File(Upload_path.get(i));
            String name=file.getName();
            fileList+=name+" ; ";
        }
        xmlUtil.xmlAdd_Jobs(JobId,fileList, "BMIQ", "ERROR","email",time);
        appendMethodB(admin_path,"Result path:"+"\r\n");
        ////////////////////////////////////////////////////////////////////////////////////
        LoadService loadService = (LoadService) applicationContext.getBean("loadService");
        FileUtil fileUtil1=new FileUtil();
        input_BMIQ_path=fileUtil1.Result_path();
        appendMethodB(admin_path,input_BMIQ_path+"\r\n");

        LoadBean loadBean = new LoadBean();
        loadBean.setDirectory(remote_tag);
        loadBean.setMethValue(methValue);
        loadBean.setResultsDir(input_BMIQ_path);
        loadBean.setArraytype(arraytype);
        loadBean.setDetPcut(detPcut);
        loadBean.setFilterSNPs(filterSNPs);
        loadBean.setFilterXY(filterXY);
        loadBean.setPlot(plot);
        if (optionalParameters_Load == 1) {
            loadBean.setOption("");
            loadBean.setOption1("");
        } else {
            loadBean.setOption("autoimpute=" + autoimpute + ",filterMultiHit=" + filterMultiHit);
            loadBean.setOption1("plotBMIQ="+plotBMIQ+",cores="+cores);
        }
        loadService.setLoadBean(loadBean);
        stdoutlist=loadService.Load_execute();
        flag="1";
        flag_validate="1";

        //将结果压缩
        FileUtil fileUtil2=new FileUtil();
        fileUtil2.ZipMultiFile("/home/bio/huxy/dataset/" + JobId, "/home/bio/huxy/dataset/" + JobId + ".zip.tar");
        return SUCCESS;
    }
    public String BMIQ_noUpload() throws Exception{
        LoadService loadService = (LoadService) applicationContext.getBean("loadService");
        LoadBean loadBean = new LoadBean();
        FileUtil fileUtil=new FileUtil();
        input_BMIQ_path=fileUtil.Result_path();
        loadBean.setArraytype(arraytype);
        loadBean.setDirectory(input_BMIQ_file);
        loadBean.setResultsDir(input_BMIQ_path);
        loadBean.setMethValue(methValue);
        loadBean.setDetPcut(detPcut);
        loadBean.setFilterSNPs(filterSNPs);
        loadBean.setFilterXY(filterXY);
        if (optionalParameters_Load == 1) {
            loadBean.setOption("");
            loadBean.setOption1("");
        } else {
            loadBean.setOption("autoimpute=" + autoimpute  +",filterMultiHit=" + filterMultiHit);
            loadBean.setOption1("plotBMIQ="+plotBMIQ+",cores="+cores);
        }
        loadService.setLoadBean(loadBean);
        stdoutlist=loadService.Load_execute();
        flag="1";
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
        if(input_BMIQ_file.equals("")){
            this.addFieldError("input_BMIQ_file", "Please input the raw IDAT file and Samplesheet.csv.");
        }
        try{
            UploadUtil uploadUtil2=new UploadUtil();
            if(!uploadUtil2.Check(fileField_bmiqFileName,fileField_bmiq)){
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

