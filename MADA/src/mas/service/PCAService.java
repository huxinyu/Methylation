package mas.service;

import mas.bean.PCABean;
import mas.execute.PCAExecute;

import java.io.IOException;

/**
 * Created by Administrator on 2018/7/9.
 */
public class PCAService {
    private PCAExecute pcaExecute;
    private PCABean pcaBean;

    public PCAExecute getPcaExecute() {
        return pcaExecute;
    }

    public void setPcaExecute(PCAExecute pcaExecute) {
        this.pcaExecute = pcaExecute;
    }

    public PCABean getPcaBean() {
        return pcaBean;
    }

    public void setPcaBean(PCABean pcaBean) {
        this.pcaBean = pcaBean;
    }

    public String PCA() throws IOException {
        pcaExecute.PCA_exe(pcaBean);
        return pcaExecute.getStdoutlist();

    }
}
