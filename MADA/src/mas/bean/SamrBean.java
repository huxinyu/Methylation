package mas.bean;

/**
 * Created by Administrator on 2018/3/1.
 */
public class SamrBean {
    private String input_exprSetsamr_file;
    private String input_sampleSheetsamr_file;
    private String arraytype;
    private String path;
    private int plot;
    private String adjPval;
    private String methValue;

    public String getMethValue() {
        return methValue;
    }

    public void setMethValue(String methValue) {
        this.methValue = methValue;
    }

    public String getInput_exprSetsamr_file() {
        return input_exprSetsamr_file;
    }

    public void setInput_exprSetsamr_file(String input_exprSetsamr_file) {
        this.input_exprSetsamr_file = input_exprSetsamr_file;
    }

    public String getInput_sampleSheetsamr_file() {
        return input_sampleSheetsamr_file;
    }

    public void setInput_sampleSheetsamr_file(String input_sampleSheetsamr_file) {
        this.input_sampleSheetsamr_file = input_sampleSheetsamr_file;
    }

    public String getArraytype() {
        return arraytype;
    }

    public void setArraytype(String arraytype) {
        this.arraytype = arraytype;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public int getPlot() {
        return plot;
    }

    public void setPlot(int plot) {
        this.plot = plot;
    }

    public String getAdjPval() {
        return adjPval;
    }

    public void setAdjPval(String adjPval) {
        this.adjPval = adjPval;
    }
}
