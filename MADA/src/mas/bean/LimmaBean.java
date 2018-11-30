package mas.bean;

/**
 * Created by Administrator on 2018/3/1.
 */
public class LimmaBean {
    private String input_exprSet_file;
    private String input_sampleSheet_file;
    private String arraytype;
    private String path;
    private String option;
    private int plot;
    private String P_Value;
    private String logFC;
    private String logFC1;
    private String cor1;
    private String cor1_type;
    private int cor;
    private String adjPval;

    public String getLogFC1() {
        return logFC1;
    }

    public void setLogFC1(String logFC1) {
        this.logFC1 = logFC1;
    }

    public String getAdjPval() {
        return adjPval;
    }

    public void setAdjPval(String adjPval) {
        this.adjPval = adjPval;
    }

    public String getArraytype() {
        return arraytype;
    }

    public void setArraytype(String arraytype) {
        this.arraytype = arraytype;
    }

    public int getCor() {
        return cor;
    }

    public void setCor(int cor) {
        this.cor = cor;
    }

    public String getCor1() {
        return cor1;
    }

    public void setCor1(String cor1) {
        this.cor1 = cor1;
    }

    public String getCor1_type() {
        return cor1_type;
    }

    public void setCor1_type(String cor1_type) {
        this.cor1_type = cor1_type;
    }

    public String getP_Value() {
        return P_Value;
    }

    public void setP_Value(String p_Value) {
        P_Value = p_Value;
    }

    public String getLogFC() {
        return logFC;
    }

    public void setLogFC(String logFC) {
        this.logFC = logFC;
    }

    public int getPlot() {
        return plot;
    }

    public void setPlot(int plot) {
        this.plot = plot;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getInput_exprSet_file() {
        return input_exprSet_file;
    }

    public void setInput_exprSet_file(String input_exprSet_file) {
        this.input_exprSet_file = input_exprSet_file;
    }

    public String getInput_sampleSheet_file() {
        return input_sampleSheet_file;
    }

    public void setInput_sampleSheet_file(String input_sampleSheet_file) {
        this.input_sampleSheet_file = input_sampleSheet_file;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }


}
