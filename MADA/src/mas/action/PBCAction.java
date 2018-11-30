package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import mas.FileUtil;
import mas.UploadUtil;
import mas.bean.PBCBean;
import mas.service.PBCService;
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
 * Created by Administrator on 2018/2/1.
 */
public class PBCAction extends ActionSupport {

    private String input_PBC_file,input_PBC_path;
    private String methValue;
    private String arraytype;
    private String detPcut;
    private String filterXY;
    private String filterSNPs;
    private int optionalParameters_PBC;
    private String autoimpute,filterMultiHit;
    private String flag,flag_validate;
    private String stdoutlist;
    private List<File> fileField_pbc;
    private List<String> fileField_pbcFileName;
    private int plot;

    public int getPlot() {
        return plot;
    }

    public void setPlot(int plot) {
        this.plot = plot;
    }

    public String getInput_PBC_file() {
        return input_PBC_file;
    }

    public void setInput_PBC_file(String input_PBC_file) {
        this.input_PBC_file = input_PBC_file;
    }

    public String getInput_PBC_path() {
        return input_PBC_path;
    }

    public void setInput_PBC_path(String input_PBC_path) {
        this.input_PBC_path = input_PBC_path;
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

    public String getStdoutlist() {
        return stdoutlist;
    }

    public void setStdoutlist(String stdoutlist) {
        this.stdoutlist = stdoutlist;
    }

    public List<File> getFileField_pbc() {
        return fileField_pbc;
    }

    public void setFileField_pbc(List<File> fileField_pbc) {
        this.fileField_pbc = fileField_pbc;
    }

    public List<String> getFileField_pbcFileName() {
        return fileField_pbcFileName;
    }

    public void setFileField_pbcFileName(List<String> fileField_pbcFileName) {
        this.fileField_pbcFileName = fileField_pbcFileName;
    }

    public String getAutoimpute() {
        return autoimpute;
    }

    public void setAutoimpute(String autoimpute) {
        this.autoimpute = autoimpute;
    }



    public int getOptionalParameters_PBC() {
        return optionalParameters_PBC;
    }

    public void setOptionalParameters_PBC(int optionalParameters_PBC) {
        this.optionalParameters_PBC = optionalParameters_PBC;
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
    public String PBC_exe() throws Exception{
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
        System.out.println(fileField_pbc);
        System.out.println(fileField_pbcFileName);

        List<String> Upload_path=uploadUtil.upload(fileField_pbcFileName,fileField_pbc);
        remote_tag=Upload_path.get(0);
        System.out.println(remote_tag);
        //构造运行记录文件
        FileUtil fileUtil=new FileUtil();
        String admin_path= fileUtil.adminCheck_path()+".txt";
        File admin=new File(admin_path);
        appendMethodB(admin_path,"File list:"+"\r\n");
        String fileList="";
        for(int i=0;i<fileField_pbc.size();i++){
            appendMethodB(admin_path,Upload_path.get(i)+"\r\n");
            File file=new File(Upload_path.get(i));
            String name=file.getName();
            fileList+=name+" ; ";
        }
        xmlUtil.xmlAdd_Jobs(JobId,fileList, "PBC", "ERROR","email",time);
        appendMethodB(admin_path,"Result path:"+"\r\n");
        ////////////////////////////////////////////////////////////////////////////////////
        PBCService pbcService=(PBCService)applicationContext.getBean("pbcService");
        FileUtil fileUtil1=new FileUtil();
        input_PBC_path=fileUtil1.Result_path();
        appendMethodB(admin_path,input_PBC_path+"\r\n");

        PBCBean pbcBean=new PBCBean();
        pbcBean.setDirectory(remote_tag);
        pbcBean.setResultsDir(input_PBC_path);
        pbcBean.setMethValue(methValue);
        pbcBean.setArraytype(arraytype);
        pbcBean.setPlot(plot);
        pbcBean.setFilterXY(filterXY);
        pbcBean.setFilterSNPs(filterSNPs);
        pbcBean.setDetPcut(detPcut);
        if (optionalParameters_PBC==1){
            pbcBean.setOption("");
        }else{
            pbcBean.setOption("autoimpute=" + autoimpute  + ",filterMultiHit=" + filterMultiHit );
        }
        pbcService.setPbcBean(pbcBean);
        stdoutlist=pbcService.PBC();
        flag="2";
        flag_validate="1";

        //将结果压缩
        FileUtil fileUtil2=new FileUtil();
        fileUtil2.ZipMultiFile("/home/bio/huxy/dataset/" + JobId, "/home/bio/huxy/dataset/" + JobId + ".zip.tar");
    return SUCCESS;
    }
    public String PBCnoUpload() throws  Exception{
        PBCService pbcService=(PBCService)applicationContext.getBean("pbcService");
        FileUtil fileUtil1=new FileUtil();
        input_PBC_path=fileUtil1.Result_path();

        PBCBean pbcBean=new PBCBean();
        pbcBean.setDirectory(input_PBC_file);
        pbcBean.setResultsDir(input_PBC_path);
        pbcBean.setMethValue(methValue);
        pbcBean.setArraytype(arraytype);
        pbcBean.setFilterXY(filterXY);
        pbcBean.setFilterSNPs(filterSNPs);
        pbcBean.setDetPcut(detPcut);
        pbcBean.setPlot(plot);
        if (optionalParameters_PBC==1){
            pbcBean.setOption("");
        }else{
            pbcBean.setOption("autoimpute=" + autoimpute + ",filterMultiHit=" + filterMultiHit );
        }
        pbcService.setPbcBean(pbcBean);
        stdoutlist=pbcService.PBC();
        flag="2";
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
        if(input_PBC_file.equals("")){
            this.addFieldError("input_PBC_file", "Please input the raw IDAT file and Samplesheet.csv.");
        }
        try{
            UploadUtil uploadUtil2=new UploadUtil();
            if(!uploadUtil2.Check(fileField_pbcFileName,fileField_pbc)){
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

        flag="2";
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


