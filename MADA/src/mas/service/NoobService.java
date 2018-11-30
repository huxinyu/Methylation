package mas.service;

import mas.bean.NoobBean;
import mas.execute.NoobExecute;

import java.io.IOException;

/**
 * Created by Administrator on 2018/2/27.
 */
public class NoobService {
    private NoobExecute noobExecute;
    private NoobBean noobBean;

    public NoobExecute getNoobExecute() {
        return noobExecute;
    }

    public void setNoobExecute(NoobExecute noobExecute) {
        this.noobExecute = noobExecute;
    }

    public NoobBean getNoobBean() {
        return noobBean;
    }

    public void setNoobBean(NoobBean noobBean) {
        this.noobBean = noobBean;
    }

    public String Noob() throws IOException {
        noobExecute.Noob_execute(noobBean);
        return noobExecute.getStdoutlist();
    }
}
