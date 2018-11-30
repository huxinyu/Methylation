package mas.service;

import mas.bean.SamrBean;
import mas.execute.SamrExecute;

import java.io.IOException;

/**
 * Created by Administrator on 2018/3/1.
 */
public class SamrService {
    private SamrExecute samrExecute;
    private SamrBean samrBean;

    public SamrExecute getSamrExecute() {
        return samrExecute;
    }

    public void setSamrExecute(SamrExecute samrExecute) {
        this.samrExecute = samrExecute;
    }

    public SamrBean getSamrBean() {
        return samrBean;
    }

    public void setSamrBean(SamrBean samrBean) {
        this.samrBean = samrBean;
    }

    public String samr_execute() throws IOException {
        samrExecute.samr_exe(samrBean);
            return samrExecute.getStdoutlist();
    }
}
