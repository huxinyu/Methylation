package mas.bean;

/**
 * Created by Administrator on 2018/3/1.
 */
public class BatchBean {
    private String input_exprSetsva_file;
    private String input_sampleSheetsva_file;
    private String path;
    private String batch;
    private int plot;

    public String getInput_exprSetsva_file() {
        return input_exprSetsva_file;
    }

    public void setInput_exprSetsva_file(String input_exprSetsva_file) {
        this.input_exprSetsva_file = input_exprSetsva_file;
    }

    public String getInput_sampleSheetsva_file() {
        return input_sampleSheetsva_file;
    }

    public void setInput_sampleSheetsva_file(String input_sampleSheetsva_file) {
        this.input_sampleSheetsva_file = input_sampleSheetsva_file;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public int getPlot() {
        return plot;
    }

    public void setPlot(int plot) {
        this.plot = plot;
    }
}
