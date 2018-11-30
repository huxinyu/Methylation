package mas.service;

import mas.bean.RawBean;
import mas.execute.RawExecute;

import java.io.IOException;

/**
 * Created by Administrator on 2018/3/19.
 */
public class RawService {
    private RawBean rawBean;
    private RawExecute rawExecute;

    public RawBean getRawBean() {
        return rawBean;
    }

    public void setRawBean(RawBean rawBean) {
        this.rawBean = rawBean;
    }

    public RawExecute getRawExecute() {
        return rawExecute;
    }

    public void setRawExecute(RawExecute rawExecute) {
        this.rawExecute = rawExecute;
    }

    public String RAW_execute() throws IOException {

        rawExecute.RAW_execute(rawBean);
        return rawExecute.getStdoutlist();
    }

}
