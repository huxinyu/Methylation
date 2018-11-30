package mas.service;

import mas.bean.FunctionalNormalizeBean;
import mas.execute.FunctionalNormalizeExecute;

import java.io.IOException;

/**
 * Created by Administrator on 2018/2/2.
 */
public class FunctionalNormalizeService {
    private FunctionalNormalizeBean functionalNormalizeBean;
    private FunctionalNormalizeExecute functionalNormalizeExecute;

    public FunctionalNormalizeBean getFunctionalNormalizeBean() {
        return functionalNormalizeBean;
    }

    public void setFunctionalNormalizeBean(FunctionalNormalizeBean functionalNormalizeBean) {
        this.functionalNormalizeBean = functionalNormalizeBean;
    }

    public FunctionalNormalizeExecute getFunctionalNormalizeExecute() {
        return functionalNormalizeExecute;
    }

    public void setFunctionalNormalizeExecute(FunctionalNormalizeExecute functionalNormalizeExecute) {
        this.functionalNormalizeExecute = functionalNormalizeExecute;
    }

    public String FunctionalNormalize()throws IOException{
            functionalNormalizeExecute.FunctionalNormalize_execute(functionalNormalizeBean);
            return  functionalNormalizeExecute.getStdoutlist();
    }
}
