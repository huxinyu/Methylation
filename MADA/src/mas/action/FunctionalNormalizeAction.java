package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import mas.FileUtil;
import mas.UploadUtil;
import mas.bean.FunctionalNormalizeBean;
import mas.service.FunctionalNormalizeService;
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
 * Created by Administrator on 2018/2/2.
 */
public class FunctionalNormalizeAction extends ActionSupport {
    private String input_FN_file,input_FN_path;
    private String methValue;
    private int optionalParameters_FN;
    private String detPcut;
    private String filterXY;
    private String filterSNPs;
    private String filterCRO;
    private String nPCs,sex,bgCorr,dyeCorr,keepCN,verbose;
    private String flag,flag_validate;
    private String stdoutlist;
    private List<File> fileField_fn;
    private List<String> fileField_fnFileName;
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

    public int getPlot() {
        return plot;
    }

    public void setPlot(int plot) {
        this.plot = plot;
    }

    public String getFilterSNPs() {
        return filterSNPs;
    }

    public void setFilterSNPs(String filterSNPs) {
        this.filterSNPs = filterSNPs;
    }

    public String getnPCs() {
        return nPCs;
    }

    public void setnPCs(String nPCs) {
        this.nPCs = nPCs;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBgCorr() {
        return bgCorr;
    }

    public void setBgCorr(String bgCorr) {
        this.bgCorr = bgCorr;
    }

    public String getDyeCorr() {
        return dyeCorr;
    }

    public void setDyeCorr(String dyeCorr) {
        this.dyeCorr = dyeCorr;
    }

    public String getKeepCN() {
        return keepCN;
    }

    public void setKeepCN(String keepCN) {
        this.keepCN = keepCN;
    }

    public String getVerbose() {
        return verbose;
    }

    public void setVerbose(String verbose) {
        this.verbose = verbose;
    }

    public String getInput_FN_file() {
        return input_FN_file;
    }

    public void setInput_FN_file(String input_FN_file) {
        this.input_FN_file = input_FN_file;
    }

    public String getInput_FN_path() {
        return input_FN_path;
    }

    public void setInput_FN_path(String input_FN_path) {
        this.input_FN_path = input_FN_path;
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

    public List<File> getFileField_fn() {
        return fileField_fn;
    }

    public void setFileField_fn(List<File> fileField_fn) {
        this.fileField_fn = fileField_fn;
    }

    public List<String> getFileField_fnFileName() {
        return fileField_fnFileName;
    }

    public void setFileField_fnFileName(List<String> fileField_fnFileName) {
        this.fileField_fnFileName = fileField_fnFileName;
    }

    public int getOptionalParameters_FN() {
        return optionalParameters_FN;
    }

    public void setOptionalParameters_FN(int optionalParameters_FN) {
        this.optionalParameters_FN = optionalParameters_FN;
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

    public String FunctionalNormalize_exe() throws Exception{
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
        System.out.println(fileField_fn);
        System.out.println(fileField_fnFileName);

        List<String> Upload_path=uploadUtil.upload(fileField_fnFileName,fileField_fn);
        remote_tag=Upload_path.get(0);
        System.out.println(remote_tag);
        //构造运行记录文件
        FileUtil fileUtil=new FileUtil();
        String admin_path= fileUtil.adminCheck_path()+".txt";
        File admin=new File(admin_path);
        appendMethodB(admin_path,"File list:"+"\r\n");
        String fileList="";
        for(int i=0;i<fileField_fn.size();i++){
            appendMethodB(admin_path,Upload_path.get(i)+"\r\n");
            File file=new File(Upload_path.get(i));
            String name=file.getName();
            fileList+=name+" ; ";
        }
        xmlUtil.xmlAdd_Jobs(JobId,fileList, "functionalNormalize", "ERROR","email",time);
        appendMethodB(admin_path,"Result path:"+"\r\n");
        ////////////////////////////////////////////////////////////////////////////////////
        FunctionalNormalizeService functionalNormalizeService=(FunctionalNormalizeService)applicationContext.getBean("functionalnormalizeService") ;
        FileUtil fileUtil1=new FileUtil();
        input_FN_path=fileUtil1.Result_path();
        appendMethodB(admin_path,input_FN_path+"\r\n");

        FunctionalNormalizeBean functionalNormalizeBean=new FunctionalNormalizeBean();
        functionalNormalizeBean.setDirectory(remote_tag);
        functionalNormalizeBean.setResultsDir(input_FN_path);
        functionalNormalizeBean.setMethValue(methValue);
        functionalNormalizeBean.setPlot(plot);
        functionalNormalizeBean.setDetPcut(detPcut);
        functionalNormalizeBean.setFilterSNPs(filterSNPs);
        functionalNormalizeBean.setFilterXY(filterXY);
        functionalNormalizeBean.setFilterCRO(filterCRO);
        functionalNormalizeBean.setArraytype(arraytype);
        if (optionalParameters_FN==1){
            functionalNormalizeBean.setOption("");
        }else{
            functionalNormalizeBean.setOption("nPCs=" + nPCs + ",sex=" + sex + ",bgCorr=" + bgCorr + "," + "dyeCorr=" + dyeCorr + ",keepCN="+keepCN + ",verbose=" + verbose );
        }
        functionalNormalizeService.setFunctionalNormalizeBean(functionalNormalizeBean);
        stdoutlist=functionalNormalizeService.FunctionalNormalize();
        flag="4";
        flag_validate="1";

        //将结果压缩
        FileUtil fileUtil2=new FileUtil();
        fileUtil2.ZipMultiFile("/home/bio/huxy/dataset/" + JobId, "/home/bio/huxy/dataset/" + JobId + ".zip.tar");
        return SUCCESS;
    }

    public String FNnoUpload() throws Exception{
        FunctionalNormalizeService functionalNormalizeService=(FunctionalNormalizeService)applicationContext.getBean("functionalnormalizeService") ;
        FileUtil fileUtil1=new FileUtil();
        input_FN_path=fileUtil1.Result_path();

        FunctionalNormalizeBean functionalNormalizeBean=new FunctionalNormalizeBean();
        functionalNormalizeBean.setDirectory(input_FN_file);
        functionalNormalizeBean.setResultsDir(input_FN_path);
        functionalNormalizeBean.setMethValue(methValue);
        functionalNormalizeBean.setPlot(plot);
        functionalNormalizeBean.setDetPcut(detPcut);
        functionalNormalizeBean.setFilterSNPs(filterSNPs);
        functionalNormalizeBean.setFilterXY(filterXY);
        functionalNormalizeBean.setFilterCRO(filterCRO);
        functionalNormalizeBean.setArraytype(arraytype);
        if (optionalParameters_FN==1){
            functionalNormalizeBean.setOption("");
        }else{
            functionalNormalizeBean.setOption("nPCs=" + nPCs + ",sex=" + sex + ",bgCorr=" + bgCorr + "," + "dyeCorr=" + dyeCorr + ",keepCN="+keepCN + ",verbose=" + verbose );
        }
        functionalNormalizeService.setFunctionalNormalizeBean(functionalNormalizeBean);
        stdoutlist=functionalNormalizeService.FunctionalNormalize();
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
    public void validate() {
        if(input_FN_file.equals("")){
            this.addFieldError("input_BMIQ_file", "Please input the raw IDAT file and Samplesheet.csv.");
        }
        try{
            UploadUtil uploadUtil2=new UploadUtil();
            if(!uploadUtil2.Check(fileField_fnFileName,fileField_fn)){
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
