package mas.service;

import mas.bean.IlluminaBean;
import mas.execute.IlluminaExecute;

import java.io.IOException;

/**
 * Created by Administrator on 2018/2/27.
 */
public class IlluminaService {
    private IlluminaExecute illuminaExecute;
    private IlluminaBean illuminaBean;

    public IlluminaExecute getIlluminaExecute() {
        return illuminaExecute;
    }

    public void setIlluminaExecute(IlluminaExecute illuminaExecute) {
        this.illuminaExecute = illuminaExecute;
    }

    public IlluminaBean getIlluminaBean() {
        return illuminaBean;
    }

    public void setIlluminaBean(IlluminaBean illuminaBean) {
        this.illuminaBean = illuminaBean;
    }

    public String Illumina() throws IOException{
            illuminaExecute.illumina_execute(illuminaBean);
            return illuminaExecute.getStdoutlist();
    }
}
