package mas.service;

import mas.bean.LoadBean;
import mas.execute.LoadExecute;
import mas.execute.PBCExecute;
import mas.execute.SWANExecute;
import mas.execute.FunctionalNormalizeExecute;

import java.io.IOException;

/**
 * Created by Administrator on 2016/11/30.
 */
public class LoadService {
    private LoadBean loadBean;

    public LoadExecute getLoadExecute() {
        return loadExecute;
    }

    public void setLoadExecute(LoadExecute loadExecute) {
        this.loadExecute = loadExecute;
    }

    private LoadExecute loadExecute;

    public LoadBean getLoadBean() {
        return loadBean;
    }

    public void setLoadBean(LoadBean loadBean) {
        this.loadBean = loadBean;
    }

    public String Load_execute() throws IOException {
        loadExecute.Load_execute(loadBean);
        return loadExecute.getStdoutlist();
    }
}
