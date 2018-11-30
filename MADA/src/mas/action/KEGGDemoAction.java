package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import mas.xmlUtil;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2018/5/15.
 */
public class KEGGDemoAction extends ActionSupport {
    private String flag,flag_son,flag_validate;

    public String getFlag_validate() {
        return flag_validate;
    }

    public void setFlag_validate(String flag_validate) {
        this.flag_validate = flag_validate;
    }

    public String getFlag_son() {
        return flag_son;
    }

    public void setFlag_son(String flag_son) {
        this.flag_son = flag_son;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String Demo() throws Exception{
        try {
            Thread.sleep(5000);                 //1000 毫秒，也就是1秒.
        } catch(InterruptedException ex) {
            Thread.currentThread().interrupt();
        }
        //生成运行起始时间
        Date date=new Date();
        DateFormat format=new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
        String time=format.format(date);
        //构建session
        xmlUtil xmlUtil = new xmlUtil();
        xmlUtil.creatSession("JobId_KEGG_demo",time);
        //写入XML文件
        xmlUtil.xmlAdd_Jobs("JobId_KEGG_demo" ,"myNorm.csv", "KEGG", "","email",time);

        flag="2";
        flag_son="3";
        flag_validate="1";
        return SUCCESS;
    }
}
