package mas.service;

import mas.bean.DmpFinderBean;
import mas.execute.DmpFinderExecute;

import java.io.IOException;

/**
 * Created by Administrator on 2018/3/1.
 */
public class DmpFinderService {
    private DmpFinderExecute dmpFinderExecute;
    private DmpFinderBean dmpFinderBean;

    public DmpFinderExecute getdmpFinderExecute() {
        return dmpFinderExecute;
    }

    public void setdmpFinderExecute(DmpFinderExecute dmpFinderExecute) {
        this.dmpFinderExecute = dmpFinderExecute;
    }

    public DmpFinderBean getdmpFinderBean() {
        return dmpFinderBean;
    }

    public void setdmpFinderBean(DmpFinderBean dmpFinderBean) {
        this.dmpFinderBean = dmpFinderBean;
    }

    public String dmpFinder_execute() throws IOException {
        dmpFinderExecute.dmpFinder_exe(dmpFinderBean);
            return dmpFinderExecute.getStdoutlist();
    }
}
