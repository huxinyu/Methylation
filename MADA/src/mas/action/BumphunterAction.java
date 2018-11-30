package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import mas.FileUtil;
import mas.UploadUtil;
import mas.bean.BumphunterBean;
import mas.service.BumphunterService;
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
public class BumphunterAction extends ActionSupport{
    private String input_exprSetbum_file,input_sampleSheetbum_file,input_bumphunter_path,arraytype;
    private int optionalParameters_bumphunter;
    private String minProbes,adjPvalDmr,maxGap,cutoff,pickCutoff,smooth,smoothFunction,useWeights,permutations,B,nullMethod;
    private String flag,flag_validate;
    private String stdoutlist;
    private List<File> fileField_bumphunter;
    private List<String> fileField_bumphunterFileName;

    public String getArraytype() {
        return arraytype;
    }

    public void setArraytype(String arraytype) {
        this.arraytype = arraytype;
    }

    public String getInput_exprSetbum_file() {
        return input_exprSetbum_file;
    }

    public void setInput_exprSetbum_file(String input_exprSetbum_file) {
        this.input_exprSetbum_file = input_exprSetbum_file;
    }

    public String getInput_sampleSheetbum_file() {
        return input_sampleSheetbum_file;
    }

    public void setInput_sampleSheetbum_file(String input_sampleSheetbum_file) {
        this.input_sampleSheetbum_file = input_sampleSheetbum_file;
    }

    public String getInput_bumphunter_path() {
        return input_bumphunter_path;
    }

    public void setInput_bumphunter_path(String input_bumphunter_path) {
        this.input_bumphunter_path = input_bumphunter_path;
    }

    public int getOptionalParameters_bumphunter() {
        return optionalParameters_bumphunter;
    }

