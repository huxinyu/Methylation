package mas.service;

import mas.bean.GOBean;
import mas.execute.GOExecute;

import java.io.IOException;

/**
 * Created by Administrator on 2018/4/2.
 */
public class GOService {
    private GOBean goBean;
    private GOExecute goExecute;

    public GOBean getGoBean() {
        return goBean;
    }

    public void setGoBean(GOBean goBean) {
        this.goBean = goBean;
    }

    public GOExecute getGoExecute() {
        return goExecute;
    }

    public void setGoExecute(GOExecute goExecute) {
        this.goExecute = goExecute;
    }
    public String GO() throws IOException {
        goExecute.GO_exe(goBean);
        return goExecute.getStdoutlist();

    }

}
