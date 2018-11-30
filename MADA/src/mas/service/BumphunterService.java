package mas.service;

import mas.bean.BumphunterBean;
import mas.execute.BaseExecute;
import mas.execute.BumphunterExecute;

import java.io.IOException;

/**
 * Created by Administrator on 2018/3/22.
 */
public class BumphunterService {
    private BumphunterBean bumphunterBean;
    private BumphunterExecute bumphunterExecute;

    public BumphunterBean getBumphunterBean() {
        return bumphunterBean;
    }

    public void setBumphunterBean(BumphunterBean bumphunterBean) {
        this.bumphunterBean = bumphunterBean;
    }

    public BumphunterExecute getBumphunterExecute() {
        return bumphunterExecute;
    }

    public void setBumphunterExecute(BumphunterExecute bumphunterExecute) {
        this.bumphunterExecute = bumphunterExecute;
    }

    public String Bumphunter_execute() throws IOException {
        bumphunterExecute.Bum_exe(bumphunterBean);
        return bumphunterExecute.getStdoutlist();
    }
}
