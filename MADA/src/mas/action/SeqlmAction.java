package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import mas.FileUtil;
import mas.UploadUtil;
import mas.bean.SeqlmBean;
import mas.service.SeqlmService;
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
public class SeqlmAction extends ActionSupport{
    private String input_exprSetseq_file,input_sampleSheetseq_file,input_seqlm_path;
    private int optionalParameters_seqlm;
    private String max_block_length,max_dist,expand,width,height,dpi,main;
    private String flag,flag_validate;
    private String stdoutlist;
    private List<File> fileField_seqlm;
    private List<String> fileField_seqlmFileName;

    public String getInput_exprSetseq_file() {
        return input_exprSetseq_file;
    }

    public void setInput_exprSetseq_file(String input_exprSetseq_file) {
        this.input_exprSetseq_file = input_exprSetseq_file;
    }

    public String getInput_sampleSheetseq_file() {
        return input_sampleSheetseq_file;
    }

    public void setInput_sampleSheetseq_file(String input_sampleSheetseq_file) {
        this.input_sampleSheetseq_file = input_sampleSheetseq_file;
    }

    public String getInput_seqlm_path() {
        return input_seqlm_path;
    }

    public void setInput_seqlm_path(String input_seqlm_path) {
        this.input_seqlm_path = input_seqlm_path;
    }

    public int getOptionalParameters_seqlm() {
        return optionalParameters_seqlm;
    }

    public void setOptionalParameters_seqlm(int optionalParameters_seqlm) {
        this.optionalParameters_seqlm = optionalParameters_seqlm;
    }

    public String getMax_block_length() {
        return max_block_length;
    }

    public void setMax_block_length(String max_block_length) {
        this.max_block_length = max_block_length;
    }

    public String getMax_dist() {
        return max_dist;
    }

    public void setMax_dist(String max_dist) {
        this.max_dist = max_dist;
    }

    public String getExpand() {
        return expand;
    }

    public void setExpand(String expand) {
        this.expand = expand;
    }

    public String getWidth() {
        return width;
    }

    public void setWidth(String width) {
        this.width = width;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getDpi() {
        return dpi;
    }

    public void setDpi(String dpi) {
        this.dpi = dpi;
    }

    public String getMain() {
        return main;
    }

    public void setMain(String main) {
        this.main = main;
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

    public List<File> getFileField_seqlm() {
        return fileField_seqlm;
    }

    public void setFileField_seqlm(List<File> fileField_seqlm) {
        this.fileField_seqlm = fileField_seqlm;
    }

    public List<String> getFileField_seqlmFileName() {
        return fileField_seqlmFileName;
    }

    public void setFileField_seqlmFileName(List<String> fileField_seqlmFileName) {
        this.fileField_seqlmFileName = fileField_seqlmFileName;
    }

    private ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    public String Seqlm_exe() throws Exception{
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
        System.out.println(fileField_seqlmFileName);
        System.out.println(fileField_seqlm);

        List<String> Upload_path=uploadUtil.upload(fileField_seqlmFileName,fileField_seqlm);
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
        for(int i=0;i<fileField_seqlm.size();i++){
            appendMethodB(admin_path,Upload_path.get(i)+"\r\n");
            File file=new File(Upload_path.get(i));
            String name=file.getName();
            fileList+=name+" ; ";
        }
        xmlUtil.xmlAdd_Jobs(JobId,fileList, "Seqlm", "ERROR","email",time);
        appendMethodB(admin_path,"Result path:"+"\r\n");
        ////////////////////////////////////////////////////////////////////////////////////
        SeqlmService seqlmService = (SeqlmService) applicationContext.getBean("seqlmService");
        FileUtil fileUtil1=new FileUtil();
        input_seqlm_path=fileUtil1.Result_path();
        appendMethodB(admin_path,input_seqlm_path+"\r\n");
        SeqlmBean seqlmBean = new SeqlmBean();
        seqlmBean.setInput_exprSetseq_file(remote_tag);
        seqlmBean.setInput_sampleSheetseq_file(remote_control);
        seqlmBean.setPath(input_seqlm_path);
        if (optionalParameters_seqlm == 1) {
            seqlmBean.setOption("");
            seqlmBean.setOption1("");
        } else {
            seqlmBean.setOption("max_block_length=" + max_block_length + ",max_dist=" + max_dist);
            seqlmBean.setOption1("expand=" +expand+",width=" + width + ",height=" + height + ",dpi=" + dpi+",main=\"" + main+"\"");
        }
        seqlmService.setSeqlmBean(seqlmBean);
        stdoutlist=seqlmService.Seqlm_execute();
        flag="13";
        flag_validate="1";

        //将结果压缩
        FileUtil fileUtil2=new FileUtil();
        fileUtil2.ZipMultiFile("/home/bio/huxy/dataset/" + JobId, "/home/bio/huxy/dataset/" + JobId + ".zip.tar");
        return SUCCESS;
    }
    public String SeqlmanoUpload() throws Exception{
        SeqlmService seqlmService = (SeqlmService) applicationContext.getBean("seqlmService");
        FileUtil fileUtil=new FileUtil();
        input_seqlm_path=fileUtil.Result_path();
        SeqlmBean seqlmBean = new SeqlmBean();
        seqlmBean.setInput_exprSetseq_file(input_exprSetseq_file);
        seqlmBean.setInput_sampleSheetseq_file(input_sampleSheetseq_file);
        seqlmBean.setPath(input_seqlm_path);
        if (optionalParameters_seqlm == 1) {
            seqlmBean.setOption("");
        } else {
            seqlmBean.setOption("max_block_length=" + max_block_length + ",max_dist=" + max_dist);
            seqlmBean.setOption1("expand=" +expand+",width=" + width + ",height=" + height + ",dpi=" + dpi+",main=\""+main+"\"");
        }
        seqlmService.setSeqlmBean(seqlmBean);
        stdoutlist=seqlmService.Seqlm_execute();
        flag="13";
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
        if(input_exprSetseq_file.equals("")){
            this.addFieldError("input_exprSet_file", "Please input ChIP-Seq file.");
        }
        if(input_sampleSheetseq_file.equals("")){
            this.addFieldError("input_sampleSheet_file", "Please input control file.");
        }
        try{
            UploadUtil uploadUtil2=new UploadUtil();
            if(!uploadUtil2.Check(fileField_seqlmFileName,fileField_seqlm)){
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

        flag="13";
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
