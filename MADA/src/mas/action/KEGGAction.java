package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import mas.FileUtil;
import mas.UploadUtil;
import mas.bean.KEGGBean;
import mas.service.KEGGService;
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
 * Created by Administrator on 2018/4/2.
 */
public class KEGGAction extends ActionSupport {
    private String input_kegg,input_path_kegg;
    private String arraytype;
    private int KEGG_option;
    private String plot_bias,prior_prob;
    private String flag,flag_validate;
    private String stdoutlist;
    private List<File> KEGG_file;
    private List<String> KEGG_fileFileName;
    private int plot;
    private int number;

    public int getPlot() {
        return plot;
    }

    public void setPlot(int plot) {
        this.plot = plot;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getInput_kegg() {
        return input_kegg;
    }

    public void setInput_kegg(String input_kegg) {
        this.input_kegg = input_kegg;
    }

    public String getInput_path_kegg() {
        return input_path_kegg;
    }

    public void setInput_path_kegg(String input_path_kegg) {
        this.input_path_kegg = input_path_kegg;
    }

    public String getArraytype() {
        return arraytype;
    }

    public void setArraytype(String arraytype) {
        this.arraytype = arraytype;
    }

    public int getKEGG_option() {
        return KEGG_option;
    }

    public void setKEGG_option(int KEGG_option) {
        this.KEGG_option = KEGG_option;
    }

    public String getPlot_bias() {
        return plot_bias;
    }

    public void setPlot_bias(String plot_bias) {
        this.plot_bias = plot_bias;
    }

    public String getPrior_prob() {
        return prior_prob;
    }

    public void setPrior_prob(String prior_prob) {
        this.prior_prob = prior_prob;
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

    public List<File> getKEGG_file() {
        return KEGG_file;
    }

    public void setKEGG_file(List<File> KEGG_file) {
        this.KEGG_file = KEGG_file;
    }

    public List<String> getKEGG_fileFileName() {
        return KEGG_fileFileName;
    }

    public void setKEGG_fileFileName(List<String> KEGG_fileFileName) {
        this.KEGG_fileFileName = KEGG_fileFileName;
    }
    private ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    public String KEGG_exe() throws Exception{
        if(input_kegg.equals("DMP_GSE90060.csv") && arraytype.equals("450K")){
            KEGGDemoAction keggDemoAction=new KEGGDemoAction();
            keggDemoAction.Demo();
            flag="2";
            flag_validate="1";
        }
        else {
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
            System.out.println(KEGG_file);
            System.out.println(KEGG_fileFileName);

            List<String> Upload_path = uploadUtil.upload(KEGG_fileFileName, KEGG_file);
            remote_tag = Upload_path.get(0);
            System.out.println(remote_tag);
            //构造运行记录文件
            FileUtil fileUtil = new FileUtil();
            String admin_path = fileUtil.adminCheck_path() + ".txt";
            File admin = new File(admin_path);
            appendMethodB(admin_path, "File list:" + "\r\n");
            String fileList = "";
            for (int i = 0; i < KEGG_file.size(); i++) {
                appendMethodB(admin_path, Upload_path.get(i) + "\r\n");
                File file = new File(Upload_path.get(i));
                String name = file.getName();
                fileList += name + " ; ";
            }
            xmlUtil.xmlAdd_Jobs(JobId, fileList, "KEGG", "ERROR", "email", time);
            appendMethodB(admin_path, "Result path:" + "\r\n");
            ////////////////////////////////////////////////////////////////////////////////////
            KEGGService keggService = (KEGGService) applicationContext.getBean("keggService");
            FileUtil fileUtil1 = new FileUtil();
            input_path_kegg = fileUtil1.Result_path();
            appendMethodB(admin_path, input_path_kegg + "\r\n");

            KEGGBean keggBean = new KEGGBean();
            keggBean.setInput_kegg(remote_tag);
            keggBean.setPath_kegg(input_path_kegg);
            keggBean.setArraytype(arraytype);
            keggBean.setPlot(plot);
            keggBean.setNumber(number);

            if (KEGG_option == 1) {
                keggBean.setOption("");
            } else {
                keggBean.setOption("plot.bias=" + plot_bias + ",prior.prob=" + prior_prob);
            }
            keggService.setKeggBean(keggBean);
            stdoutlist = keggService.KEGG();
            flag = "2";
            flag_validate = "1";

            //将结果压缩
            FileUtil fileUtil2 = new FileUtil();
            fileUtil2.ZipMultiFile("/home/bio/huxy/dataset/" + JobId, "/home/bio/huxy/dataset/" + JobId + ".zip.tar");
        }
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
        if(input_kegg.equals("")){
            this.addFieldError("KEGG_file", "Please input the raw IDAT file and Samplesheet.csv.");
        }
        try{
            UploadUtil uploadUtil2=new UploadUtil();
            if(!uploadUtil2.Check(KEGG_fileFileName,KEGG_file)){
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
