package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import mas.FileUtil;
import mas.UploadUtil;
import mas.bean.NoobBean;
import mas.service.NoobService;
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
 * Created by Administrator on 2018/2/27.
 */
public class NoobAction extends ActionSupport{
    private String input_Noob_file,input_Noob_path;
    private String methValue;
    private String detPcut;
    private String filterXY;
    private String filterSNPs;
    private String filterCRO;
    private int optionalParameters_index_Noob;
    private String offset,dyeCorr,verbose;
    private String flag,flag_validate;
    private String stdoutlist;
    private List<File> fileField_noob;
    private List<String> fileField_noobFileName;
    private int plot;
    private String arraytype;

    public String getArraytype() {
        return arraytype;
    }

    public void setArraytype(String arraytype) {
        this.arraytype = arraytype;
    }

    public String getFilterCRO() {
        return filterCRO;
    }

    public void setFilterCRO(String filterCRO) {
        this.filterCRO = filterCRO;
    }

    public String getDetPcut() {
        return detPcut;
    }

    public void setDetPcut(String detPcut) {
        this.detPcut = detPcut;
    }

    public String getFilterXY() {
        return filterXY;
    }

    public void setFilterXY(String filterXY) {
        this.filterXY = filterXY;
    }

    public String getFilterSNPs() {
        return filterSNPs;
    }

    public void setFilterSNPs(String filterSNPs) {
        this.filterSNPs = filterSNPs;
    }

    public int getPlot() {
        return plot;
    }

    public void setPlot(int plot) {
        this.plot = plot;
    }

    public String getInput_Noob_file() {
        return input_Noob_file;
    }

    public void setInput_Noob_file(String input_Noob_file) {
        this.input_Noob_file = input_Noob_file;
    }

    public String getInput_Noob_path() {
        return input_Noob_path;
    }

    public void setInput_Noob_path(String input_Noob_path) {
        this.input_Noob_path = input_Noob_path;
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

    public List<File> getFileField_noob() {
        return fileField_noob;
    }

    public void setFileField_noob(List<File> fileField_noob) {
        this.fileField_noob = fileField_noob;
    }

    public List<String> getFileField_noobFileName() {
        return fileField_noobFileName;
    }

    public void setFileField_noobFileName(List<String> fileField_noobFileName) {
        this.fileField_noobFileName = fileField_noobFileName;
    }

    public String getMethValue() {
        return methValue;
    }

    public void setMethValue(String methValue) {
        this.methValue = methValue;
    }

    public int getOptionalParameters_index_Noob() {
        return optionalParameters_index_Noob;
    }

    public void setOptionalParameters_index_Noob(int optionalParameters_index_Noob) {
        this.optionalParameters_index_Noob = optionalParameters_index_Noob;
    }

    public String getOffset() {
        return offset;
    }

    public void setOffset(String offset) {
        this.offset = offset;
    }

    public String getDyeCorr() {
        return dyeCorr;
    }

    public void setDyeCorr(String dyeCorr) {
        this.dyeCorr = dyeCorr;
    }

    public String getVerbose() {
        return verbose;
    }

    public void setVerbose(String verbose) {
        this.verbose = verbose;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public ApplicationContext getApplicationContext() {
        return applicationContext;
    }

    public void setApplicationContext(ApplicationContext applicationContext) {
        this.applicationContext = applicationContext;
    }

    private ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    public String Noob_exe() throws Exception{
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
        System.out.println(fileField_noob);
        System.out.println(fileField_noobFileName);

        List<String> Upload_path=uploadUtil.upload(fileField_noobFileName,fileField_noob);
        remote_tag=Upload_path.get(0);
        System.out.println(remote_tag);
        //构造运行记录文件
        FileUtil fileUtil=new FileUtil();
        String admin_path= fileUtil.adminCheck_path()+".txt";
        File admin=new File(admin_path);
        appendMethodB(admin_path,"File list:"+"\r\n");
        String fileList="";
        for(int i=0;i<fileField_noob.size();i++){
            appendMethodB(admin_path,Upload_path.get(i)+"\r\n");
            File file=new File(Upload_path.get(i));
            String name=file.getName();
            fileList+=name+" ; ";
        }
        xmlUtil.xmlAdd_Jobs(JobId,fileList, "Noob", "ERROR","email",time);
        appendMethodB(admin_path,"Result path:"+"\r\n");
        ////////////////////////////////////////////////////////////////////////////////////

        NoobService noobService = (NoobService) applicationContext.getBean("noobService");
        FileUtil fileUtil1=new FileUtil();
        input_Noob_path=fileUtil1.Result_path();
        appendMethodB(admin_path,input_Noob_path+"\r\n");
        NoobBean noobBean = new NoobBean();
        noobBean.setDirectory(remote_tag);
        noobBean.setMethValue(methValue);
        noobBean.setPath(input_Noob_path);
        noobBean.setPlot(plot);
        noobBean.setFilterSNPs(filterSNPs);
        noobBean.setFilterXY(filterXY);
        noobBean.setDetPcut(detPcut);
        noobBean.setFilterCRO(filterCRO);
        noobBean.setArraytype(arraytype);
        if (optionalParameters_index_Noob == 1) {
            noobBean.setOption("");
        } else {
            noobBean.setOption("offset=" + offset + ",dyeCorr=" + dyeCorr + ",verbose=" + verbose);
        }
        noobService.setNoobBean(noobBean);
        stdoutlist=noobService.Noob();
        flag="6";
        flag_validate="1";

        //将结果压缩
        FileUtil fileUtil2=new FileUtil();
        fileUtil2.ZipMultiFile("/home/bio/huxy/dataset/" + JobId, "/home/bio/huxy/dataset/" + JobId + ".zip.tar");
        return SUCCESS;

    }
    public String NoobnoUpload() throws Exception{
        NoobService noobService = (NoobService) applicationContext.getBean("noobService");
        FileUtil fileUtil1=new FileUtil();
        input_Noob_path=fileUtil1.Result_path();
        NoobBean noobBean = new NoobBean();
        noobBean.setDirectory(input_Noob_file);
        noobBean.setMethValue(methValue);
        noobBean.setPath(input_Noob_path);
        noobBean.setPlot(plot);
        noobBean.setFilterSNPs(filterSNPs);
        noobBean.setFilterXY(filterXY);
        noobBean.setFilterCRO(filterCRO);
        noobBean.setDetPcut(detPcut);
        noobBean.setArraytype(arraytype);
        if (optionalParameters_index_Noob == 1) {
            noobBean.setOption("");
        } else {
            noobBean.setOption("offset=" + offset + ",dyeCorr=" + dyeCorr + ",verbose=" + verbose);
        }
        noobService.setNoobBean(noobBean);
        stdoutlist=noobService.Noob();
        flag="6";
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
        if(input_Noob_file.equals("")){
            this.addFieldError("input_Noob_file", "Please input the raw IDAT file and Samplesheet.csv.");
        }
        try{
            UploadUtil uploadUtil2=new UploadUtil();
            if(!uploadUtil2.Check(fileField_noobFileName,fileField_noob)){
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

        flag="6";
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
