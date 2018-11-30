package mas.bean;

/**
 * Created by Administrator on 2018/3/1.
 */
public class DmpFinderBean {
    private String input_exprSetdmpfinder_file;
    private String input_sampleSheetdmpfinder_file;
    private String arraytype;
    private String path;
    private int plot;
    private String adjPval;

    public String getInput_exprSetdmpfinder_file() {
        return input_exprSetdmpfinder_file;
    }

    public void setInput_exprSetdmpfinder_file(String input_exprSetdmpfinder_file) {
        this.input_exprSetdmpfinder_file = input_exprSetdmpfinder_file;
    }

    public String getInput_sampleSheetdmpfinder_file() {
        return input_sampleSheetdmpfinder_file;
    }

    public void setInput_sampleSheetdmpfinder_file(String input_sampleSheetdmpfinder_file) {
        this.input_sampleSheetdmpfinder_file = input_sampleSheetdmpfinder_file;
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