    public void setOptionalParameters_bumphunter(int optionalParameters_bumphunter) {
        this.optionalParameters_bumphunter = optionalParameters_bumphunter;
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

    public String getMaxGap() {
        return maxGap;
    }

    public void setMaxGap(String maxGap) {
        this.maxGap = maxGap;
    }

    public String getCutoff() {
        return cutoff;
    }

    public void setCutoff(String cutoff) {
        this.cutoff = cutoff;
    }

    public String getPickCutoff() {
        return pickCutoff;
    }

    public void setPickCutoff(String pickCutoff) {
        this.pickCutoff = pickCutoff;
    }

    public String getSmooth() {
        return smooth;
    }

    public void setSmooth(String smooth) {
        this.smooth = smooth;
    }

    public String getSmoothFunction() {
        return smoothFunction;
    }

    public void setSmoothFunction(String smoothFunction) {
        this.smoothFunction = smoothFunction;
    }

    public String getUseWeights() {
        return useWeights;
    }

    public void setUseWeights(String useWeights) {
        this.useWeights = useWeights;
    }

    public String getPermutations() {
        return permutations;
    }

    public void setPermutations(String permutations) {
        this.permutations = permutations;
    }

    public String getB() {
        return B;
    }

    public void setB(String b) {
        B = b;
    }

    public String getNullMethod() {
        return nullMethod;
    }

    public void setNullMethod(String nullMethod) {
        this.nullMethod = nullMethod;
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

    public List<File> getFileField_bumphunter() {
        return fileField_bumphunter;
    }

    public void setFileField_bumphunter(List<File> fileField_bumphunter) {
        this.fileField_bumphunter = fileField_bumphunter;
    }

    public List<String> getFileField_bumphunterFileName() {
        return fileField_bumphunterFileName;
    }

    public void setFileField_bumphunterFileName(List<String> fileField_bumphunterFileName) {
        this.fileField_bumphunterFileName = fileField_bumphunterFileName;
    }
    private ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");

    public String Bumphunter_exe() throws Exception{
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
        System.out.println(fileField_bumphunterFileName);
        System.out.println(fileField_bumphunter);

        List<String> Upload_path=uploadUtil.upload(fileField_bumphunterFileName,fileField_bumphunter);
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
        for(int i=0;i<fileField_bumphunter.size();i++){
            appendMethodB(admin_path,Upload_path.get(i)+"\r\n");
            File file=new File(Upload_path.get(i));
            String name=file.getName();
            fileList+=name+" ; ";
        }
        xmlUtil.xmlAdd_Jobs(JobId,fileList, "bumphunter", "ERROR","email",time);
        appendMethodB(admin_path,"Result path:"+"\r\n");
        ////////////////////////////////////////////////////////////////////////////////////
        BumphunterService bumphunterService = (BumphunterService) applicationContext.getBean("bumphunterService");
        FileUtil fileUtil1=new FileUtil();
        input_bumphunter_path=fileUtil1.Result_path();
        appendMethodB(admin_path,input_bumphunter_path+"\r\n");
        BumphunterBean bumphunterBean = new BumphunterBean();
        bumphunterBean.setInput_exprSetbum_file(remote_tag);
        bumphunterBean.setInput_sampleSheetbum_file(remote_control);
        bumphunterBean.setArraytype(arraytype);
        bumphunterBean.setPath(input_bumphunter_path);

        if (optionalParameters_bumphunter == 1) {
            bumphunterBean.setOption("");
        } else {
            bumphunterBean.setOption("minProbes=" + minProbes + ",adjPvalDmr=" + adjPvalDmr + ",maxGap=" + maxGap+",cutoff=" +cutoff+",pickCutoff=" + pickCutoff + ",smooth=" + smooth + ",smoothFunction=" + smoothFunction+",useWeights=" +useWeights+",permutations=" + permutations + ",B=" + B + ",nullMethod=\""+ nullMethod+"\"");
        }

        bumphunterService.setBumphunterBean(bumphunterBean);
        stdoutlist=bumphunterService.Bumphunter_execute();
        flag="11";
        flag_validate="1";

        //将结果压缩
        FileUtil fileUtil2=new FileUtil();
        fileUtil2.ZipMultiFile("/home/bio/huxy/dataset/" + JobId, "/home/bio/huxy/dataset/" + JobId + ".zip.tar");
        return SUCCESS;
    }
    public String BumphunternoUpload() throws Exception{
        BumphunterService bumphunterService = (BumphunterService) applicationContext.getBean("bumphunterService");
        BumphunterBean bumphunterBean = new BumphunterBean();
        FileUtil fileUtil1=new FileUtil();
        input_bumphunter_path=fileUtil1.Result_path();
        bumphunterBean.setInput_exprSetbum_file(input_exprSetbum_file);
        bumphunterBean.setInput_sampleSheetbum_file(input_sampleSheetbum_file);
        bumphunterBean.setArraytype(arraytype);
        bumphunterBean.setPath(input_bumphunter_path);
        if (optionalParameters_bumphunter == 1) {
            bumphunterBean.setOption("");
        } else {
            bumphunterBean.setOption("minProbes=" + minProbes + ",adjPvalDmr=" + adjPvalDmr + ",maxGap=" + maxGap+",cutoff=" +cutoff+",pickCutoff=" + pickCutoff + ",smooth=" + smooth + ",smoothFunction=" + smoothFunction+",useWeights=" +useWeights+",permutations=" + permutations + ",B=" + B + ",nullMethod=\""+ nullMethod+"\"");
        }
        bumphunterService.setBumphunterBean(bumphunterBean);
        stdoutlist=bumphunterService.Bumphunter_execute();
        flag="11";
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
        if(input_exprSetbum_file.equals("")){
            this.addFieldError("input_exprSetbum_file", "Please input ChIP-Seq file.");
        }
        if(input_sampleSheetbum_file.equals("")){
            this.addFieldError("input_sampleSheetbum_file", "Please input control file.");
        }
        try{
            UploadUtil uploadUtil2=new UploadUtil();
            if(!uploadUtil2.Check(fileField_bumphunterFileName,fileField_bumphunter)){
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

        flag="11";
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
