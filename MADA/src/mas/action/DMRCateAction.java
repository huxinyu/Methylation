package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import mas.FileUtil;
import mas.UploadUtil;
import mas.bean.DMRCateBean;
import mas.service.DMRCateService;
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
public class DMRCateAction extends ActionSupport{
    private String input_exprSetdmr_file,input_sampleSheetdmr_file,input_DMRCATE_path;
    private String methValue;
    private int optionalParameters_dmrcate;

    private String rmSNPCH,dist,mafcut,lambda,C;
    private String arraytype;
    private String flag,flag_validate;
    private String stdoutlist;
    private List<File> fileField_dmrcate;
    private List<String> fileField_dmrcateFileName;


    public String getMethValue() {
        return methValue;
    }

    public void setMethValue(String methValue) {
        this.methValue = methValue;
    }

    public String getArraytype() {
        return arraytype;
    }

    public void setArraytype(String arraytype) {
        this.arraytype = arraytype;
    }

    public String getInput_exprSetdmr_file() {
        return input_exprSetdmr_file;
    }

    public void setInput_exprSetdmr_file(String input_exprSetdmr_file) {
        this.input_exprSetdmr_file = input_exprSetdmr_file;
    }

    public String getInput_sampleSheetdmr_file() {
        return input_sampleSheetdmr_file;
    }

    public void setInput_sampleSheetdmr_file(String input_sampleSheetdmr_file) {
        this.input_sampleSheetdmr_file = input_sampleSheetdmr_file;
    }

    public String getInput_DMRCATE_path() {
        return input_DMRCATE_path;
    }

    public void setInput_DMRCATE_path(String input_DMRCATE_path) {
        this.input_DMRCATE_path = input_DMRCATE_path;
    }

    public int getOptionalParameters_dmrcate() {
        return optionalParameters_dmrcate;
    }

    public void setOptionalParameters_dmrcate(int optionalParameters_dmrcate) {
        this.optionalParameters_dmrcate = optionalParameters_dmrcate;
    }

    public String getRmSNPCH() {
        return rmSNPCH;
    }

    public void setRmSNPCH(String rmSNPCH) {
        this.rmSNPCH = rmSNPCH;
    }

    public String getDist() {
        return dist;
    }

    public void setDist(String dist) {
        this.dist = dist;
    }

    public String getMafcut() {
        return mafcut;
    }

    public void setMafcut(String mafcut) {
        this.mafcut = mafcut;
    }

    public String getLambda() {
        return lambda;
    }

    public void setLambda(String lambda) {
        this.lambda = lambda;
    }

    public String getC() {
        return C;
    }

    public void setC(String c) {
        C = c;
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

    public List<File> getFileField_dmrcate() {
        return fileField_dmrcate;
    }

    public void setFileField_dmrcate(List<File> fileField_dmrcate) {
        this.fileField_dmrcate = fileField_dmrcate;
    }

    public List<String> getFileField_dmrcateFileName() {
        return fileField_dmrcateFileName;
    }

    public void setFileField_dmrcateFileName(List<String> fileField_dmrcateFileName) {
        this.fileField_dmrcateFileName = fileField_dmrcateFileName;
    }
    private ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    public String DMRCate_exe() throws Exception{
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
        System.out.println(fileField_dmrcateFileName);
        System.out.println(fileField_dmrcate);

        List<String> Upload_path=uploadUtil.upload(fileField_dmrcateFileName,fileField_dmrcate);
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
        for(int i=0;i<fileField_dmrcate.size();i++){
            appendMethodB(admin_path,Upload_path.get(i)+"\r\n");
            File file=new File(Upload_path.get(i));
            String name=file.getName();
            fileList+=name+" ; ";
        }
        xmlUtil.xmlAdd_Jobs(JobId,fileList, "DMRCate", "ERROR","email",time);
        appendMethodB(admin_path,"Result path:"+"\r\n");
        ////////////////////////////////////////////////////////////////////////////////////

        DMRCateService dmrCateService = (DMRCateService) applicationContext.getBean("dmrcateService");
        FileUtil fileUtil1=new FileUtil();
        input_DMRCATE_path=fileUtil1.Result_path();
        appendMethodB(admin_path,input_DMRCATE_path+"\r\n");
        DMRCateBean dmrCateBean=new DMRCateBean();
        dmrCateBean.setInput_exprSetdmr_file(remote_tag);
        dmrCateBean.setInput_sampleSheetdmr_file(remote_control);
        dmrCateBean.setArraytype(arraytype);
        dmrCateBean.setMethValue(methValue);

        dmrCateBean.setPath(input_DMRCATE_path);
        if (optionalParameters_dmrcate == 1) {
            dmrCateBean.setOption("");
        } else {
            dmrCateBean.setOption("rmSNPCH=" + rmSNPCH + ",dist=" + dist + ",mafcut=" + mafcut +",lambda="+lambda+",C="+C);
        }
        dmrCateService.setDmrCateBean(dmrCateBean);
        stdoutlist=dmrCateService.DMRCate_execute();
        flag="10";
        flag_validate="1";

        //将结果压缩
        FileUtil fileUtil2=new FileUtil();
        fileUtil2.ZipMultiFile("/home/bio/huxy/dataset/" + JobId, "/home/bio/huxy/dataset/" + JobId + ".zip.tar");
        return SUCCESS;

    }
    public String DMRCatenoUpload() throws Exception{
        DMRCateService dmrCateService = (DMRCateService) applicationContext.getBean("dmrcateService");
        DMRCateBean dmrCateBean = new DMRCateBean();
        FileUtil fileUtil=new FileUtil();
        input_DMRCATE_path=fileUtil.Result_path();
        dmrCateBean.setInput_exprSetdmr_file(input_exprSetdmr_file);
        dmrCateBean.setInput_sampleSheetdmr_file(input_sampleSheetdmr_file);
        dmrCateBean.setArraytype(arraytype);
        dmrCateBean.setMethValue(methValue);

        dmrCateBean.setPath(input_DMRCATE_path);
        if (optionalParameters_dmrcate == 1) {
            dmrCateBean.setOption("");
        } else
        {
            dmrCateBean.setOption("rmSNPCH=" + rmSNPCH + ",dist=" + dist + ",mafcut=" + mafcut +",lambda="+lambda+",C="+C);
        }
        dmrCateService.setDmrCateBean(dmrCateBean);
        stdoutlist= dmrCateService.DMRCate_execute();
        flag="10";
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
        if(input_exprSetdmr_file.equals("")){
            this.addFieldError("input_exprSetdmr_file", "Please input ChIP-Seq file.");
        }
        if(input_sampleSheetdmr_file.equals("")){
            this.addFieldError("input_sampleSheetdmr_file", "Please input control file.");
        }
        try{
            UploadUtil uploadUtil2=new UploadUtil();
            if(!uploadUtil2.Check(fileField_dmrcateFileName,fileField_dmrcate)){
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

        flag="10";
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
