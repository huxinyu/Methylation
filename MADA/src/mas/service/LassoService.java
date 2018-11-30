package mas.service;

import mas.bean.LassoBean;
import mas.execute.LassoExecute;

import java.io.IOException;

/**
 * Created by Administrator on 2018/3/22.
 */
public class LassoService {
    private LassoExecute lassoExecute;
    private LassoBean lassoBean;

    public LassoExecute getLassoExecute() {
        return lassoExecute;
    }

    public void setLassoExecute(LassoExecute lassoExecute) {
        this.lassoExecute = lassoExecute;
    }

    public LassoBean getLassoBean() {
        return lassoBean;
    }

    public void setLassoBean(LassoBean lassoBean) {
        this.lassoBean = lassoBean;
    }

    public String Lasso_execute() throws IOException{
        lassoExecute.Lasso_exe(lassoBean);
        return lassoExecute.getStdoutlist();
    }
}
