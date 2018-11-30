package mas.service;

import mas.bean.PBCBean;
import mas.execute.PBCExecute;

import java.io.IOException;

/**
 * Created by Administrator on 2018/2/1.
 */
public class PBCService {
    private PBCBean pbcBean;
    private PBCExecute pbcExecute;

    public PBCBean getPbcBean() {
        return pbcBean;
    }

    public void setPbcBean(PBCBean pbcBean) {
        this.pbcBean = pbcBean;
    }

    public PBCExecute getPbcExecute() {
        return pbcExecute;
    }

    public void setPbcExecute(PBCExecute pbcExecute) {
        this.pbcExecute = pbcExecute;
    }

    public String PBC() throws IOException{
        pbcExecute.PBC_execute(pbcBean);
        return pbcExecute.getStdoutlist();

    }
}
