package mas.service;

import mas.bean.LimmaBean;
import mas.execute.LimmaExecute;

import java.io.IOException;

/**
 * Created by Administrator on 2018/3/1.
 */
public class LimmaService {
    private LimmaExecute limmaExecute;
    private LimmaBean limmaBean;

    public LimmaExecute getLimmaExecute() {
        return limmaExecute;
    }

    public void setLimmaExecute(LimmaExecute limmaExecute) {
        this.limmaExecute = limmaExecute;
    }

    public LimmaBean getLimmaBean() {
        return limmaBean;
    }

    public void setLimmaBean(LimmaBean limmaBean) {
        this.limmaBean = limmaBean;
    }

    public String Limma_execute() throws IOException {
            limmaExecute.Limma_exe(limmaBean);
            return limmaExecute.getStdoutlist();
    }
}
