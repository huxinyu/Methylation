package mas.bean;

/**
 * Created by lily on 7/21/16.
 */
public class SOAPBean {
    private String reference;
    private String reads_single;
    private String reads_pair1;
    private String reads_pair2;
    private String path;
    private String option;
    private int type;
    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public String getReads_single() {
        return reads_single;
    }

    public void setReads_single(String reads_single) {
        this.reads_single = reads_single;
    }

    public String getReads_pair1() {
        return reads_pair1;
    }

    public void setReads_pair1(String reads_pair1) {
        this.reads_pair1 = reads_pair1;
    }

    public String getReads_pair2() {
        return reads_pair2;
    }

    public void setReads_pair2(String reads_pair2) {
        this.reads_pair2 = reads_pair2;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
