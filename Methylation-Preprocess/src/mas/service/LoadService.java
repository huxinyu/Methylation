package mas.service;

import mas.bean.LoadBean;
import mas.execute.LoadExecute;
import mas.execute.PBCExecute;
import mas.execute.SWANExecute;
import mas.execute.FunctionalNormalizeExecute;

import java.io.IOException;

/**
 * Created by Administrator on 2016/11/30.
 */
public class LoadService {
    private LoadBean loadBean;
    private LoadExecute loadExecute;
    private PBCExecute pbcExecute;
    private SWANExecute swanExecute;
    private FunctionalNormalizeExecute functionalNormalizeExecute;

    public LoadBean getLoadBean() {
        return loadBean;
    }

    public void setLoadBean(LoadBean loadBean) {
        this.loadBean = loadBean;
    }

    public LoadExecute getLoadExecute() {
        return loadExecute;
    }

    public void setLoadExecute(LoadExecute loadExecute) {
        this.loadExecute = loadExecute;
    }

    public PBCExecute getPbcExecute() {
        return pbcExecute;
    }

    public void setPbcExecute(PBCExecute pbcExecute) {
        this.pbcExecute = pbcExecute;
    }

    public void Load(){
        try {
            loadExecute.Load_execute(loadBean);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void PBC(){
        try {
            pbcExecute.PBC_execute(loadBean);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void SWAN(){
        try {
            swanExecute.SWAN_execute(loadBean);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void FunctionalNormalize(){
        try {
            functionalNormalizeExecute.FunctionalNormalize_execute(loadBean);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
