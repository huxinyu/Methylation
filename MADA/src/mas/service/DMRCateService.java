package mas.service;

import mas.bean.DMRCateBean;
import mas.execute.DMRCateExecute;

import java.io.IOException;

/**
 * Created by Administrator on 2018/3/1.
 */
public class DMRCateService {
    private DMRCateBean dmrCateBean;
    private DMRCateExecute dmrCateExecute;


    public DMRCateBean getDmrCateBean() {
        return dmrCateBean;
    }

    public void setDmrCateBean(DMRCateBean dmrCateBean) {
        this.dmrCateBean = dmrCateBean;
    }

    public DMRCateExecute getDmrCateExecute() {
        return dmrCateExecute;
    }

    public void setDmrCateExecute(DMRCateExecute dmrCateExecute) {
        this.dmrCateExecute = dmrCateExecute;
    }
    public String DMRCate_execute() throws IOException {
        dmrCateExecute.DMRCate_exe(dmrCateBean);
        return  dmrCateExecute.getStdoutlist();
    }
}
