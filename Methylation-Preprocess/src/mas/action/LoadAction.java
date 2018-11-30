package mas.action;

import com.opensymphony.xwork2.ActionSupport;
import mas.bean.LoadBean;
import mas.service.LoadService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by Administrator on 2016/11/29.
 */
public class LoadAction extends ActionSupport {
    private String directory;
    private String resultsDir;
    private String methValue;
    private int optionalParameters_Load;
    private String filterDetP, detSamplecut, detPcut, removeDetP, filterBeads, beadCutoff, filterNoCG, filterSNPs, filterMultiHit, filterXY;
    private String flag;

    public String getDirectory() {
        return directory;
    }

    public void setDirectory(String directory) {
        this.directory = directory;
    }

    public String getResultsDir() {
        return resultsDir;
    }

    public void setResultsDir(String resultsDir) {
        this.resultsDir = resultsDir;
    }

    public int getOptionalParameters_Load() {
        return optionalParameters_Load;
    }

    public void setOptionalParameters_Load(int optionalParameters_Load) {
        this.optionalParameters_Load = optionalParameters_Load;
    }

    public String getMethValue() {
        return methValue;
    }

    public void setMethValue(String methValue) {
        this.methValue = methValue;
    }

    public String getFilterDetP() {
        return filterDetP;
    }

    public void setFilterDetP(String filterDetP) {
        this.filterDetP = filterDetP;
    }

    public String getDetSamplecut() {
        return detSamplecut;
    }

    public void setDetSamplecut(String detSamplecut) {
        this.detSamplecut = detSamplecut;
    }

    public String getDetPcut() {
        return detPcut;
    }

    public void setDetPcut(String detPcut) {
        this.detPcut = detPcut;
    }

    public String getRemoveDetP() {
        return removeDetP;
    }

    public void setRemoveDetP(String removeDetP) {
        this.removeDetP = removeDetP;
    }

    public String getFilterBeads() {
        return filterBeads;
    }

    public void setFilterBeads(String filterBeads) {
        this.filterBeads = filterBeads;
    }

    public String getBeadCutoff() {
        return beadCutoff;
    }

    public void setBeadCutoff(String beadCutoff) {
        this.beadCutoff = beadCutoff;
    }

    public String getFilterNoCG() {
        return filterNoCG;
    }

    public void setFilterNoCG(String filterNoCG) {
        this.filterNoCG = filterNoCG;
    }

    public String getFilterSNPs() {
        return filterSNPs;
    }

    public void setFilterSNPs(String filterSNPs) {
        this.filterSNPs = filterSNPs;
    }

    public String getFilterMultiHit() {
        return filterMultiHit;
    }

    public void setFilterMultiHit(String filterMultiHit) {
        this.filterMultiHit = filterMultiHit;
    }

    public String getFilterXY() {
        return filterXY;
    }

    public void setFilterXY(String filterXY) {
        this.filterXY = filterXY;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    private ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");

    public String Load_exe() {
        LoadService loadService = (LoadService) applicationContext.getBean("loadService");
        LoadBean loadBean = new LoadBean();
        loadBean.setDirectory(directory);
        loadBean.setMethValue(methValue);
        loadBean.setResultsDir(resultsDir);
        if (optionalParameters_Load == 1) {
            loadBean.setOption("");
        } else {
            loadBean.setOption("filterDetP=" + filterDetP + ",detSamplecut=" + detSamplecut + ",detPcut=" + detPcut + "," + "removeDetP=" + removeDetP + "," + "filterBeads=" + filterBeads + "," + "beadCutoff=" + beadCutoff + "," + "filterNoCG=" + filterNoCG + "," + "filterSNPs=" + filterSNPs + "," + "filterMultiHit=" + filterMultiHit + "," + "filterXY=" + filterXY);
        }
        loadService.setLoadBean(loadBean);
        loadService.Load();
        return SUCCESS;
    }

    public String PBC_exe() {
        LoadService loadService = (LoadService) applicationContext.getBean("loadService");
        LoadBean loadBean = new LoadBean();
        loadBean.setDirectory(directory);
        loadBean.setMethValue(methValue);
        loadBean.setResultsDir(resultsDir);
        if (optionalParameters_Load == 1) {
            loadBean.setOption("");
        } else {
            loadBean.setOption("filterDetP=" + filterDetP + ",detSamplecut=" + detSamplecut + ",detPcut=" + detPcut + "," + "removeDetP=" + removeDetP + "," + "filterBeads=" + filterBeads + "," + "beadCutoff=" + beadCutoff + "," + "filterNoCG=" + filterNoCG + "," + "filterSNPs=" + filterSNPs + "," + "filterMultiHit=" + filterMultiHit + "," + "filterXY=" + filterXY);
        }
        loadService.setLoadBean(loadBean);
        loadService.PBC();
        return SUCCESS;
    }

    public String SWAN_exe() {
        LoadService loadService = (LoadService) applicationContext.getBean("loadService");
        LoadBean loadBean = new LoadBean();
        loadBean.setDirectory(directory);
        loadBean.setMethValue(methValue);
        loadBean.setResultsDir(resultsDir);
        if (optionalParameters_Load == 1) {
            loadBean.setOption("");
        } else {
            loadBean.setOption("filterDetP=" + filterDetP + ",detSamplecut=" + detSamplecut + ",detPcut=" + detPcut + "," + "removeDetP=" + removeDetP + "," + "filterBeads=" + filterBeads + "," + "beadCutoff=" + beadCutoff + "," + "filterNoCG=" + filterNoCG + "," + "filterSNPs=" + filterSNPs + "," + "filterMultiHit=" + filterMultiHit + "," + "filterXY=" + filterXY);
        }
        loadService.setLoadBean(loadBean);
        loadService.SWAN();
        return SUCCESS;
    }

    public String FunctionalNormalize_exe() {
        LoadService loadService = (LoadService) applicationContext.getBean("loadService");
        LoadBean loadBean = new LoadBean();
        loadBean.setDirectory(directory);
        loadBean.setMethValue(methValue);
        loadBean.setResultsDir(resultsDir);
        if (optionalParameters_Load == 1) {
            loadBean.setOption("");
        } else {
            loadBean.setOption("filterDetP=" + filterDetP + ",detSamplecut=" + detSamplecut + ",detPcut=" + detPcut + "," + "removeDetP=" + removeDetP + "," + "filterBeads=" + filterBeads + "," + "beadCutoff=" + beadCutoff + "," + "filterNoCG=" + filterNoCG + "," + "filterSNPs=" + filterSNPs + "," + "filterMultiHit=" + filterMultiHit + "," + "filterXY=" + filterXY);
        }
        loadService.setLoadBean(loadBean);
        loadService.FunctionalNormalize();
        return SUCCESS;
    }
}

