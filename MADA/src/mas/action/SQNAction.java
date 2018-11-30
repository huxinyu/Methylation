package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import mas.FileUtil;
import mas.UploadUtil;
import mas.bean.SQNBean;
import mas.service.SQNService;
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
public class SQNAction extends ActionSupport {
    private String input_SQN_file,input_SQN_path;
    private String methValue;
    private int optionalParameters_SQN;
    private String detPcut;
    private String filterXY;
    private String filterSNPs;
    private String filterCRO;
    private String fixOutliers,removeBadSamples,badSampleCutoff,quantileNormalize,stratified,mergeManifest,verbose;
    private String flag,flag_validate;
    private String stdoutlist;
    private List<File> fileField_sqn;
    private List<String> fileField_sqnFileName;
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

    public String getInput_SQN_file() {
        return input_SQN_file;
    }

    public void setInput_SQN_file(String input_SQN_file) {
        this.input_SQN_file = input_SQN_file;
    }

    public String getInput_SQN_path() {
        return input_SQN_path;
    }

    public void setInput_SQN_path(String input_SQN_path) {
        this.input_SQN_path = input_SQN_path;
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

    public List<File> getFileField_sqn() {
        return fileField_sqn;
    }

    public void setFileField_sqn(List<File> fileField_sqn) {
        this.fileField_sqn = fileField_sqn;
    }

    public List<String> getFileField_sqnFileName() {
        return fileField_sqnFileName;
    }

    public void setFileField_sqnFileName(List<String> fileField_sqnFileName) {
        this.fileField_sqnFileName = fileField_sqnFileName;
    }

    public String getMethValue() {
        return methValue;
    }

    public void setMethValue(String methValue) {
        this.methValue = methValue;
    }

    public int getOptionalParameters_SQN() {
        return optionalParameters_SQN;
    }

    public void setOptionalParameters_SQN(int optionalParameters_SQN) {
        this.optionalParameters_SQN = optionalParameters_SQN;
    }

    public String getFixOutliers() {
        return fixOutliers;
    }

    public void setFixOutliers(String fixOutliers) {
        this.fixOutliers = fixOutliers;
    }

    public String getRemoveBadSamples() {
        return removeBadSamples;
    }

    public void setRemoveBadSamples(String removeBadSamples) {
        this.removeBadSamples = removeBadSamples;
    }

    public String getBadSampleCutoff() {
        return badSampleCutoff;
    }

    public void setBadSampleCutoff(String badSampleCutoff) {
        this.badSampleCutoff = badSampleCutoff;
    }

    public String getQuantileNormalize() {
        return quantileNormalize;
    }

    public void setQuantileNormalize(String quantileNormalize) {
        this.quantileNormalize = quantileNormalize;
    }

    public String getStratified() {
        return stratified;
    }

    public void setStratified(String stratified) {
        this.stratified = stratified;
    }

    public String getMergeManifest() {
        return mergeManifest;
    }

    public void setMergeManifest(String mergeManifest) {
        this.mergeManifest = mergeManifest;
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
    private ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    public String SQN_exe() throws Exception{
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
        System.out.println(fileField_sqn);
        System.out.println(fileField_sqnFileName);

        List<String> Upload_path=uploadUtil.upload(fileField_sqnFileName,fileField_sqn);
        remote_tag=Upload_path.get(0);
        System.out.println(remote_tag);
        //构造运行记录文件
        FileUtil fileUtil=new FileUtil();
        String admin_path= fileUtil.adminCheck_path()+".txt";
        File admin=new File(admin_path);
        appendMethodB(admin_path,"File list:"+"\r\n");
        String fileList="";
        for(int i=0;i<fileField_sqn.size();i++){
            appendMethodB(admin_path,Upload_path.get(i)+"\r\n");
            File file=new File(Upload_path.get(i));
            String name=file.getName();
            fileList+=name+" ; ";
        }
        xmlUtil.xmlAdd_Jobs(JobId,fileList, "SQN", "ERROR","email",time);
        appendMethodB(admin_path,"Result path:"+"\r\n");
        ////////////////////////////////////////////////////////////////////////////////////
        SQNService sqnService=(SQNService) applicationContext.getBean("sqnService") ;
        FileUtil fileUtil1=new FileUtil();
        input_SQN_path=fileUtil1.Result_path();
        appendMethodB(admin_path,input_SQN_path+"\r\n");

        SQNBean sqnBean=new SQNBean();
        sqnBean.setDirectory(remote_tag);
        sqnBean.setMethValue(methValue);
        sqnBean.setPath(input_SQN_path);
        sqnBean.setPlot(plot);
        sqnBean.setFilterSNPs(filterSNPs);
        sqnBean.setFilterXY(filterXY);
        sqnBean.setFilterCRO(filterCRO);
        sqnBean.setDetPcut(detPcut);
        sqnBean.setArraytype(arraytype);

        if (optionalParameters_SQN == 1) {
            sqnBean.setOption("");
        } else {
            sqnBean.setOption("fixOutliers=" + fixOutliers + ",removeBadSamples=" + removeBadSamples + ",badSampleCutoff=" + badSampleCutoff + "," + "quantileNormalize=" + quantileNormalize + "," + "stratified=" + stratified + "," + "mergeManifest=" + mergeManifest + "," + "verbose=" + verbose);
        }

        sqnService.setSqnBean(sqnBean);
        stdoutlist=sqnService.SQN();
        flag="7";
        flag_validate="1";

        //将结果压缩
        FileUtil fileUtil2=new FileUtil();
        fileUtil2.ZipMultiFile("/home/bio/huxy/dataset/" + JobId, "/home/bio/huxy/dataset/" + JobId + ".zip.tar");
        return SUCCESS;
    }
    public String SQNnoUpload() throws Exception{
        SQNService sqnService=(SQNService) applicationContext.getBean("sqnService") ;
        FileUtil fileUtil1=new FileUtil();
        input_SQN_path=fileUtil1.Result_path();

        SQNBean sqnBean=new SQNBean();
        sqnBean.setDirectory(input_SQN_file);
        sqnBean.setMethValue(methValue);
        sqnBean.setPath(input_SQN_path);
        sqnBean.setFilterSNPs(filterSNPs);
        sqnBean.setFilterXY(filterXY);
        sqnBean.setFilterCRO(filterCRO);
        sqnBean.setDetPcut(detPcut);
        sqnBean.setPlot(plot);
        sqnBean.setArraytype(arraytype);
        if (optionalParameters_SQN == 1) {
            sqnBean.setOption("");
        } else {
            sqnBean.setOption("fixOutliers=" + fixOutliers + ",removeBadSamples=" + removeBadSamples + ",badSampleCutoff=" + badSampleCutoff + "," + "quantileNormalize=" + quantileNormalize + "," + "stratified=" + stratified + "," + "mergeManifest=" + mergeManifest + "," + "verbose=" + verbose);
        }

        sqnService.setSqnBean(sqnBean);
        stdoutlist=sqnService.SQN();
        flag="7";
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
        if(input_SQN_file.equals("")){
            this.addFieldError("input_SQN_file", "Please input the raw IDAT file and Samplesheet.csv.");
        }
        try{
            UploadUtil uploadUtil2=new UploadUtil();
            if(!uploadUtil2.Check(fileField_sqnFileName,fileField_sqn)){
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

        flag="7";
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
