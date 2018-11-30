package mas.service;

import mas.bean.BatchBean;
import mas.execute.BatchExecute;

import java.io.IOException;

/**
 * Created by Administrator on 2018/3/1.
 */
public class BatchService {
    private BatchExecute batchExecute;
    private BatchBean batchBean;

    public BatchExecute getbatchExecute() {
        return batchExecute;
    }

    public void setbatchExecute(BatchExecute batchExecute) {
        this.batchExecute = batchExecute;
    }

    public BatchBean getbatchBean() {
        return batchBean;
    }

    public void setbatchBean(BatchBean batchBean) {
        this.batchBean = batchBean;
    }

    public String batch_execute() throws IOException {
        batchExecute.batch_exe(batchBean);
            return batchExecute.getStdoutlist();
    }
}
