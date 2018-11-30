package mas.bean;

/**
 * Created by Administrator on 2018/2/1.
 */
public class PBCBean {
    //必选参数
    private String directory;
    private String resultsDir;
    private String methValue;
    private String arraytype;
    private String detPcut;
    private String filterXY;
    private String filterSNPs;
    private int plot;


    public String getDetPcut() {
        return detPcut;
    }

    public void setDetPcut(String detPcut) {
        this.detPcut = detPcut;
    }

    public String getFilterXY() {
        return filterXY;
    }

    public void setFilterXY(String filterXY) {
        this.filterXY = filterXY;
    }

    public String getFilterSNPs() {
        return filterSNPs;
    }

    public void setFilterSNPs(String filterSNPs) {
        this.filterSNPs = filterSNPs;
    }

    public int getPlot() {
        return plot;
    }

    public void setPlot(int plot) {
        this.plot = plot;
    }

    //可选参数
    private String option;

    public String getArraytype() {
        return arraytype;
    }

    public void setArraytype(String arraytype) {
        this.arraytype = arraytype;
    }

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

    public String getMethValue() {
        return methValue;
    }

    public void setMethValue(String methValue) {
        this.methValue = methValue;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public  String save(){
        System.out.println("save:"+this );
        return "detail";
    }
}
