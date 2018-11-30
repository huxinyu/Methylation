package mas.service;

import mas.bean.DasenBean;
import mas.execute.DasenExecute;

import java.io.IOException;

/**
 * Created by Administrator on 2018/4/16.
 */
public class DasenService {
    private DasenBean dasenBean;
    private DasenExecute dasenExecute;

    public DasenBean getDasenBean() {
        return dasenBean;
    }

    public void setDasenBean(DasenBean dasenBean) {
        this.dasenBean = dasenBean;
    }

    public DasenExecute getDasenExecute() {
        return dasenExecute;
    }

    public void setDasenExecute(DasenExecute dasenExecute) {
        this.dasenExecute = dasenExecute;
    }
    public String Dasen_execute() throws IOException {

        dasenExecute.Dasen_execute(dasenBean);
        return dasenExecute.getStdoutlist();
    }
}
