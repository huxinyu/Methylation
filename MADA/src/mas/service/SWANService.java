package mas.service;

import mas.bean.SWANBean;
import mas.execute.SWANExecute;
import java.io.IOException;

/**
 * Created by Administrator on 2018/2/2.
 */
public class SWANService {
    private SWANBean swanBean;
    private SWANExecute swanExecute;

    public SWANBean getSwanBean() {
        return swanBean;
    }

    public void setSwanBean(SWANBean swanBean) {
        this.swanBean = swanBean;
    }

    public SWANExecute getSwanExecute() {
        return swanExecute;
    }

    public void setSwanExecute(SWANExecute swanExecute) {
        this.swanExecute = swanExecute;
    }

    public String SWAN() throws IOException{
          swanExecute.SWAN_execute(swanBean);
          return  swanExecute.getStdoutlist();
    }
}
