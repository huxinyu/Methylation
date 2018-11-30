package mas.service;

import mas.bean.SQNBean;
import mas.execute.SQNExecute;

import java.io.IOException;

/**
 * Created by Administrator on 2018/2/27.
 */
public class SQNService {
    private SQNBean sqnBean;
    private SQNExecute sqnExecute;

    public SQNBean getSqnBean() {
        return sqnBean;
    }

    public void setSqnBean(SQNBean sqnBean) {
        this.sqnBean = sqnBean;
    }

    public SQNExecute getSqnExecute() {
        return sqnExecute;
    }

    public void setSqnExecute(SQNExecute sqnExecute) {
        this.sqnExecute = sqnExecute;
    }



    public String SQN() throws IOException{
            sqnExecute.SQN_execute(sqnBean);
        return sqnExecute.getStdoutlist();

    }
}
