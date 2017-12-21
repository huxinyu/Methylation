package mas.bean;

/**
 * Created by Administrator on 2016/11/29.
 */
public class LoadBean {
    //必选参数
    private String directory;
    private String resultsDir;
    private String methValue;

    //可选参数
    private String option;

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
