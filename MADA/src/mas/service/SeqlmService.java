package mas.service;

import mas.bean.SeqlmBean;
import mas.execute.SeqlmExecute;

import java.io.IOException;

/**
 * Created by Administrator on 2018/3/22.
 */
public class SeqlmService {
    private SeqlmBean seqlmBean;
    private SeqlmExecute seqlmExecute;

    public SeqlmBean getSeqlmBean() {
        return seqlmBean;
    }

    public void setSeqlmBean(SeqlmBean seqlmBean) {
        this.seqlmBean = seqlmBean;
    }

    public SeqlmExecute getSeqlmExecute() {
        return seqlmExecute;
    }

    public void setSeqlmExecute(SeqlmExecute seqlmExecute) {
        this.seqlmExecute = seqlmExecute;
    }

    public String Seqlm_execute() throws IOException{
        seqlmExecute.seqlm_exe(seqlmBean);
        return  seqlmExecute.getStdoutlist();
    }
}
