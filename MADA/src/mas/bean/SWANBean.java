package mas.bean;

/**
 * Created by Administrator on 2018/2/2.
 */
public class SWANBean {

        //必选参数
        private String directory;
        private String resultsDir;
        private String methValue;
    private String detPcut;
    private String filterXY;
    private String filterSNPs;
        //可选参数
        private String option;
        private int plot;
    private String filterCRO;
    private String arraytype;

    public String getArraytype() {
        return arraytype;
    }

    public void setArraytype(String arraytype) {
        this.arraytype = arraytype;
    }

    public String getFilterCRO() {
        return filterCRO;
    }

    public void setFilterCRO(String filterCRO) {
        this.filterCRO = filterCRO;
    }

        public int getPlot() {
              return plot;
         }

        public void setPlot(int plot) {
        this.plot = plot;
    }

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


