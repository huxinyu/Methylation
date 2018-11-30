package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import mas.FileUtil;
import mas.UploadUtil;
import mas.bean.SWANBean;
import mas.service.SWANService;
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
public class SWANAction extends ActionSupport {
    private String input_SWAN_file,input_SWAN_path;
    private String methValue;
    private String detPcut;
    private String filterXY;
    private String filterSNPs;
    private String filterCRO;
    private String flag,flag_validate;
    private String stdoutlist;
    private List<File> fileField_swan;
    private List<String> fileField_swanFileName;
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



    public String getInput_SWAN_file() {
        return input_SWAN_file;
    }

    public void setInput_SWAN_file(String input_SWAN_file) {
        this.input_SWAN_file = input_SWAN_file;
    }

    public String getInput_SWAN_path() {
        return input_SWAN_path;
    }

    public void setInput_SWAN_path(String input_SWAN_path) {
        this.input_SWAN_path = input_SWAN_path;
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

    public List<File> getFileField_swan() {
        return fileField_swan;
    }

    public void setFileField_swan(List<File> fileField_swan) {
        this.fileField_swan = fileField_swan;
    }

    public List<String> getFileField_swanFileName() {
        return fileField_swanFileName;
    }

    public void setFileField_swanFileName(List<String> fileField_swanFileName) {
        this.fileField_swanFileName = fileField_swanFileName;
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
    public String SWAN_exe() throws Exception{
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
        System.out.println(fileField_swan);
        System.out.println(fileField_swan);

        List<String> Upload_path=uploadUtil.upload(fileField_swanFileName,fileField_swan);
        remote_tag=Upload_path.get(0);
        System.out.println(remote_tag);
        //构造运行记录文件
        FileUtil fileUtil=new FileUtil();
        String admin_path= fileUtil.adminCheck_path()+".txt";
        File admin=new File(admin_path);
        appendMethodB(admin_path,"File list:"+"\r\n");
        String fileList="";
        for(int i=0;i<fileField_swan.size();i++){
            appendMethodB(admin_path,Upload_path.get(i)+"\r\n");
            File file=new File(Upload_path.get(i));
            String name=file.getName();
            fileList+=name+" ; ";
        }
        xmlUtil.xmlAdd_Jobs(JobId,fileList, "SWAN", "ERROR","email",time);
        appendMethodB(admin_path,"Result path:"+"\r\n");
        ////////////////////////////////////////////////////////////////////////////////////

        SWANService swanService=(SWANService)applicationContext.getBean("swanService");
        FileUtil fileUtil1=new FileUtil();
        input_SWAN_path=fileUtil1.Result_path();
        appendMethodB(admin_path,input_SWAN_path+"\r\n");

        SWANBean swanBean=new SWANBean();
        swanBean.setDirectory(remote_tag);
        swanBean.setResultsDir(input_SWAN_path);
        swanBean.setMethValue(methValue);
        swanBean.setPlot(plot);
        swanBean.setDetPcut(detPcut);
        swanBean.setFilterSNPs(filterSNPs);
        swanBean.setFilterXY(filterXY);
        swanBean.setFilterCRO(filterCRO);
        swanBean.setArraytype(arraytype);

        swanService.setSwanBean(swanBean);
        stdoutlist=swanService.SWAN();
        flag="3";
        flag_validate="1";

        //将结果压缩
        FileUtil fileUtil2=new FileUtil();
        fileUtil2.ZipMultiFile("/home/bio/huxy/dataset/" + JobId, "/home/bio/huxy/dataset/" + JobId + ".zip.tar");
        return SUCCESS;
    }

    public String SWANnoUpload() throws Exception{
        SWANService swanService=(SWANService)applicationContext.getBean("swanService");
        FileUtil fileUtil1=new FileUtil();
        input_SWAN_path=fileUtil1.Result_path();

        SWANBean swanBean=new SWANBean();
        swanBean.setDirectory(input_SWAN_file);
        swanBean.setResultsDir(input_SWAN_path);
        swanBean.setMethValue(methValue);
        swanBean.setPlot(plot);
        swanBean.setDetPcut(detPcut);
        swanBean.setFilterSNPs(filterSNPs);
        swanBean.setFilterXY(filterXY);
        swanBean.setFilterCRO(filterCRO);
        swanBean.setArraytype(arraytype);
        swanService.setSwanBean(swanBean);
        stdoutlist=swanService.SWAN();
        flag="3";
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
        if(input_SWAN_file.equals("")){
            this.addFieldError("input_SWAN_file", "Please input the raw IDAT file and Samplesheet.csv.");
        }
        try{
            UploadUtil uploadUtil2=new UploadUtil();
            if(!uploadUtil2.Check(fileField_swanFileName,fileField_swan)){
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

        flag="3";
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
