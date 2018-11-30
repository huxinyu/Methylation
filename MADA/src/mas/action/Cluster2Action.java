package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import mas.FileUtil;
import mas.UploadUtil;
import mas.bean.Cluster2Bean;
import mas.service.Cluster2Service;
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
public class Cluster2Action extends ActionSupport{
    private String input_cluster2,input_path_cluster2;
    private int Cluster2_option;
    private String method;
    private String flag,flag_validate;
    private String stdoutlist;
    private List<File> Cluster2_file;
    private List<String> Cluster2_fileFileName;
    private int plot;

    public String getInput_cluster2() {
        return input_cluster2;
    }

    public void setInput_cluster2(String input_cluster2) {
        this.input_cluster2 = input_cluster2;
    }

    public String getInput_path_cluster2() {
        return input_path_cluster2;
    }

    public void setInput_path_cluster2(String input_path_cluster2) {
        this.input_path_cluster2 = input_path_cluster2;
    }

    public int getCluster2_option() {
        return Cluster2_option;
    }

    public void setCluster2_option(int cluster2_option) {
        Cluster2_option = cluster2_option;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
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

    public List<File> getCluster2_file() {
        return Cluster2_file;
    }

    public void setCluster2_file(List<File> cluster2_file) {
        Cluster2_file = cluster2_file;
    }

    public List<String> getCluster2_fileFileName() {
        return Cluster2_fileFileName;
    }

    public void setCluster2_fileFileName(List<String> cluster2_fileFileName) {
        Cluster2_fileFileName = cluster2_fileFileName;
    }

    public int getPlot() {
        return plot;
    }

    public void setPlot(int plot) {
        this.plot = plot;
    }

    public ApplicationContext getApplicationContext() {
        return applicationContext;
    }

    public void setApplicationContext(ApplicationContext applicationContext) {
        this.applicationContext = applicationContext;
    }

    private ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    public String Cluster2_exe() throws Exception{
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
        System.out.println(Cluster2_file);
        System.out.println(Cluster2_fileFileName);

        List<String> Upload_path = uploadUtil.upload(Cluster2_fileFileName, Cluster2_file);
        remote_tag = Upload_path.get(0);
        System.out.println(remote_tag);
        //构造运行记录文件
        FileUtil fileUtil = new FileUtil();
        String admin_path = fileUtil.adminCheck_path() + ".txt";
        File admin = new File(admin_path);
        appendMethodB(admin_path, "File list:" + "\r\n");
        String fileList = "";
        for (int i = 0; i < Cluster2_file.size(); i++) {
            appendMethodB(admin_path, Upload_path.get(i) + "\r\n");
            File file = new File(Upload_path.get(i));
            String name = file.getName();
            fileList += name + " ; ";
        }
        xmlUtil.xmlAdd_Jobs(JobId, fileList, "Two-dimensional clustering", "ERROR", "email", time);
        appendMethodB(admin_path, "Result path:" + "\r\n");
        ////////////////////////////////////////////////////////////////////////////////////
        Cluster2Service cluster2Service = (Cluster2Service) applicationContext.getBean("cluster2Service");
        FileUtil fileUtil1 = new FileUtil();
        input_path_cluster2 = fileUtil1.Result_path();
        appendMethodB(admin_path, input_path_cluster2 + "\r\n");

        Cluster2Bean cluster1Bean = new Cluster2Bean();
        cluster1Bean.setInput_cluster2(remote_tag);
        cluster1Bean.setPath_clu2(input_path_cluster2);
        cluster1Bean.setPlot(plot);

        if (Cluster2_option == 1) {
            cluster1Bean.setOption(" " );
        } else {
            cluster1Bean.setOption(",method="+"\""+method+"\"");
        }
        cluster2Service.setCluster2Bean(cluster1Bean);
        stdoutlist = cluster2Service.Cluster2();
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
        if(input_cluster2.equals("")){
            this.addFieldError("Cluster1_file", "Please input the raw IDAT file and Samplesheet.csv.");
        }
        try{
            UploadUtil uploadUtil2=new UploadUtil();
            if(!uploadUtil2.Check(Cluster2_fileFileName,Cluster2_file)){
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
