package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import mas.FileUtil;
import mas.UploadUtil;
import mas.bean.PCABean;
import mas.service.PCAService;
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
 * Created by Administrator on 2018/7/9.
 */
public class PCAAction extends ActionSupport {
    private String input_pca,input_path_pca;
    private List<File> PCA_file;
    private List<String> PCA_fileFileName;
    private String flag,flag_validate;
    private String stdoutlist;
    private int plot;

    public String getInput_pca() {
        return input_pca;
    }

    public void setInput_pca(String input_pca) {
        this.input_pca = input_pca;
    }

    public String getInput_path_pca() {
        return input_path_pca;
    }

    public void setInput_path_pca(String input_path_pca) {
        this.input_path_pca = input_path_pca;
    }

    public List<File> getPCA_file() {
        return PCA_file;
    }

    public void setPCA_file(List<File> PCA_file) {
        this.PCA_file = PCA_file;
    }

    public List<String> getPCA_fileFileName() {
        return PCA_fileFileName;
    }

    public void setPCA_fileFileName(List<String> PCA_fileFileName) {
        this.PCA_fileFileName = PCA_fileFileName;
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

    public int getPlot() {
        return plot;
    }

    public void setPlot(int plot) {
        this.plot = plot;
    }

    private ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    public String PCA_exe() throws Exception{
            //生成运行起始时间
            Date date = new Date();
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
            String time = format.format(date);
            //构建session
            xmlUtil xmlUtil = new xmlUtil();
            String JobId = "JobId_" + xmlUtil.generateString(6);
            xmlUtil.creatSession(JobId, time);
            ///upload
            String remote_tag;
            UploadUtil uploadUtil = new UploadUtil();
            System.out.println(PCA_file);
            System.out.println(PCA_fileFileName);

            List<String> Upload_path = uploadUtil.upload(PCA_fileFileName, PCA_file);
            remote_tag = Upload_path.get(0);
            System.out.println(remote_tag);
            //构造运行记录文件
            FileUtil fileUtil = new FileUtil();
            String admin_path = fileUtil.adminCheck_path() + ".txt";
            File admin = new File(admin_path);
            appendMethodB(admin_path, "File list:" + "\r\n");
            String fileList = "";
            for (int i = 0; i < PCA_file.size(); i++) {
                appendMethodB(admin_path, Upload_path.get(i) + "\r\n");
                File file = new File(Upload_path.get(i));
                String name = file.getName();
                fileList += name + " ; ";
            }
            xmlUtil.xmlAdd_Jobs(JobId, fileList, "PCA", "ERROR", "email", time);
            appendMethodB(admin_path, "Result path:" + "\r\n");
            ////////////////////////////////////////////////////////////////////////////////////
            PCAService pcaService = (PCAService) applicationContext.getBean("pcaService");
            FileUtil fileUtil1 = new FileUtil();
            input_path_pca = fileUtil1.Result_path();
            appendMethodB(admin_path, input_path_pca + "\r\n");

            PCABean pcaBean = new PCABean();
            pcaBean.setInput_pca(remote_tag);
            pcaBean.setPath_pca(input_path_pca);
            pcaBean.setPlot(plot);

            pcaService.setPcaBean(pcaBean);
            stdoutlist = pcaService.PCA();
            flag = "2";
            flag_validate = "1";

            //将结果压缩
            FileUtil fileUtil2 = new FileUtil();
            fileUtil2.ZipMultiFile("/home/bio/huxy/dataset/" + JobId, "/home/bio/huxy/dataset/" + JobId + ".zip.tar");

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
        if(input_pca.equals("")){
            this.addFieldError("PCA_file", "Please input the raw IDAT file and Samplesheet.csv.");
        }
        try{
            UploadUtil uploadUtil2=new UploadUtil();
            if(!uploadUtil2.Check(PCA_fileFileName,PCA_file)){
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
